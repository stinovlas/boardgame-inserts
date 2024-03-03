// clang-format off
include<../lib/cardboxes.scad>;
include<../lib/defaults.scad>;
// clang-format on

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

module Box3() { import("board2.svg"); }

module CardBox1() {
    RoundCardBox([ 281 / 3, 70, 100 ]); // fix height!
}

CardBox1();
