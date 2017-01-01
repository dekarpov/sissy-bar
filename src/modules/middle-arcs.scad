use <common/arc-tube.scad>

module middle_arc_part(tubeDiameter, tubeWall, joinerLength,
  joinerWall, radius, angle, top_radius, top_angle, height) {

  joinerDiameter = tubeDiameter - tubeWall * 2;

  rotate([90, 0, top_angle])
    translate([height, radius, -top_radius])
      rotate([0, 0, -angle])
        mirror([1, 0, 0])
          union_mirror([0, 1, 0])
            union() {
              arc_tube(tubeDiameter, tubeWall, radius, angle);
              arc_joiner(joinerDiameter, joinerWall, joinerLength,
                radius, angle);
            }
}


module middle_arc_parts(tubeDiameter, tubeWall, joinerLength,
  joinerWall, radius, angle, top_radius, top_angle, height) {

    middle_arc_part(tubeDiameter, tubeWall, joinerLength,
      joinerWall, radius, angle, top_radius, top_angle, height);

    mirror([0, 1, 0])  
      middle_arc_part(tubeDiameter, tubeWall, joinerLength,
        joinerWall, radius, angle, top_radius, top_angle, height);
}
