use <line-tube.scad>

module union_mirror(vec) {
    union() {
      children();
      mirror(vec) children();
    }
}


module arc_tube(diameter, wall, radius, angle) {
  outerDiameter = diameter;
  outerRadius = outerDiameter / 2;

  innerDiameter = diameter - wall * 2;
  innerRadius = innerDiameter / 2;

  difference() {
    difference() {
      rotate_extrude()
        translate([radius, 0, 0])
          circle(d = outerDiameter);

      rotate_extrude()
        translate([radius, 0, 0])
          circle(d = innerDiameter);
    }

    translate([-(radius + outerRadius), -(radius + outerRadius), -outerRadius])
      cube(size = [(radius + outerRadius) * 2, (radius + outerRadius), outerDiameter]);

    rotate(angle)
      translate([(radius + outerRadius) / 2, 0, 0])
        cube(size = [(radius + outerRadius), (radius + outerRadius) * 2, outerDiameter], center = true);
  }
}


module arc_joiner(diameter, wall, length, radius, angle) {
  outerDiameter = diameter;
  outerRadius = outerDiameter / 2;

  innerDiameter = outerDiameter - wall * 2;
  innerRadius = innerDiameter / 2;

  // "Private" joiner part
  difference() {
    difference() {
      rotate_extrude()
        translate([radius, 0, 0])
          circle(d = outerDiameter);

      rotate_extrude()
        translate([radius, 0, 0])
          circle(d = innerDiameter);
    }

    translate([-(radius + outerRadius), -(radius + outerRadius), -outerRadius])
      cube(size = [(radius + outerRadius) * 2, (radius + outerRadius), outerDiameter]);

    rotate(180 + angle * 2)
      translate([(radius + outerRadius) / 2, 0, 0])
        cube(size = [(radius + outerRadius), (radius + outerRadius) * 2, outerDiameter], center=true);

    rotate(angle)
      translate([(radius + outerRadius) / 2, 0, 0])
        cube(size = [(radius + outerRadius), (radius + outerRadius) * 2, outerDiameter], center = true);
  }

  // "Public" joiner part
  rotate([-angle, 90, 0])
    translate([0, radius, 0])
      tube(length, outerRadius, wall);
}
