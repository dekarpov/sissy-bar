use <common/arc-tube.scad>

module top_arc_part(tubeDiameter, tubeWall, joinerLength,
  joinerWall, radius, angle) {
    
  joinerDiameter = tubeDiameter - tubeWall * 2;

  union_mirror([0, 1, 0])
    union() {
      arc_tube(tubeDiameter, tubeWall, radius, angle);
      arc_joiner(joinerDiameter, joinerWall, joinerLength, radius, angle);
    }
}
