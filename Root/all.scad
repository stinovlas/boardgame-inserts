include<main.scad>;

translate([ 0, 0, 0 ]) {
    translate([ 71.5, 0, 0 ]) rotate([ 0, 0, 90 ]) VagabondBox();          // Vagabond 1
    translate([ 71.5, 82 * 2 / 3, 0 ]) rotate([ 0, 0, 90 ]) VagabondBox(); // Vagabond 2
    translate([ 0, 82 * 4 / 3, 0 ]) LonersHirelingsBox();                  // Bear, Deer, Otter flotilla
}

translate([ 71.5, 0, 0 ]) {
    LargeHirelingsBox();                              // Moles + Crows hirelings
    translate([ 0, 82 * 2 / 3 ]) LargeHirelingsBox(); // Cats + Band hirelings
    translate([ 0, 82 * 4 / 3 ]) LargeHirelingsBox(); // Badgers + Rats hirelings
}

translate([ 71.5 * 2, 0, 0 ]) {
    SpareTokensBox(); // Spare tokens
    translate([ 0, 0, 10 ]) {
        SmallHirelingsBox();                              // Woodland alliance + Lizards hirelings
        translate([ 0, 82 * 2 / 3 ]) SmallHirelingsBox(); // Bandits + Eagles hirelings
        translate([ 0, 82 * 4 / 3 ]) HirelingsDiceBox();  // Hirelings tokens and dices
    }
}

translate([ 95, 82 * 2, 0 ]) rotate([ 0, 0, 90 ]) AllCardsBox(); // All cards box

translate([ 0, 0, 22 ]) {
    MediumFactionBox();                         // Badgers
    translate([ 0, 82, 0 ]) MediumFactionBox(); // Eagles
}
translate([ 71.5, 0, 32 ]) {
    MediumFactionBox();                        // Lizards
    translate([ 0, 82, 0 ]) MolesFactionBox(); // Moles
}

translate([ 71.5 * 2, 0, 32 ]) {
    SmallFactionBox();                                 // Otters
    translate([ 0, 82 * 2 / 3, 0 ]) SmallFactionBox(); // Crows
    translate([ 0, 82 * 4 / 3, 0 ]) SmallFactionBox(); // Woodland alliance
}

translate([ 95, 82 * 2, 0 ]) {
    LargeFactionBox();                         // Cats
    translate([ 60, 0, 0 ]) LargeFactionBox(); // Rats
}

translate([ 95, 82 * 2, 32 ]) {
    ResinMarkersBox();                          // Resin markers (+ cardboard markers)
    translate([ 60, 0, 0 ]) LandmarksDiceBox(); // Landmarks + d12 dice
}

translate([ 0, 0, 22 + 32 ]) LargeCardsBox();
