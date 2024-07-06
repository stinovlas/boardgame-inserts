// clang-format off
include<../lib/cardboxes.scad>;
include<../lib/cubes.scad>;
include<../lib/defaults.scad>;
include<../lib/dividers.scad>;
include<../lib/trays.scad>;
// clang-format on
//
$fa = 1;
$fs = 0.4;

WALL_WIDTH = 0.86;
BOTTOM_HEIGHT = 0.86;
STACK_HEIGHT = 2.5;
STACK_LEEWAY = 0.2;
RADIUS = 2.0;

module CoinCutout() {
    translate([ 0, 0, BOTTOM_HEIGHT ]) {
        translate([ 0, 21 / 2, 0 ]) cylinder(h = 19, d = 21, center = false);
        translate([ -15, 3, 0 ]) cube([ 15, 15, 19 ]);
    }
    translate([ 0, 0, -1 ]) {
        translate([ 0, 21 / 2, 0 ]) cylinder(h = 19, d = 15, center = false);
        translate([ -15, 3, 0 ]) cube([ 15, 15, 19 ]);
    }
}

module Insert() {
    difference() {
        // box shell
        union() {
            translate([ 0, 10, 0 ]) RoundCube([ 58, 93, 17 + BOTTOM_HEIGHT ]);
            RoundCube([ 58, 20, 17 + BOTTOM_HEIGHT ], radius = 0.5);
        }

        // finger cutout
        translate([ (58 - 11) / 2, 46, -1 ]) RoundCube([ 11, 14, 20 ], radius = RADIUS);

        // coins compartments
        union() {
            translate([ 10.5, 0.8, 0 ]) CoinCutout();
            translate([ 10.5, 22.8, 0 ]) CoinCutout();
            translate([ 10.5, 44.8, 0 ]) CoinCutout();
            translate([ 58 - 21 / 2, 21 + 0.8, 0 ]) rotate([ 0, 0, 180 ]) CoinCutout();
            translate([ 58 - 21 / 2, 21 + 22.8, 0 ]) rotate([ 0, 0, 180 ]) CoinCutout();
            translate([ 58 - 21 / 2, 21 + 44.8, 0 ]) rotate([ 0, 0, 180 ]) CoinCutout();
        }

        // cut out for monopoly tokens
        translate([ 9, 63 + 0.001, BOTTOM_HEIGHT + 7 ]) {
            hull() {
                translate([ 0, 9, 0 ]) RoundCube([ 40, 22, 18 ]);
                translate([ 9, 0, 0 ]) RoundCube([ 22, 40, 18 ]);
            }
        }
        translate([ (58 - 22) / 2, 100, BOTTOM_HEIGHT + 7 ]) cube([ 22, 10, 20 ]);

        // space for coins under monopoly tokens
        union() {
            translate([ 58 / 2, 79, BOTTOM_HEIGHT ]) {
                translate([ 0, -5, 0 ]) cylinder(h = 19, d = 21, center = false);
                translate([ -21 / 2 - 5, 21 / 2, 0 ]) cylinder(h = 19, d = 21, center = false);
                translate([ 21 / 2 + 5, 21 / 2, 0 ]) cylinder(h = 19, d = 21, center = false);
            }
            translate([ 58 / 2, 115, -0.001 ]) { translate([ 0, -5, 0 ]) cylinder(h = 19, d = 21, center = false); }
            translate([ 58 / 2, 94, BOTTOM_HEIGHT ]) {
                translate([ 0, -5, 0 ]) cylinder(h = 19, d = 16, center = false);
            }
            translate([ 58 / 2 - 5, 90, BOTTOM_HEIGHT ]) {
                translate([ 0, -5, 0 ]) cylinder(h = 19, d = 16, center = false);
            }
            translate([ 58 / 2 + 5, 90, BOTTOM_HEIGHT ]) {
                translate([ 0, -5, 0 ]) cylinder(h = 19, d = 16, center = false);
            }
        }

        // +2, +1, -1 points tokens
        union() {
            translate([ 58 / 2, 25, 10 + 17 + BOTTOM_HEIGHT - 14 ]) cube([ 14, 36, 20 ], center = true);
            translate([ 58 / 2, 7, 10 + 17 + BOTTOM_HEIGHT - 14 ]) rotate([ 0, 0, 45 ])
                cube([ 14 * sqrt(2) / 2, 14 * sqrt(2) / 2, 20 ], center = true);
            translate([ 58 / 2, -4.5, 9 ]) cylinder(h = 20, d = 20, center = true);
        }
    }
}

Insert();
