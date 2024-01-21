include<main.scad>;

translate([ 0, 0, 0 ]) PlayerBox();
translate([ 92 / 2, 0, 0 ]) PlayerBox();
translate([ 0, 145 / 2, 0 ]) PlayerBox();
translate([ 92 / 2, 145 / 2, 0 ]) PlayerBox();
translate([ 0, 0, 15 ]) CardBox();
translate([ 0, 66, 15 ]) TokenTrayWithDivider();
translate([ 0, 66, 15 + 11.3 ]) TokenTrayWithDivider();
