/*
 * Game box inner dimensions: [215, 279, 68]
 *
 * Cards: []
 *
 * Factions (meeples, tokens)
 * - Cats:        25, 28
 * - Lizards:     25, 17
 * - Moles:       20, 10, 9 crowns, 1 big burrow token
 * - Rats:        21, 12, 1 dice
 *
 * - Birds:       20, 8
 * - Badgers:     15, 16
 *
 * - Crows:       15, 17
 * - Otters:      15, 10, 3 beads
 * - WA:          10, 14
 *
 * - Vagabonds:  2/9, 46 (10 + 9 + 4) x2
 *
 * Hirelings:
 * - Cats:        12
 *
 * - Moles:        8, 3
 * - Badgers:      6, 6
 *
 * - Crows:        6
 * - Rats:         6
 * - Birds:        5
 * - Band:         5
 * - WA:           4
 * - Bandits:      4
 * - Lizards:      4
 *
 * - Bead:         1 (large), 3
 * - Deer:         1 (large)
 * - Otters:       1 (largs)
 *
 * Landmarks: 6 (large)
 */
// clang-format off
include<../lib/boxes.scad>;
include<../lib/cardboxes.scad>;
include<../lib/dividers.scad>;
include<../lib/trays.scad>;
// clang-format on

$fa = 1;
$fs = 0.4;

WALL_WIDTH = 1.26;
BOTTOM_HEIGHT = 1.2;
STACK_HEIGHT = 2.5;
STACK_LEEWAY = 0.2;
RADIUS = 3.0;

module LargeFactionBox() { RoundBox([ 59.5, 115, 32 ], dividers = [ [25], [] ]); }

module MediumFactionBox() {
    RoundBox([ 71.5, 82, 32 ]);
    translate([ 30, 15, 0 ]) intersection() {
        RoundBox([ 10, 10, 32 ]);
        translate([ 5, 5, 0 ]) cube([ 10, 10, 32 ]);
    }
    Dividers([ 38, 23, 32 ], [ [25 - WALL_WIDTH / 2], [40 - WALL_WIDTH / 2] ]);
}

module MolesFactionBox() {
    difference() {
        union() {
            RoundBox([ 71.5, 82, 32 ], dividers = [ [28], [] ]);
            Dividers([ 71.5, 28, 32 ], dividers = [ [], [28] ]);
            translate([ 0, 82 - 3, 0 ]) Dividers([ 71.5, 3, 32 ], dividers = [ [], [71.5 - WALL_WIDTH - 59.5 / 2] ]);
            translate([ 71.5 - 3, 0, 0 ]) Dividers([ 3, 82, 32 ], dividers = [ [82 - WALL_WIDTH - 59.5 / 2], [] ]);
        }
        translate([ 71.5 - 59.5 / 2 - WALL_WIDTH, 82 - 59.5 / 2 - WALL_WIDTH, 32 - 2 ]) color("red")
            cylinder(h = 2.001, d = 59.5);
    }
}

module SmallFactionBox() { RoundBox([ 71.5, 82 * 2 / 3, 32 ], dividers = [ [], [25] ]); }

module AllCardsBox() {
    difference() {
        union() {
            RoundBox([ 115, 95, 64 ]);
            intersection() {
                hull() { RoundBox([ 115, 92, 64 ]); }
                translate([ 20, WALL_WIDTH / 2 + 0.2, 0 ]) rotate([ 0, -atan(20 / 64), 0 ])
                    cube([ WALL_WIDTH, 92 - WALL_WIDTH - 0.4, 68 ]);
            }
        }
        translate([ -5, 92 / 2, 64 ]) rotate([ 0, 90, 0 ]) cylinder(h = 125, d = 50);
        translate([ 55 - WALL_WIDTH, 20, BOTTOM_HEIGHT ]) cube([ 60, 52, 65 ]);
    }
}

module VagabondBox() {
    cutout_radius = (71.5 - 4 * WALL_WIDTH) / 6;
    difference() {
        union() {
            RoundBox([ 82 * 2 / 3, 71.5, 22 ]);
            Dividers([ 24, 71.5, 22 ], [
                [ 2 * cutout_radius + 1.5 * WALL_WIDTH, 4 * cutout_radius + 2.5 * WALL_WIDTH ], [24 - WALL_WIDTH / 2]
            ]);
        }
        translate([ -1, cutout_radius + WALL_WIDTH, 22 ]) rotate([ 0, 90, 0 ]) cylinder(h = 30, r = cutout_radius);
        translate([ -1, 3 * cutout_radius + 2 * WALL_WIDTH, 22 ]) rotate([ 0, 90, 0 ])
            cylinder(h = 30, r = cutout_radius);
        translate([ -1, 5 * cutout_radius + 3 * WALL_WIDTH, 22 ]) rotate([ 0, 90, 0 ])
            cylinder(h = 30, r = cutout_radius);
    }
}

module ItemsOffer() {
    // 130 x 42
    depth = 42;
    width = 122.5;
    distance = (width - 18.5 * 6) / 7;
    difference() {
        RoundCube([ depth, width, 2 + BOTTOM_HEIGHT ], radius = 2);
        translate([ WALL_WIDTH, 0, 0 ]) {
            for (i = [0:5]) {
                translate([ 0, distance + i * (distance + 18.5), BOTTOM_HEIGHT ])
                    RoundCube([ 18.5, 18.5, 3 ], radius = 2);
                translate([ -6, distance + i * (distance + 18.5) + (18.5 - 12) / 2, -1 ]) cube([ 20.5, 12, 5 ]);
            }
        }
        translate([ depth - 18.5 - WALL_WIDTH, 0, 0 ]) {
            for (i = [0:5]) {
                translate([ 0, distance + i * (distance + 18.5), BOTTOM_HEIGHT ])
                    RoundCube([ 18.5, 18.5, 3 ], radius = 2);
                translate([ 4, distance + i * (distance + 18.5) + (18.5 - 12) / 2, -1 ]) cube([ 20.5, 12, 5 ]);
            }
        }
    }
}

module CardSeparator() {
    difference() {
        RoundCube([ 65, 88, WALL_WIDTH ]);
        translate([ 0, 88 / 2, -5 ]) cylinder(h = 10, d = 54);
    }
}

module LandmarksDiceBox() { RoundBox([ 59.5, 115, 32 ], dividers = [ [62], [] ]); }

module ResinMarkersBox() { RoundBox([ 59.5, 115, 32 ], dividers = [ [25], [] ]); }

module LonersHirelingsBox() {
    RoundBox([ 71.5, 82 * 2 / 3, 22 ], dividers = [ [], [71.5 / 2 - 5] ]);
    Dividers([ 71.5 / 2 - 5, 82 * 2 / 3, 22 ], dividers = [ [82 * 2 / 3 - 15], [] ]);
}

module LargeCardsBox() { RoundCardBox([ 71.5, 82 * 2, 10 ], dividers = [ [125], [] ]); }
module HirelingsDiceBox() { RoundBox([ 71.5, 82 * 2 / 3, 22 ], dividers = [ [], [20] ]); }
module SmallHirelingsBox() { RoundBox([ 71.5, 82 * 2 / 3, 22 ], dividers = [ [], [71.5 / 2 - 5] ]); }
module LargeHirelingsBox() { RoundBox([ 71.5, 82 * 2 / 3, 32 ], dividers = [ [], [71.5 / 2 - 5] ]); }

module RuinsHolder() {
    RoundBox([ 82, 28, 2 + BOTTOM_HEIGHT ]);
    translate([ 4.75, -1, 0 ]) RoundCube([ 11, 4, BOTTOM_HEIGHT ], radius = 0.5);
    translate([ 82 - 4.75 - 11, -1, 0 ]) RoundCube([ 11, 4, BOTTOM_HEIGHT ], radius = 0.5);
}

module SpareTokensBox() { RoundBox([ 71.5, 82 * 2, 10 ], dividers = [ [ 82 * 2 / 5, 82, 82 * 8 / 5 ], [] ]); }
