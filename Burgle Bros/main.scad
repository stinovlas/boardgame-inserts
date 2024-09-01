/*
 * Game box inner dimensions: [174, 66.5, 96]
 *
 * Rules: [174, 96, 2]
 * Cards: [63, 63, 46]
 */
// clang-format off
include <../lib/boxes.scad>;
include <../lib/cardboxes.scad>;
include <../lib/dividers.scad>;
include <../lib/trays.scad>;
// clang-format on

$fa = 1;
$fs = 0.4;

WALL_WIDTH = 1.26;
BOTTOM_HEIGHT = 1.2;
STACK_HEIGHT = 3.0;
STACK_LEEWAY = 0.2;
RADIUS = 3.0;

module CardsBox() {
    difference() { // 99 -> 66
        SquareBox([ 64, 66.5, 65 ]);
        translate([ 70, (66.5 - 35) / 2, 15 ]) rotate([ 0, -90, 0 ]) RoundCube([ 100, 35, 100 ], radius = 5);
        translate([ 30, 66.5 / 2, 76 ]) rotate([ 45, 0, 0 ]) rotate([ 0, 90, 0 ]) cube([ 50, 50, 100 ], center = true);
    }
}

module TokensTray1() { RoundTray([ 64, 108, 14 ], slopes = 4, angle = 35, dividers = [ [108 / 2 + 5], [64 / 2] ]); }

module TokensTray2() {
    RoundTray([ 64, 108, 20 ], slopes = 2, angle = 33, dividers = [ [ 108 / 3, 108 * 2 / 3 ], [] ]);
}

module MeeplesBox() {
    difference() {
        SquareBox([ 65, 64, 22.5 ]);
        hull() {
            translate([ 0, 64 / 2, 22.5 / 2 + 5 ]) rotate([ 0, 90, 0 ]) cylinder(h = 10, d = 18, center = true);
            translate([ 0, 64 / 2, 50 ]) rotate([ 0, 90, 0 ]) cylinder(h = 10, d = 18, center = true);
        }
    }
}

// module WallsBox() { SquareBox([ 21, 52, 40 ]); }
// module WallsBox() {
//     difference() {
//         SquareBox([ 32, 66, 35.5 ], wall_width = 0.84);
//         translate([ -10, (66 - 36) / 2, BOTTOM_HEIGHT ]) cube([ 50, 36, 50 ]);
//     }
// }

module DiceBox() {
    RoundBox([ 64, 66, 14 ], bottom_height = 1.0);
    //
}

module WallsBox() {
    difference() {
        union() {

            SquareBox([ 64, 66, 21 ], wall_width = 0.84);
            cube([ 7, 13, 21 ]);
            translate([ 0, 53, 0 ]) cube([ 7, 13, 21 ]);
            translate([ 57, 0, 0 ]) cube([ 7, 13, 21 ]);
            translate([ 57, 53, 0 ]) cube([ 7, 13, 21 ]);
        }
        translate([ -1, 13, -1 ]) cube([ 8, 66 - 2 * 13, 23 ]);
        translate([ 57, 13, -1 ]) cube([ 8, 66 - 2 * 13, 23 ]);
        translate([ 22, 11, -4 ]) linear_extrude(10) {
            translate([ 2, 0 ]) square([ 16, 30 ]);
            translate([ 10, 15 ]) rotate(45) difference() {
                square([ 20, 20 ]);
                translate([ 30, -30 ]) rotate(45) square([ 10 * sqrt(2), 100 ]);
            }
        }
    }
}

module LidSpacer() {
    wall_width = 0.86;
    bottom_height = 1.0;
    SquareBox(
        [ 174.5 + 2 * wall_width, 68 + 2 * wall_width, 23.5 + bottom_height ], bottom_height = bottom_height,
        wall_width = wall_width
    );

    // wall_width = 0.7;
    //
    // difference() {
    //     cube([ 173.5 + 2 * wall_width, 66.5 + 2 * wall_width, 17 ]);
    //     translate([ wall_width, wall_width, -1 ]) cube([ 173.5, 66.5, 19 ]);
    // }
}

LidSpacer();
// WallsBox();
// DiceBox();
// MeeplesBox();
// CardsBox();
// TokensTray1();
// translate([ 23, 12, 0 ]) color("red") cylinder(d = 18.5, h = 3);
// translate([ 40, 24, 0 ]) color("red") cylinder(d = 18.5, h = 3);
