# meet the dealer — Editing Guide

## How to Edit

1. **Edit `game.bitsy`** — this file has all the game content (text, rooms, items)
2. **Run `./build.sh`** — this injects your changes back into `index.html`
3. **Open `index.html`** in a browser to test

> You can also edit `index.html` directly if you prefer — the game data is inside the
> `<script type="text/bitsyGameData">` block near the top of the file.

---

## Dialogue Reference

All text uses `{pg}` to mean "page break" (player presses a key to continue).

| Character / Object | Dialog ID | Text |
|--------------------|-----------|------|
| **bed** | `b` | `the bed is unmade.` / `it always is.` |
| **tv** | `tv` | `the tv is static.` / `you don't turn it off.` |
| **ashtray** | `as` | `the ashtray is fuller than it should be.` |
| **chair** | `ch` | `your jacket is on the chair.` / `you'll need it.` |
| **window** | `wn` | `rain on the glass.` / `the streetlight is the only color outside.` |
| **fan** | `fn` | `the ceiling fan is still broken.` / `it just clicks.` |
| **mirror** | `mr` | `you catch your reflection.` / `you don't recognize tonight's face.` |
| **sink** | `sk` | `the faucet drips.` / `you've been meaning to fix it.` |
| **calendar** | `cl` | `the calendar still says last month.` |
| **phone** | `ph` | `the voicemail light is blinking.` / `you don't press play.` |
| **neighbor** | `nb` | `"you got a light?"` / `"..."` / `"watch yourself out there tonight."` |
| **figure** | `fg` | `"spare anything?"` / `"...didn't think so."` |
| **rat** | `rt` | `it doesn't look at you.` |
| **cat** | `ct` | `"..."` / `it watches you go.` |
| **the dealer** | `dl` | (see full text below) |
| **$40** (item) | `i0` | `forty bucks.` / `enough.` |
| **a photograph** (item) | `i1` | `a polaroid.` / `someone you used to love.` / `you put it face-down again.` |
| **a lighter** (item) | `i2` | `you pocket the lighter.` |
| **empty bottle** (item) | `i3` | `empty.` / `of course.` |

### Full Dealer Dialog (`DLG dl`)
```
"you're late."
"you got the money?"
"...yeah."
"don't look at me like that."
"everybody who comes here looks at me like that."
he holds out his hand.
you put forty dollars in it.
"breathe through it. don't take it all at once."
"and don't come back tomorrow."
you both know you'll come back tomorrow.
home, after.
the ceiling fan is still broken.
```

To edit any dialog, find it in `game.bitsy` by its `DLG` id (e.g. `DLG dl`) and change the text on the line below it.

---

## Room Layouts

Each room is a 16×16 grid. Tile key:

| Symbol | Tile Name | Solid? |
|--------|-----------|--------|
| `0` | empty floor | no |
| `a` | wall | yes |
| `b` | curb | no |
| `c` | door (exit) | no |
| `d` | trash | no |
| `e` | dumpster | yes |
| `f` | crack | no |
| `g` | pipe | yes |
| `h` | graffiti | no |
| `i` | neon_l | no |
| `j` | neon_r | no |

Sprites are placed separately (see the `SPR` blocks in `game.bitsy`), not in the grid.

---

### ROOM 0 — "your apartment"  (palette: bruise 🟣)
```
Col:  0 1 2 3 4 5 6 7 8 9 …
Row 0: a a a a a a a a a a a a a a a a   ← top wall
Row 1: a . . . . . . . . . . . . . . a
Row 2: a . . . . . . . . . . . . . . a
Row 3: a . . . . . . . . . . . . . . a   ← bed (sprite) at 3,3
Row 4: a . . . . . . . . . . . . . . a
Row 5: a . . . . . . . . . . . . . . a
Row 6: a . . . . . . . . . . . . . . a   ← chair (sprite) at 3,6
Row 7: a . . . . . . . . . . . . . . a
Row 8: a . . . d . . . . d . . . . . a   ← trash tiles; items here too
Row 9: a . . . . . . . . . . . . . . a   ← sink (sprite) at 3,9
Row10: a . . . . . . . . . . . . . . a
Row11: a . . . . . . . . . . . . . . a   ← ashtray (sprite) at 6,11; calendar at 3,11; phone at 13,11
Row12: a . . . . . . . . . . . . . . a
Row13: a a a a a a a c a a a a a a a a   ← door at col 7 → stairwell
Row14: b b b b b b b b b b b b b b b b   ← curb (decorative)
Row15: . . . . . . . . . . . . . . . .
```
**Sprites in this room:** bed (3,3), tv (6,1), window (1,1), fan (7,2), mirror (13,1), chair (3,6), sink (3,9), calendar (3,11), ashtray (6,11), phone (13,11)
**Items in this room:** $40 at (7,8), photograph at (10,4), lighter at (4,8), bottle at (11,6)
**Exit:** door at (7,13) → stairwell, player arrives at (7,1)

---

### ROOM 1 — "the stairwell"  (palette: amber 🟠)
```
Row 0: a a a a a a a a a a a a a a a a
Row 1: a a a a a a a c . . a a a a a a   ← door col 7 → apartment
Row 2: a . . . . . . . . . . . . . . a
Row 3: a . . . . . . . . . . . . . . a
Row 4: a . . . . . . d . . . . . . . a   ← trash
Row 5: a . . . . . . . . . . . . . . a
Row 6: a . . . . . . . . . . . . . . a
Row 7: a . . . . . . . . . . . . . . a   ← neighbor (sprite) at 7,7
Row 8: a . . . . . . . . . . . . . . a
Row 9: a . . . . . . . . . . . . . . a
Row10: a . . . . . . d . d . . . . . a   ← trash
Row11: a . . . . . . . . . . . . . . a
Row12: a . . . . . . . . . . . . . . a
Row13: a a a a a a a c . . a a a a a a   ← door col 7 → street
Row14: a a a a a a a a a a a a a a a a
Row15: . . . . . . . . . . . . . . . .
```
**Sprites:** neighbor (7,7)
**Exits:** door (7,1) → apartment; door (7,13) → street

---

### ROOM 2 — "the street"  (palette: noir ⬛)
```
Row 0: i i . . . . . . . . . . . . j j   ← neon signs top corners
Row 1: i i . . . . . . . . . . . . j j
Row 2: . . . . . . . . . . . . . . . .
Row 3: . . . . . . . . . . . . . . . .
Row 4: b b b b b b b b b b b b b b b b   ← curb (upper sidewalk)
Row 5: . . . . . . . . . . . . . . . .
Row 6: . . . . . d . . . . . . . . . .   ← trash
Row 7: . . . . . f . . . . . . . . . .   ← crack
Row 8: . . . . . . . . . . . . . . . .
Row 9: . . . . . . . . . . . . d . . .   ← trash
Row10: . . . . f . . . . . . . . . . .   ← crack
Row11: . . . . . . . . . . . . . . . .
Row12: b b b b b b b b b b b b b b b b   ← curb (lower sidewalk)
Row13: . . . . . . . . . . . . . . . .
Row14: . . . . . . . . . . . . . . . .
Row15: . . . . . . . c . . . . . . . .   ← door at col 7 → alley; player starts here from stairwell
```
**Sprites:** figure (3,6), rat (11,9)
**Exits:** top (7,0) → stairwell; bottom door (7,15) → alley

---

### ROOM 3 — "the alley"  (palette: sick 🟢)
```
Row 0: a a a a a a a a a a a a a a a a
Row 1: a a a a a a c . . . . . . . a a   ← door at col 6 → street
Row 2: a . . . . . . . . . . . . . . a
Row 3: e . . . . . . . . . . . . . . a   ← dumpster
Row 4: e . . . . . . . . . . . . . . a   ← dumpster
Row 5: a . . . . . d . . . . . . . . a   ← trash
Row 6: a . . . . . . . . . . . . . . a
Row 7: a . . . . . . . . . . . . . . a
Row 8: a . . . . . . . . . . . . . . a
Row 9: a . . . . . d . . . . . . . . e   ← trash; dumpster right
Row10: a . . . . . . . . . . . . . . e   ← dumpster right
Row11: a . . . . . . . . . . . . . . a
Row12: a . . h . . . . . . . . . . . a   ← graffiti
Row13: a . . . . . . . . . . . . . . a
Row14: a . . . . . . . . . . . . . c a   ← door at col 14 → the corner
Row15: a a a a a a a a a a a a a a a a
```
**Sprites:** cat (6,11)
**Exits:** door (6,1) → street; door (14,14) → the corner

---

### ROOM 4 — "the corner"  (palette: bloody 🔴)
```
Row 0: a a a a a a a a a a a a a a a a
Row 1: a . . . . . . . . . . . . . . a
Row 2: a . . . . . . . . . . . . . . a
Row 3: a . . . . . . g . . . . . . . a   ← pipe
Row 4: a . . . . . . . . . . . . . . a
Row 5: a . . . . . . . . . . . . . . a
Row 6: a . . . . . . . . . . . . . . a
Row 7: a . . . . . . . . . . . . . . a
Row 8: c . . . . . . . . . . . . . . a   ← door at col 0 → alley; player starts here
Row 9: a . . . . . . . . . . . . . . a
Row10: a . . . . . . . . . . . . . . a
…
Row15: a a a a a a a a a a a a a a a a
```
**Sprites:** the dealer (9,8)
**Exit:** door (0,8) → alley, player arrives at (13,14)

---

## Plot Flow

```
[your apartment]  ──exit(7,13)──▶  [the stairwell]  ──exit(7,13)──▶  [the street]
       ▲                                   ▲                                │
       └──────── exit(7,1) ────────────────┘                                │
                                                                    exit(7,15)
                                                                            │
                                                                            ▼
                                                                      [the alley]
                                                                            │
                                                                    exit(14,14)
                                                                            │
                                                                            ▼
                                                                     [the corner]
                                                               (meet the dealer here)
```

**Narrative arc:**
- You wake up in your apartment (all the details reinforce who you are)
- You pass the neighbor in the stairwell ("watch yourself out there tonight")
- You cross the street (figure begs, rat ignores you)
- Through the alley (cat watches)
- To the corner — the dealer

---

## Changing Room Connections (Exits)

Exits are defined in the `ROOM` block as:
```
EXT col,row  DESTINATION_ROOM  arrival_col,arrival_row
```

Example — the apartment door:
```
EXT 7,13 1 7,1
```
→ stepping on tile (7,13) in room 0 takes you to room 1, arriving at (7,1)

To move a door, change the tile position in both the grid AND the `EXT` line.

---

## Moving Sprites

Each sprite has a `POS room_id col,row` line. Change the numbers to reposition it.

Example — move the dealer:
```
POS 4 9,8   →   POS 4 5,5
```

---

## Color Palettes

Each palette has 3 colors (background, tile, sprite) as `R,G,B`:
```
PAL 0        ← palette id
26,14,34     ← background color
91,138,74    ← tile/wall color
232,220,192  ← sprite/text color
NAME bruise
```

Change any RGB value to shift the mood of that room.
