/*
 * Game box inner dimensions: [286, 286, 72.5]
 *
 * Player boards (six) [280, 200, 23]
 * Cards: [87, 57]
 * Goal tiles: [26, 26, 32]
 * Duet goal tiles: [26, 26, 12]
 * Boards height: 4
 * Rules hight: 10
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
 * + cards
 *   - birds
 *   - goals
 *   - automa
 *   - offer of 3 cards!
 * + food tokens (5 + 1 types)
 * - dices (2*5)
 * - round end tiles
 *   - normal
 *   - duet
 * + boards
 *   - 6 player boards
 *   - one feeder board
 *   - one card offer board
 *   - duet / flock board
 *   - turn end bonuses board/card
 * + eggs
 * - duet jing/jang tokens
 * + rules
 */

module DoubleCardBox() {
    RoundCardBox([ 66, 92 * 2, 35.5 ], dividers = [ [92], [] ]);
    Dividers([ 66, 92 * 2, 4 ], dividers = [ [], [54] ]);
}
module FoodTokensTray() { RoundTray([ 86, 170, 15 ], slopes = 2, dividers = [ [ 170 / 3, 170 * 2 / 3 ], [] ]); }

// Goal tiles: [26, 26, 32]
// Duet goal tiles: [26, 26, 12]
// module GoalTilesBox() { RoundBox([ 30, 48, 28 ]); }

module EggsBox() { RoundBox([ 86, 115 / 2, 30 ]); }

// module PlayerCubesBox() { RoundBox([ 170 / 5, 50, 21 ]); }
module PlayerCubesBox() { RoundBox([ 34.4, 51.6, 26 ]); }
