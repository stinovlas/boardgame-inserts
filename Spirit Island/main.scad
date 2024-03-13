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

WALL_WIDTH = 1.26;
BOTTOM_HEIGHT = 1.2;
STACK_HEIGHT = 3.0;
STACK_LEEWAY = 0.2;
RADIUS = 3.0;

module BoxShape1() {
    intersection() {
        translate([ 0, -45 ]) import("board1.svg");
        square([ 200, 200 ]);
    }
}

module BoxShape2() {
    intersection() {
        translate([ 0, -45 ]) import("board1.svg");
        translate([ 0, -200 ]) square([ 200, 200 ]);
    }
}

module Box1() {
    linear_extrude(height = BOTTOM_HEIGHT) BoxShape1();
    linear_extrude(height = 13) difference() {
        BoxShape1();
        offset(delta = -WALL_WIDTH) BoxShape1();
    }
}

module Box2() {
    linear_extrude(height = BOTTOM_HEIGHT) BoxShape2();
    linear_extrude(height = 13) difference() {
        BoxShape2();
        offset(r = -WALL_WIDTH) BoxShape2();
    }
}

module Box3() {
    module BoxShape() {
        difference() {
            import("board2.svg");
            translate([ -0.005, -0.005 ]) square([ 59, 300 ]);
        }
    }
    linear_extrude(height = BOTTOM_HEIGHT) BoxShape();
    linear_extrude(height = 13) difference() {
        BoxShape();
        offset(r = -WALL_WIDTH) BoxShape();
    }
}

module Box4() {
    module BoxShape() {
        difference() {
            import("board2.svg");
            translate([ -0.005, -0.005 ]) square([ 200, 53 ]);
            translate([ 58, -0.005 ]) square([ 200, 200 ]);
        }
    }
    linear_extrude(height = BOTTOM_HEIGHT) BoxShape();
    linear_extrude(height = 13) difference() {
        BoxShape();
        offset(r = -WALL_WIDTH) BoxShape();
    }
}

module CardBox1() {
    RoundCardBox([ 281 / 3, 70, 70 ], radius = WALL_WIDTH + 0.001, corner_radius = 2.5 * RADIUS);
    Dividers([ 281 / 3, 70, BOTTOM_HEIGHT + 3 ], dividers = [ [], [281 / 3 - 13] ]);
}

module PlayerTokensOuterBox() {
    difference() {
        RoundBox([ 114, 60, 18 ]);
        translate([ 7, 7, -1 ]) RoundCube([ 114 - 14, 60 - 14, 10 ]);
        translate([ -1, 60 / 2, 24 ]) rotate([ 0, 90, 0 ]) cylinder(d = 30, h = 120);
    }
}
module PlayerTokensInnerBox() { StackableRoundBox([ 36.9, 57, 14 ], stack_height = WALL_WIDTH); }
// výška (box na karty - desky ostrova) = 56

// translate([ 0, 70, 13 ]) {
//     PlayerTokensOuterBox();
//     translate([ 3, 1.5, BOTTOM_HEIGHT ]) {
//         PlayerTokensInnerBox();
//         translate([ 37, 0, 0 ]) PlayerTokensInnerBox();
//         translate([ 2 * 37, 0, 0 ]) PlayerTokensInnerBox();
//         translate([ 3 * 37, 0, 0 ]) PlayerTokensInnerBox();
//         translate([ 4 * 37, 0, 0 ]) PlayerTokensInnerBox();
//         translate([ 5 * 37, 0, 0 ]) PlayerTokensInnerBox();
//     }
// }

module TownBox1() { StackableRoundBox([ 114, 60, 16.5 ]); }

module TownBox2() { StackableRoundBox([ 114, 60, 19.5 ]); }

module CityBox() { StackableRoundBox([ 114, 60, 24 ]); }

module DahansBox() { StackableRoundBox([ 53, 152, 22 ]); }

module WildTokensBox() { StackableRoundBox([ 53, 59, 19 ]); }

// PlayerTokensInnerBox();
// PlayerTokensOuterBox();

// StackableRoundBox([ 20, 30, 6 ], dividers = [ [15], [10] ]);
// translate([ 25, 0, 0 ]) StackableRoundBox([ 20, 30, 6 ], dividers = [ [15], [10] ], dividers_height = 4);
// CardBox1();
// echo(STACK_HEIGHT - WALL_WIDTH * sqrt(2) / 2);
//
// TownBox();
// CityBox();
// PlayerTokensInnerBox();

module PlayerTokensBox() { StackableRoundBox([ 53, 35, 15 ]); }

module ElementTokensBox() {
    StackableRoundTray(
        [ 53, 152, 14 ], slopes = 2, angle = 35,
        dividers = [ [ 152 / 8, 152 * 2 / 8, 152 * 3 / 8, 152 * 4 / 8, 152 * 5 / 8, 152 * 6 / 8, 152 * 7 / 8 ], [] ],
        dividers_height = 12
    );
}
echo((152 - 9 * WALL_WIDTH) / 8);

module WildTokensBox2() {
    // StackableRoundBox([ 53, 59, 19 ]);
    difference() {
        union() {
            StackableRoundBox([ 59, 53, 19 ]);
            intersection() {
                StackableRoundBoxHull([ 59, 53, 19 ]);
                translate([ 59 - 8 - WALL_WIDTH, -0.001, -0.001 ]) rotate([ 0, 27, 0 ]) cube([ 20, 60, 30 ]);
            }
        }
        translate([ 59 - 8, -0.001, -0.001 ]) rotate([ 0, 27, 0 ]) cube([ 20, 60, 30 ]);
    }
    // color("blue") translate([ 59 - 5, 0 ]) cube([ 5, 53, 6 ]);
}

// výška desek duchů: 46 (46.5)
// echo(50 / 3);
module ElementTokensBoxSample() {
    StackableRoundTray([ 54, 152 / 4, 14 ], slopes = 2, angle = 35, dividers = [ [], [54 / 2] ], dividers_height = 12);
}
echo((152 - 9 * WALL_WIDTH) / 8);
ElementTokensBoxSample();
