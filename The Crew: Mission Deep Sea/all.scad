include<main.scad>;

TaskCardBox();
translate([ 48, 48, 0 ]) rotate([ 0, 0, 90 ]) TaskCardBox();
translate([ 48 + 48, 48, 0 ]) rotate([ 0, 0, 90 ]) TaskCardBox();
translate([ 73, 0, 0 ]) TokenBox();
translate([ 171 - 66, 92, 0 ]) rotate([ 0, 0, -90 ]) DeckCardBox();
translate([ 48 + 48, 92, 0 ]) Spacer();
