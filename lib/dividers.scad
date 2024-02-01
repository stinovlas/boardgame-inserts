include<defaults.scad>;

/**
 * Vertical dividers.
 *
 * Args:
 *     size: [depth, width, height] vector of outer box size.
 *     dividers: [[x1, x2, ...], [y1, y2, ...]] for x, resp. y dividers.
 *     wall_width: Width of the dividers.
 */
module Dividers(size, dividers, wall_width = WALL_WIDTH) {
    depth = size[0];
    width = size[1];
    height = size[2];

    for (div = dividers[0]) {
        translate([ 0, div - wall_width / 2, 0 ]) cube([ depth, wall_width, height ]);
    }
    for (div = dividers[1]) {
        translate([ div - wall_width / 2, 0, 0 ]) cube([ wall_width, width, height ]);
    }
}

/**
 * Rounded vertical dividers.
 *
 * Args:
 *     size: [depth, width, height] vector of outer box size.
 *     dividers: [[x1, x2, ...], [y1, y2, ...]] for x, resp. y dividers.
 *     wall_width: Width of the dividers.
 *     radius: Radius of upper corners.
 */
module RoundDividers(size, dividers, wall_width = WALL_WIDTH, radius = RADIUS) {
    depth = size[0];
    width = size[1];
    height = size[2];

    intersection() {
        Dividers(size, dividers, wall_width = wall_width, radius = radius);

        hull() {
            translate([ radius, radius, height - radius ]) sphere(radius);
            translate([ radius, width - radius, height - radius ]) sphere(radius);
            translate([ depth - radius, width - radius, height - radius ]) sphere(radius);
            translate([ depth - radius, radius, height - radius ]) sphere(radius);

            translate([ radius, radius, 0 ]) cylinder(1, r = radius);
            translate([ radius, width - radius, 0 ]) cylinder(1, r = radius);
            translate([ depth - radius, width - radius, 0 ]) cylinder(1, r = radius);
            translate([ depth - radius, radius, 0 ]) cylinder(1, r = radius);
        }
    }
}
