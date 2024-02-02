include<defaults.scad>;

/**
 * Stackable cube (full, no hole).
 *
 * Args:
 *     size: [depth, width, height] vector. These are total dimensions, including the pedestal.
 *     stack_size: [depth, width, height] vector. These are dimensions of the pedestal itself.
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
 * Simple full cube with rounded vertical edges.
 *
 * Args:
 *     size: [depth, width, height] vector.
 *     radius: Vertical edge radius.
 */
module RoundCube(size, radius = RADIUS) {
    depth = size[0];
    width = size[1];
    height = size[2];
    hull() {
        translate([ radius, radius, 0 ]) cylinder(height, r = radius);
        translate([ depth - radius, radius, 0 ]) cylinder(height, r = radius);
        translate([ radius, width - radius, 0 ]) cylinder(height, r = radius);
        translate([ depth - radius, width - radius, 0 ]) cylinder(height, r = radius);
    }
}

/**
 * Stackable full cube with rounded vertical edges.
 *
 * Args:
 *     size: [depth, width, height] vector. These are total dimensions, including the pedestal.
 *     stack_size: [depth, width, height] vector. These are dimensions of the pedestal itself.
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
