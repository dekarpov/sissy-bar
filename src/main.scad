use <modules/top-arc.scad>
use <modules/vertical-tubes.scad>
use <modules/middle-arcs.scad>
use <modules/horizontal-tubes.scad>

include <const.scad>

/*$fn = 50;*/

top_arc_part(TUBE_DIAMETER, TUBE_WALL, JOINER_LENGTH, JOINER_WALL,
  TOP_BEND_RADIUS, TOP_CUT_ANGLE);


vertical_tubes_part(HEIGHT, TUBE_DIAMETER, TUBE_WALL, TOP_BEND_RADIUS,
  TOP_CUT_ANGLE);


middle_arc_parts(TUBE_DIAMETER, TUBE_WALL, JOINER_LENGTH, JOINER_WALL,
  MIDDLE_BEND_RADIUS, MIDDLE_CUT_ANGLE, TOP_BEND_RADIUS, TOP_CUT_ANGLE,
  HEIGHT);


horizontal_tubes_part(LENGTH, TUBE_DIAMETER, TUBE_WALL, TOP_BEND_RADIUS,
  TOP_CUT_ANGLE, HEIGHT, MIDDLE_BEND_RADIUS, MIDDLE_CUT_ANGLE);
