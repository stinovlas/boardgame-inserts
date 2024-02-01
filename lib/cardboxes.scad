include <boxes.scad>;
include <defaults.scad>;
include <dividers.scad>;

/**
 * Simple card box with rounded vertical edges.
 *
 * Args:
 *     size: [depth, width, height] vector.
 *     wall_width: Width of the vertical walls (except for one).
 *     bottom_height: Bottom thickness.
 *     radius: Vertical edge radius. Must be greater than wall_width.
 */
module RoundCardBox(size, dividers = undef, wall_width = WALL_WIDTH, bottom_height = BOTTOM_HEIGHT, radius = RADIUS) {
    module RoundCardBoxOuter(size, radius) {
        depth = size[0];
        width = size[1];
        height = size[2];
        hull() {
            translate([ radius, radius, 0 ]) cylinder(height, r = radius);
            translate([ radius, depth - radius, 0 ]) cylinder(height, r = radius);
            translate([ width - radius, 0, height - radius ]) rotate([ -90, 0, 0 ]) cylinder(depth, r = radius);
            translate([ width - 2 * radius, 0, 0 ]) cube([ 2 * radius, depth, 2 * radius ]);
        }
    }
    depth = size[0];
    width = size[1];
    height = size[2];

    difference() {
        RoundCardBoxOuter([ width, depth, height ], radius = radius);
        translate([ wall_width, wall_width, bottom_height ]) resize([ depth, width - 2 * wall_width, height ])
            RoundCardBoxOuter([ width, depth, height ], radius = radius);
    }
    // translate([ depth - 12, 0, bottom_height - 0.001 ]) cube([ 5, width, 2.5 + 0.001 ]);
    if (dividers != undef) {
        intersection() {
            RoundCardBoxOuter([ width, depth, height ], radius = radius);
            Dividers(size, dividers = dividers, wall_width = wall_width);
        }
    }
}

/**
 * Simple card box.
 *
 * Args:
 *     size: [depth, width, height] vector.
 *     wall_width: Width of the vertical walls (except for one).
 *     bottom_height: Bottom thickness.
 */
module CardBox(size, dividers = undef, wall_width = WALL_WIDTH, bottom_height = BOTTOM_HEIGHT) {
    depth = size[0];
    width = size[1];
    height = size[2];

    difference() {
        cube([ depth, width, height ]);
        translate([ wall_width, wall_width, bottom_height ]) resize([ depth, width - 2 * wall_width, height ])
            cube([ depth, width, height ]);
    }
    translate([ depth - 12, 0, bottom_height - 0.001 ]) cube([ 5, width, 2.5 + 0.001 ]);
    if (dividers != undef) {
        intersection() {
            cube([ depth, width, height ]);
            Dividers(size, dividers = dividers, wall_width = wall_width);
        }
    }
}
