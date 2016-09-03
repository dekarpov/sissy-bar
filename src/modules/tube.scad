module tube(height, radius, wall, center = false) {
  difference() {
    cylinder(h=height, r=radius, center=center);
    cylinder(h=height, r=radius-wall, center=center);
  }
}
