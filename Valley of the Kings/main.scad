/*
 * Game box inner dimensions: [93, 133, 33]
 *
 * Cards: [89, 64, 32]
 */
// clang-format off
include<../lib/boxes.scad>;
include<../lib/cardboxes.scad>;
// clang-format on

$fa = 1;
$fs = 0.4;

WALL_WIDTH = 1.26;
BOTTOM_HEIGHT = 1.2;
STACK_HEIGHT = 2.5;
STACK_LEEWAY = 0.2;
RADIUS = 3.0;

module MainCardBox() {
    RoundCardBox([ 93, 133, 31 ], dividers = [ [133 / 2], [] ]);
    Dividers([ 93, 133, 3.5 ], dividers = [ [], [93 - 8] ]);
}
