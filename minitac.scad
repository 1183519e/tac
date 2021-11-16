$fn = 36;
l = 360;
h = 6;
boden = 1;

r = 14/2;
lk = l/2 - 2*r;

start_r = 30;
start_lk = 205;

// Karten sind 45x73.5
card_w = 45;
card_h = 73.5;
card_diag = sqrt(card_w^2 + card_h^2);

first = 0.2; // first layer height
zier_pkt_d = 1.2; // 4* first layer extrusion width @ 0.25n
zier_lk = lk + r + 0.9;

zier_linie = 0.6; // 2* first layer extrusion width @ 0.25n


module brett(){
    difference(){
        translate([-l/2, -l/2, -h]) cube([l,l,h]);
        
        // Kreis
        for(i = [0:63]){
            translate([lk*sin((i+.5)*360/64), lk*cos((i+.5)*360/64), boden+r-h]) sphere(r);
        }
        
        // Start
        for(i = [0:3]){
            translate([start_lk*sin((i+.5)*360/4), start_lk*cos((i+.5)*360/4), boden]) union(){
                translate([0,0,-h]) cylinder(h=h, r=start_r-r);
                rotate_extrude() translate([start_r-r, 0, 0]) circle(r);
                translate([0,0,-boden-h]) cylinder(h=boden,r=start_r);
            }
        }
        
        // Mitte
        translate([0,0,boden-h]){
            cylinder(h=h, d=card_diag);
            translate([0,0,h-boden]) rotate_extrude() translate([card_diag/2,0,0]) circle(r=h);
            translate([0,0,-boden]) cylinder(h=boden,d=card_diag+2*r);
        }

        // Häuser
        for(i = [0, 16, 32, 48]){
            for(j = [1:4]){
                this_lk = lk - 3*j*r;
                translate([this_lk*sin((i-.5)*360/64-0.8*j), this_lk*cos((i-.5)*360/64-0.8*j), boden+r-h]) sphere(r);
            }
        }

        zier();
    }
    
}

module zier(){
    // Kreis abzählbar machen
    for(i = [0:63]){
        if(i%2){
            translate([zier_lk*sin((i+.5)*360/64), zier_lk*cos((i+.5)*360/64), -first]) cylinder(h=first, d=zier_pkt_d);
        }
    }

    // Häuser
    for(i = [0, 16, 32, 48]){
        for(j = [1:4]){
            this_lk = lk - 3*j*r;
            difference(){
                translate([this_lk*sin((i-.5)*360/64-0.8*j), this_lk*cos((i-.5)*360/64-0.8*j), -first]) cylinder(h=first, r=sqrt(2*r*(h-boden) - (h-boden)^2)+zier_linie);
                translate([this_lk*sin((i-.5)*360/64-0.8*j), this_lk*cos((i-.5)*360/64-0.8*j), boden+r-h]) sphere(r);
            }
        }
    }
    
    // Start
    for(i = [0:3]){
        translate([start_lk*sin((i+.5)*360/4), start_lk*cos((i+.5)*360/4), -first]) difference(){
            cylinder(h=first, r=start_r+zier_linie);
            cylinder(h=first, r=start_r-r);
            rotate_extrude() translate([start_r-r, 0, 0]) circle(r);
        }
    }
}

brett();
