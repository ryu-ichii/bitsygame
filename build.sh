#!/bin/bash
# build.sh — injects game.bitsy back into index.html
# Run this after editing game.bitsy: ./build.sh

GAME="game.bitsy"
HTML="index.html"

if [ ! -f "$GAME" ]; then
  echo "Error: $GAME not found."
  exit 1
fi

if [ ! -f "$HTML" ]; then
  echo "Error: $HTML not found."
  exit 1
fi

# Replace everything between the bitsyGameData script tags with game.bitsy contents
python3 - <<'EOF'
import re

with open("game.bitsy", "r") as f:
    new_data = f.read().strip()

with open("index.html", "r") as f:
    html = f.read()

# Match content between the bitsyGameData script open and close tags
pattern = r'(<script type="text/bitsyGameData" id="exportedGameData">)(.*?)(</script>)'
replacement = r'\g<1>\n' + new_data + r'\n\g<3>'
new_html, count = re.subn(pattern, replacement, html, flags=re.DOTALL)

if count == 0:
    print("Error: could not find bitsyGameData block in index.html")
    exit(1)

with open("index.html", "w") as f:
    f.write(new_html)

print("Done! index.html updated from game.bitsy.")
EOF
