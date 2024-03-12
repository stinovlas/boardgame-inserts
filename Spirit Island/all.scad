include<main.scad>;

color("blue", alpha = 0.2) square([ 281, 281 ]);

CardBox1();
translate([ 281 / 3, 0, 0 ]) CardBox1();
translate([ 2 * 281 / 3, 0, 0 ]) CardBox1();
translate([ 45, 281, 0 ]) rotate([ 0, 0, -90 ]) {
    Box1(); // scenario tokens 1
    Box2(); // scenario tokens 2
}
translate([ 281, 70, 0 ]) rotate([ 0, 0, 90 ]) {
    Box3(); // blight tokens
    Box4(); // invader reminders
}
// spirit boards
// color("blue", alpha = 0.2) translate([ 0, 281 - 152, 13 ]) RoundCube([ 228, 152, 42 ]);

translate([ 0, 70, 13 ]) {
    TownBox();                          // 3x player tokens
    translate([ 114, 0, 0 ]) TownBox(); // 3x player tokens
    translate([ 0, 0, 16 ]) {
        TownBox();                          // fear tokens
        translate([ 114, 0, 0 ]) TownBox(); // towns
    }
    translate([ 0, 0, 16 + 16 ]) {
        CityBox();                          // cities
        translate([ 114, 0, 0 ]) CityBox(); // cities
    }
}

// translate([ 281 - 53, 281 - 152, 13 ]) {
//     DahansBox();
//     translate([ 0, 0, 20 ]) DahansBox();
// }

translate([ 281 - 53, 70, 0 ]) {
    WildTokensBox();
    translate([ 0, 0, 17 ]) WildTokensBox();
    translate([ 0, 0, 2 * 17 ]) WildTokensBox();
    translate([ 0, 0, 3 * 17 ]) WildTokensBox();
}

// translate([ 281 - 53, 281 - 35, 13 ]) {
//     PlayerTokensBox();
//     translate([ 0, 0, 13 ]) PlayerTokensBox();
//     translate([ 0, 0, 13 + 13 ]) PlayerTokensBox();
//     translate([ 0, -35, 0 ]) {
//         PlayerTokensBox();
//         translate([ 0, 0, 13 ]) PlayerTokensBox();
//         translate([ 0, 0, 13 + 13 ]) PlayerTokensBox();
//     }
// }
