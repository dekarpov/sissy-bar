use <tube.scad>

module top_arc_part(tubeDiameter, tubeWall, joinerLength, joinerWall, radius, angel) {
  joinerDiameter = tubeDiameter - tubeWall * 2;

  union_mirror([0, 1, 0])
    union() {
      arc_tube(tubeDiameter, tubeWall, radius, angel);
      arc_joiner(joinerDiameter, joinerWall, joinerLength, radius, angel);
    }
}

module union_mirror(vec) {
    union() {
      children();
      mirror(vec) children();
    }
}


module arc_tube(diameter, wall, radius, angel) {
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

    rotate(angel)
      translate([(radius + outerRadius) / 2, 0, 0])
        cube(size = [(radius + outerRadius), (radius + outerRadius) * 2, outerDiameter], center = true);
  }
}


module arc_joiner(diameter, wall, length, radius, angel) {
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

    rotate(180 + angel * 2)
      translate([(radius + outerRadius) / 2, 0, 0])
        cube(size = [(radius + outerRadius), (radius + outerRadius) * 2, outerDiameter], center=true);

    rotate(angel)
      translate([(radius + outerRadius) / 2, 0, 0])
        cube(size = [(radius + outerRadius), (radius + outerRadius) * 2, outerDiameter], center = true);
  }

  // "Public" joiner part
  rotate([-angel, 90, 0])
    translate([0, radius, 0])
      tube(length, outerRadius, wall);
}


module tube(height, radius, wall, center = false) {
  difference() {
    cylinder(h=height, r=radius, center=center);
    cylinder(h=height, r=radius-wall, center=center);
  }
}
