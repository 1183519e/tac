$fn = 36;
l = 360;
h = 6;
boden = 1;

r = 14/2;
lk = l/2 - 2*r;

start_r = 30;
start_lk = 205;

module brett(){
    difference(){
        translate([-l/2, -l/2, -h]) cube([l,l,h]);
        
        // Kreis
        for(i = [1.5:64.5]){
            translate([lk*sin(i*360/64), lk*cos(i*360/64), boden+r-h]) sphere(r);
        }
        
        // Start
        for(i = [1.5:4.5]){
            translate([start_lk*sin(i*360/4), start_lk*cos(i*360/4), boden]) union(){
                translate([0,0,-h]) cylinder(h=h, r=start_r-r);
                translate([0,0,0]) rotate_extrude() translate([start_r-r, 0, 0]) circle(r);
                translate([0,0,-boden-h]) cylinder(h=boden,r=start_r);
            }
        }
        
        // Mitte
    }
    
}

module zier(){
    
}

brett();

