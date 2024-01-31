include<main.scad>;

translate([ 0, 86, 0 ]) {
    DoubleCardBox();
    translate([ 0, 199 * 2 / 3, 0 ]) SingleCardBox();
    translate([ 92, 0, 0 ]) {
        DoubleCardBox();
        translate([ 0, 199 * 2 / 3, 0 ]) SingleCardBox();
    }
}
translate([ 170, 0, 0 ]) rotate([ 0, 0, 90 ]) TokenTray();
translate([ 170, 0, 15 ]) rotate([ 0, 0, 90 ]) TokenTray();
