include<main.scad>;

color("red", alpha = 0.1) translate([ 0, 33, 0 ]) cube([ 162, 229.5, 19.5 ]); // game board
OasisBox();
translate([ 0, 33, 19.5 ]) {
    translate([ 0, 0, 0 ]) CamelBox2();
    translate([ 0, 47.75, 0 ]) CamelBox2();
    translate([ 78, 0, 0 ]) LeaderBox();
}

translate([ 0, 33 + 2 * 47.75, 19.5 ]) {
    translate([ 0, 0, 0 ]) CamelBox1();
    translate([ 162 / 3, 0, 0 ]) CamelBox1();
    translate([ 162 * 2 / 3, 0, 0 ]) CamelBox1();
}
translate([ 0, 33 + 2 * 47.75 + 68, 19.5 ]) {
    translate([ 0, 0, 0 ]) WateringHolesBox();
    translate([ 75, 0, 0 ]) OasisTokensBox();
    translate([ 75, 0, 28 / 2 - 1 ]) OasisTokensBox();
    // translate([ 162 / 2, 80 * 2, 0 ]) WateringHolesBox();
}
