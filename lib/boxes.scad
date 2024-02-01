include <cubes.scad>;
include <defaults.scad>;

/**
 * Simple square box with open top.
 *
 * Args:
 *     size: [depth, width, height] vector.
 *     wall_width: Width of the vertical walls.
 *     bottom_height: Bottom thickness.
 */
module SquareBox(size, wall_width = WALL_WIDTH, bottom_height = BOTTOM_HEIGHT) {
    depth = size[0];
    width = size[1];
    height = size[2];
    difference() {
        cube(size);
        translate([ wall_width, wall_width, bottom_height ]) color("red")
            cube([ depth - 2 * wall_width, width - 2 * wall_width, height ]);
    }
}

/**
 * Stackable square box. Bottom is narrowed to fit in another box with same dimensions (stackable or not).
 *
 * Args:
 *     size: [depth, width, height] vector. These are total dimensions, including the pedestal.
 *     wall_width: Width of the vertical walls.
 *     bottom_height: Bottom thickness.
 *     stack_height: Height of the pedestal.
 *     leeway: Empty space between bottom outer dimensions and top inner dimensions to allow some wiggle between the
 *             boxes.
 */
module StackableSquareBox(
    size, wall_width = WALL_WIDTH, bottom_height = BOTTOM_HEIGHT, stack_height = STACK_HEIGHT, leeway = STACK_LEEWAY
) {
    depth = size[0];
    width = size[1];
    height = size[2] - stack_height;

    difference() {
        StackableCube(size, [ depth - 2 * wall_width - 2 * leeway, width - 2 * wall_width - 2 * leeway, stack_height ]);
        color("red") translate([ wall_width, wall_width, bottom_height ])
            resize([ depth - 2 * wall_width, width - 2 * wall_width, 2 * size[2] ]) StackableCube(
                size, [ depth - 2 * wall_width - 2 * leeway, width - 2 * wall_width - 2 * leeway, stack_height ]
            );
    }
}

/**
 * Simple box with rounded vertical edges.
 *
 * Args:
 *     size: [depth, width, height] vector.
 *     wall_width: Width of the vertical walls.
 *     bottom_height: Bottom thickness.
 *     radius: Vertical edge radius. Must be greater than wall_width.
 */
module RoundBox(size, wall_width = WALL_WIDTH, bottom_height = BOTTOM_HEIGHT, radius = RADIUS) {
    depth = size[0];
    width = size[1];
    height = size[2];
    difference() {
        RoundCube(size, radius = radius);
        translate([ wall_width, wall_width, bottom_height ]) color("red")
            RoundCube([ depth - 2 * wall_width, width - 2 * wall_width, height ], radius = radius - wall_width);
    }
}

/**
 * Stackable round box. Bottom is narrowed to fit in another box with same dimensions (stackable or not).
 *
 * Args:
 *     size: [depth, width, height] vector. These are total dimensions, including the pedestal.
 *     radius: Vertical edge outer radius.
 *     wall_width: Width of the vertical walls.
 *     bottom_height: Bottom thickness.
 *     stack_height: Height of the pedestal.
 *     leeway: Empty space between bottom outer dimensions and top inner dimensions to allow some wiggle between the
 *             boxes.
 */
module StackableRoundBox(
    size, radius = RADIUS, wall_width = WALL_WIDTH, bottom_height = BOTTOM_HEIGHT, stack_height = STACK_HEIGHT,
    leeway = STACK_LEEWAY
) {
    depth = size[0];
    width = size[1];
    height = size[2] - stack_height;

    difference() {
        StackableRoundCube(
            size, [ depth - 2 * wall_width - 2 * leeway, width - 2 * wall_width - 2 * leeway, stack_height ],
            radius = radius
        );
        color("red") translate([ wall_width, wall_width, bottom_height ])
            resize([ depth - 2 * wall_width, width - 2 * wall_width, 2 * size[2] ])

                StackableRoundCube(
                    size, [ depth - 2 * wall_width - 2 * leeway, width - 2 * wall_width - 2 * leeway, stack_height ],
                    radius = radius - wall_width
                );
    }
}

/**
 * Round spacer. Just perimeters, no top, no bottom.
 *
 * Args:
 *     size: [depth, width, height] vector.
 *     radius: Vertical edge outer radius.
 *     wall_width: Width of the vertical walls.
 */
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
