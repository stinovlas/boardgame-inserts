/*
 * Game box inner dimensions: [263, 162, 49]
 *
 * Game board: [229.5, 158, 19.5]
 */
// clang-format off
include <../lib/boxes.scad>;
include <../lib/cardboxes.scad>;
include <../lib/dividers.scad>;
// clang-format on

$fa = 1;
$fs = 0.4;

WALL_WIDTH = 1.26;
BOTTOM_HEIGHT = 1.2;
STACK_HEIGHT = 3.0;
STACK_LEEWAY = 0.2;
RADIUS = 3.0;

module OasisTokensBox() {
    // print 2 times
    height = 28;
    StackableRoundBox([ 87, 66, height / 2 + 1 ]);
}

module WateringHolesBox() {
    height = 28;
    RoundBox([ 75, 66, height ]);
    translate([ 75 / 2, 66 / 2 ]) {
        linear_extrude(height) {
            difference() {
                resize([ 10, 20 ]) circle(d = 20);
                offset(-WALL_WIDTH) resize([ 10, 20 ]) circle(d = 20);
            }
        }
    }
}

module OasisBox() {
    difference() {
        RoundBox([ 162, 33, 47 ], wall_width = 0.84);
        translate([ (162 - 140) / 2, 2, 17.005 ]) rotate([ 90, 0, 0 ]) difference() {
            hull() {
                translate([ 10, 0, 0 ]) cylinder(r = 5, h = 5);
                translate([ 140 - 10, 0, 0 ]) cylinder(r = 5, h = 5);
                translate([ 0, 25, 0 ]) cylinder(r = 5, h = 5);
                translate([ 140, 25, 0 ]) cylinder(r = 5, h = 5);
            }
            hull() {
                translate([ -0.001, 25.001, -1 ]) cylinder(r = 5, h = 7);
                translate([ -0.001, -20, -1 ]) cylinder(r = 5, h = 7);
            }
            hull() {
                translate([ 140.001, 25.001, -1 ]) cylinder(r = 5, h = 7);
                translate([ 140.001, -20, -1 ]) cylinder(r = 5, h = 7);
            }
        }
    }
}

module CamelBox1() {
    // print 3 times
    height = 28;
    RoundBox([ 54, 68, height ]);
}

module CamelBox2() {
    // print 2 times
    height = 28;
    RoundBox([ 78, 47.75, height ]);
}

module LeaderBoxNoCutout() {
    length = 84;
    width = 95.5;
    height = 28;
    gr = 1.61803; // golden ratio

    RoundBox([ length, width, height ]);
    union() {
        Dividers(
            [ length / gr, width, height ], dividers = [[width / 3, width * 2 / 3], [length / gr]], wall_width = 0.84
        );
        translate([ length / gr, 0, 0 ])
            Dividers([ length - length / gr, width, height ], dividers = [[width / 2], []], wall_width = 0.84);
    }
}

module LeaderBox() {
    length = 84;
    width = 95.5;
    height = 28;

    difference() {
        LeaderBoxNoCutout();

        translate([ length / 2 + 17, width / 2, height - 10 + 0.001 ]) cylinder(h = 10, d = 28.3, center = false);
    }
}
