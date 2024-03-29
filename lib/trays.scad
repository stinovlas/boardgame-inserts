include<boxes.scad>;
include<defaults.scad>;
include<dividers.scad>;

module RoundTray(
    size, slopes = 4, angle = 45, dividers = undef, radius = RADIUS, wall_width = WALL_WIDTH,
    bottom_height = BOTTOM_HEIGHT
) {
    assert(slopes == 1 || slopes == 2 || slopes == 4, "Allowed number of slopes is 1, 2 or 4");

    depth = size[0] - 2 * wall_width;
    width = size[1] - 2 * wall_width;
    height = size[2] - bottom_height;

    // base_depth = depth - 2 * (tan(angle) * height);
    // base_width = width - 2 * (tan(angle) * height);

    if (slopes == 4) {
        _RoundTray(base_depth = depth - 2 * (tan(angle) * height), base_width = width - 2 * (tan(angle) * height));

    } else if (slopes == 2) {
        _RoundTray(base_depth = depth - 2 * (tan(angle) * height), base_width = width);
    } else if (slopes == 1) {
        _RoundTray(base_depth = depth - (tan(angle) * height), base_width = width);
    }

    module _RoundTray(base_depth, base_width) {
        difference() {
            RoundCube(size, radius = radius);
            translate([ wall_width, wall_width, bottom_height ]) hull() {
                translate([ 0, 0, height ]) RoundCube([ depth, width, 0.001 ], radius = radius * (base_depth / depth));
                translate([ (slopes > 1) ? (depth - base_depth) / 2 : 0, (width - base_width) / 2, 0 ])
                    RoundCube([ base_depth, base_width, 0.001 ], radius = radius * (base_width / width));
            }
            translate([ wall_width, wall_width, height + bottom_height - 0.001 ])
                RoundCube([ depth, width, 2 ], radius = radius);
        }
    }

    if (dividers != undef) {
        intersection() {
            RoundCube(size, radius = radius);
            Dividers(size, dividers = dividers, wall_width = wall_width);
        }
    }
}
