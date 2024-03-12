include<cubes.scad>;
include<defaults.scad>;
include<dividers.scad>;

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
        translate([ wall_width, wall_width, bottom_height ])
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
        translate([ wall_width, wall_width, bottom_height ])
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
module RoundBox(size, wall_width = WALL_WIDTH, bottom_height = BOTTOM_HEIGHT, radius = RADIUS, dividers = undef) {
    depth = size[0];
    width = size[1];
    height = size[2];
    difference() {
        RoundCube(size, radius = radius);
        translate([ wall_width, wall_width, bottom_height ])
            RoundCube([ depth - 2 * wall_width, width - 2 * wall_width, height ], radius = radius - wall_width);
    }
    if (dividers != undef) {
        intersection() {
            RoundCube(size, radius = radius);
            Dividers(size, dividers = dividers, wall_width = wall_width);
        }
    }
}

/**
 * Stackable round box hull.
 *
 * Args:
 *     size: [depth, width, height] vector. These are total dimensions, including the pedestal.
 *     radius: Vertical edge outer radius.
 *     wall_width: Width of the vertical walls.
 *     stack_height: Height of the pedestal.
 *     leeway: Empty space between bottom outer dimensions and top inner dimensions to allow some wiggle between the
 *             boxes.
 */
module StackableRoundBoxHull(
    size, radius = RADIUS, wall_width = WALL_WIDTH, stack_height = STACK_HEIGHT, leeway = STACK_LEEWAY
) {
    depth = size[0];
    width = size[1];
    height = size[2] - stack_height;
    stack_scale = min((depth - 2 * wall_width - 2 * leeway) / depth, (width - 2 * wall_width - 2 * leeway) / width);

    translate([ wall_width + leeway, wall_width + leeway, 0 ]) RoundCube(
        [ depth - 2 * wall_width - 2 * leeway, width - 2 * wall_width - 2 * leeway, stack_height ],
        radius = radius - wall_width - leeway
    );
    hull() {
        translate([ wall_width + leeway, wall_width + leeway, stack_height - (wall_width + leeway) ]) RoundCube(
            [ depth - 2 * wall_width - 2 * leeway, width - 2 * wall_width - 2 * leeway, stack_height ],
            radius = radius - wall_width - leeway
        );
        translate([ 0, 0, stack_height ]) RoundCube([ depth, width, height ], radius = radius);
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
    leeway = STACK_LEEWAY, dividers = undef, dividers_height = undef
) {
    depth = size[0];
    width = size[1];
    height = size[2] - stack_height;
    stack_scale = min((depth - 2 * wall_width - 2 * leeway) / depth, (width - 2 * wall_width - 2 * leeway) / width);

    difference() {
        StackableRoundBoxHull(
            size, radius = radius, wall_width = wall_width, stack_height = stack_height, leeway = leeway
        );

        translate([ wall_width, wall_width ]) StackableRoundBoxHull(
            [ size[0] - 2 * wall_width, size[1] - 2 * wall_width, size[2] + 0.001 ], radius = radius - wall_width,
            wall_width = wall_width, stack_height = stack_height, leeway = leeway
        );
    }
    translate([ wall_width + leeway, wall_width + leeway, 0 ]) RoundCube(
        [ depth - 2 * wall_width - 2 * leeway, width - 2 * wall_width - 2 * leeway, bottom_height ],
        radius = radius - wall_width - leeway
    );
    if (dividers != undef) {
        div_height = (dividers_height == undef) ? size[2] - stack_height + wall_width * sqrt(2) / 2 : dividers_height;
        intersection() {
            StackableRoundBoxHull(
                size, radius = radius, wall_width = wall_width, stack_height = stack_height, leeway = leeway
            );
            Dividers([ size[0], size[1], div_height ], dividers = dividers, wall_width = wall_width);
        }
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
