include<main.scad>;

// Box dimensions
color("red", alpha = 0.1) translate([ 0, 0, -0.002 ]) cube([ 286, 286, 0.001 ]);
color("red", alpha = 0.1) translate([ -0.002, 0, 0 ]) cube([ 0.001, 286, 72.5 ]);
color("red", alpha = 0.1) translate([ 0, -0.002, 0 ]) cube([ 286, 0.001, 72.5 ]);

// Player boards
color("blue", alpha = 0.1) translate([ 0, 86, 0 ]) cube([ 280, 200, 23 ]);

translate([ 0, 86 + 1, 23 ]) {
    translate([ 92 * 2, 0, 0 ]) { rotate([ 0, 0, 90 ]) DoubleCardBox(); }
    translate([ 92 * 2, 66, 0 ]) { rotate([ 0, 0, 90 ]) DoubleCardBox(); }
    translate([ 92 * 2, 66 * 2, 0 ]) { rotate([ 0, 0, 90 ]) DoubleCardBox(); }
}
translate([ 170, 0, 0 ]) rotate([ 0, 0, 90 ]) FoodTokensTray();
translate([ 170, 0, 15 ]) rotate([ 0, 0, 90 ]) FoodTokensTray();
translate([ 170 + 115 / 2, 0, 0 ]) rotate([ 0, 0, 90 ]) EggsBox();
translate([ 170 + 115, 0, 0 ]) rotate([ 0, 0, 90 ]) EggsBox();

translate([ 0, 0, 30 ]) PlayerCubesBox();
translate([ 34.4, 0, 30 ]) PlayerCubesBox();
translate([ 34.4 * 2, 0, 30 ]) PlayerCubesBox();
translate([ 51.6, 51.6, 30 ]) rotate([ 0, 0, 90 ]) PlayerCubesBox();
translate([ 51.6 * 2, 51.6, 30 ]) rotate([ 0, 0, 90 ]) PlayerCubesBox();
