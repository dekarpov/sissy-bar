use <common/line-tube.scad>


module horizontal_tube_part(length, diameter, wall, top_radius,
  top_angle, height, middle_radius, middle_angle) {

  outerRadius = diameter / 2;


  rotate([0, 0, top_angle])
    translate([height, top_radius, 0])
      translate([0, 0, middle_radius])
        rotate([0, middle_angle * 2, 0])
          translate([0, 0, middle_radius])
            rotate([0, -90, 0])
              tube(length, outerRadius, wall);
}


module horizontal_tubes_part(length, diameter, wall, top_radius,
  top_angle, height, middle_radius, middle_angle) {

    horizontal_tube_part(length, diameter, wall, top_radius,
      top_angle, height, middle_radius, middle_angle);

    mirror([0, 1, 0])
      horizontal_tube_part(length, diameter, wall, top_radius,
        top_angle, height, middle_radius, middle_angle);
}
