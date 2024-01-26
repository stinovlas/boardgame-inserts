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

module MainCardBox() { RoundCardBox([ 93, 133, 31 ], dividers = [ [133 / 2], [] ]); }
