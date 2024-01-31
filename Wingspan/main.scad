/*
 * Game box inner dimensions: [286, 286, 72.5]
 *
 * Player boards (six) [280, 200, 23]
 * Cards: [87, 57]
 * Bonus tiles: [26, 26, 32]
 * Duet bonus tiles: [26, 26, 12]
 *
 * Food tray: [*, 50, *]
 */
// clang-format off
include<../lib/boxes.scad>;
include<../lib/cardboxes.scad>;
include<../lib/trays.scad>;
// clang-format on

$fa = 1;
$fs = 0.4;

WALL_WIDTH = 1.26;
BOTTOM_HEIGHT = 1.2;
STACK_HEIGHT = 2.5;
STACK_LEEWAY = 0.2;
RADIUS = 3.0;

/*
 * All components:
 * - cards
 *   - birds
 *   - goals
 *   - automa
 *   - offer of 3 cards!
 * - food tokens (5 + 1 types)
 * - dices (2*5)
 * - round end tiles
 *   - normal
 *   - duet
 * - boards
 *   - 5 player boards
 *   - one feeder board
 *   - one card offer board
 *   - duet / flock board
 *   - turn end bonuses board/card
 * - eggs
 * - duet jing/jang tokens
 * - rules
 */

module DoubleCardBox() { RoundCardBox([ 92, 199 * 2 / 3, 44 ], dividers = [ [199 / 3], [] ]); }
module SingleCardBox() { RoundCardBox([ 92, 199 / 3, 44 ]); }
module TokenTray() { RoundTray([ 86, 170, 15 ], slopes = 2, dividers = [ [ 170 / 3, 170 * 2 / 3 ], [] ]); }
