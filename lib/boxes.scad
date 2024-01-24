include <defaults.scad>;

/**
 * Simple square box with open top.
 *
 * Args:
 *     size: [width, depth, height] vector.
 *     wall_width: Width of the vertical walls.
 *     bottom_height: Bottom thickness.
 */
module SquareBox(size, wall_width = WALL_WIDTH, bottom_height = BOTTOM_HEIGHT) {
    width = size[0];
    depth = size[1];
    height = size[2];
    difference() {
        cube(size);
        translate([ wall_width, wall_width, bottom_height ]) color("red")
            cube([ width - 2 * wall_width, depth - 2 * wall_width, height ]);
    }
}

/**
 * Stackable cube (full, no hole).
 *
 * Args:
 *     size: [width, depth, height] vector. These are total dimensions, including the pedestal.
 *     stack_size: [width, depth, height] vector. These are dimensions of the pedestal itself.
 */
module StackableCube(size, stack_size) {
    translate([ 0, 0, stack_size[2] ]) {
        hull() {
            cube([ size[0], size[1], size[2] - stack_size[2] ]);
            translate(
                [ (size[0] - stack_size[0]) / 2, (size[1] - stack_size[1]) / 2, -(size[0] - stack_size[0]) / 1.25 ]
            ) cube(stack_size);
        }
        translate([ (size[0] - stack_size[0]) / 2, (size[1] - stack_size[1]) / 2, -stack_size[2] ]) cube(stack_size);
    }
}

/**
 * Stackable square box. Bottom is narrowed to fit in another box with same dimensions (stackable or not).
 *
 * Args:
 *     size: [width, depth, height] vector. These are total dimensions, including the pedestal.
 *     wall_width: Width of the vertical walls.
 *     bottom_height: Bottom thickness.
 *     stack_height: Height of the pedestal.
 *     leeway: Empty space between bottom outer dimensions and top inner dimensions to allow some wiggle between the boxes.
 */
module StackableSquareBox(
    size, wall_width = WALL_WIDTH, bottom_height = BOTTOM_HEIGHT, stack_height = STACK_HEIGHT, leeway = STACK_LEEWAY
) {
    width = size[0];
    depth = size[1];
    height = size[2] - stack_height;

    inner_scale = (width - 2 * wall_width) / width;

    difference() {
        StackableCube(size, [ width - 2 * wall_width - 2 * leeway, depth - 2 * wall_width - 2 * leeway, stack_height ]);
        color("red") translate([ wall_width, wall_width, bottom_height ])
            resize([ width - 2 * wall_width, depth - 2 * wall_width, 2 * size[2] ]) StackableCube(
                size, [ width - 2 * wall_width - 2 * leeway, depth - 2 * wall_width - 2 * leeway, stack_height ]
            );
    }
}

/**
 * Simple full cube with rounded vertical edges.
 *
 * Args:
 *     size: [width, depth, height] vector.
 *     radius: Vertical edge radius.
 */
module RoundCube(size, radius = RADIUS) {
    width = size[0];
    depth = size[1];
    height = size[2];
    hull() {
        translate([ radius, radius, 0 ]) cylinder(height, r = radius);
        translate([ width - radius, radius, 0 ]) cylinder(height, r = radius);
        translate([ radius, depth - radius, 0 ]) cylinder(height, r = radius);
        translate([ width - radius, depth - radius, 0 ]) cylinder(height, r = radius);
    }
}

/**
 * Simple box with rounded vertical edges.
 *
 * Args:
 *     size: [width, depth, height] vector.
 *     wall_width: Width of the vertical walls.
 *     bottom_height: Bottom thickness.
 *     radius: Vertical edge radius. Must be greater than wall_width.
 */
module RoundBox(size, wall_width = WALL_WIDTH, bottom_height = BOTTOM_HEIGHT, radius = RADIUS) {
    width = size[0];
    depth = size[1];
    height = size[2];
    difference() {
        RoundCube(size, radius = radius);
        translate([ wall_width, wall_width, bottom_height ]) color("red")
            RoundCube([ width - 2 * wall_width, depth - 2 * wall_width, height ], radius = radius - wall_width);
    }
}

/**
 * Stackable full cube with rounded vertical edges.
 *
 * Args:
 *     size: [width, depth, height] vector. These are total dimensions, including the pedestal.
 *     stack_size: [width, depth, height] vector. These are dimensions of the pedestal itself.
 *     radius: Vertical edge outer radius.
 */
module StackableRoundCube(size, stack_size, radius = RADIUS) {
    stack_radius = radius - (size[0] - stack_size[0]) / 2;

    translate([ 0, 0, stack_size[2] ]) {
        hull() {
            RoundCube([ size[0], size[1], size[2] - stack_size[2] ], radius = radius);

            translate(
                [ (size[0] - stack_size[0]) / 2, (size[1] - stack_size[1]) / 2, -(size[0] - stack_size[0]) / 1.25 ]
            ) RoundCube(stack_size, radius = stack_radius);
        }
        translate([ (size[0] - stack_size[0]) / 2, (size[1] - stack_size[1]) / 2, -stack_size[2] ])
            RoundCube(stack_size, radius = stack_radius);
    }
}

/**
 * Stackable round box. Bottom is narrowed to fit in another box with same dimensions (stackable or not).
 *
 * Args:
 *     size: [width, depth, height] vector. These are total dimensions, including the pedestal.
 *     radius: Vertical edge outer radius.
 *     wall_width: Width of the vertical walls.
 *     bottom_height: Bottom thickness.
 *     stack_height: Height of the pedestal.
 *     leeway: Empty space between bottom outer dimensions and top inner dimensions to allow some wiggle between the boxes.
 */
module StackableRoundBox(
    size, radius = RADIUS, wall_width = WALL_WIDTH, bottom_height = BOTTOM_HEIGHT, stack_height = STACK_HEIGHT,
    leeway = STACK_LEEWAY
) {
    width = size[0];
    depth = size[1];
    height = size[2] - stack_height;

    inner_scale = (width - 2 * wall_width) / width;

    difference() {
        StackableRoundCube(
            size, [ width - 2 * wall_width - 2 * leeway, depth - 2 * wall_width - 2 * leeway, stack_height ],
            radius = radius
        );
        color("red") translate([ wall_width, wall_width, bottom_height ])
            resize([ width - 2 * wall_width, depth - 2 * wall_width, 2 * size[2] ])

                StackableRoundCube(
                    size, [ width - 2 * wall_width - 2 * leeway, depth - 2 * wall_width - 2 * leeway, stack_height ],
                    radius = radius - wall_width
                );
    }
}

module RoundSpacer(size, radius = RADIUS, wall_width = WALL_WIDTH) {
    depth = size[0];
    width = size[1];
    height = size[2];
    difference() {
        RoundCube(size, radius = radius);
        translate([ wall_width, wall_width, -1 ])
            RoundCube([ depth - 2 * wall_width, width - 2 * wall_width, height + 2 ], radius = radius);
    }
}

/*
$fa = 1;
$fs = 0.4;
translate([0, 40, 0]) RoundBox([40, 30, 20], wall_width=1.2,
bottom_height=1.6); translate([0, 80, 0]) SquareBox([40, 30, 20],
wall_width=1.2, bottom_height=1.6); translate([0, 120, 0])
StackableSquareBox([40, 30, 20], wall_width=1.2, bottom_height=1.6,
stack_height=4); StackableRoundBox([40, 30, 20], radius=4);
*/
