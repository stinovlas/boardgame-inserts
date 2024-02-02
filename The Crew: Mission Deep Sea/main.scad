/*
 * Game box inner dimensions: [171.5, 121, 37]
 *
 * Small cards: [68, 44]
 * Big cards: [87, 56]
 * Rulebooks height: 3
 */
// clang-format off
include <../lib/boxes.scad>;
include <../lib/cardboxes.scad>;
// clang-format on

$fa = 1;
$fs = 0.4;
WALL_WIDTH = 0.86;
BOTTOM_HEIGHT = 1.0;
RADIUS = 3.0;

module TaskCardBox() { RoundCardBox([ 73, 48, 34 ]); }
module DeckCardBox() { RoundCardBox([ 92, 66, 34 ]); }
module TokenBox() { RoundBox([ 32, 48, 34 ]); }
module Spacer() { RoundSpacer([ 75, 29, 6 ], wall_width = 1.67); }
