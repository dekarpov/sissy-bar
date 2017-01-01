use <common/line-tube.scad>


module vertical_tubes_part(height, diameter, wall, radius, angle) {
  outerRadius = diameter / 2;

  rotate([-angle, 90, 0])
    translate([0, radius, 0])
      tube(height, outerRadius, wall);

  rotate([angle, 90, 0])
    translate([0, -radius, 0])
      tube(height, outerRadius, wall);
}
