$fn = 360;
width = 580;
margin = 20;
marble = 10;
nest = 32;
center = 140;
hops = 64;

// schablonendefinitionen

fraese_d = 28;
fraeser = 12.7;
stiftabstand = 20;
stift_d = 7;
stift_schaft_d = 4;

// Lasercutter
max_width=600;
max_height=300;

// DIESE der Reihe nach in irgendein nicht zu dünnes, aber billiges und günstig zu schneidendes Material cutten
kugelschablone(); // zum Murmellöcher fräsen
//fraese_zentrierring();
//hilfsringe();


module field(){
    square([width, width]);
}

module roundabout(){
    pitchradius = width/2 - marble/2 - margin;
    for(i = [0:360/hops:360]){
        translate([cos(i)*pitchradius + width/2, sin(i)*pitchradius + width/2]) circle(d=marble);
        translate([cos(i)*(pitchradius-stiftabstand/2) + width/2, sin(i)*(pitchradius-stiftabstand/2) + width/2]) circle(d=stift_d);
        translate([cos(i)*(pitchradius+stiftabstand/2) + width/2, sin(i)*(pitchradius+stiftabstand/2) + width/2]) circle(d=stift_d);
    }
}

module nests(){
    pitchradius = width/sqrt(2) - nest/2 - 2*margin;
    for(i = [45:360/4:360]){
        translate([cos(i)*pitchradius + width/2, sin(i)*pitchradius + width/2]) circle(d=nest);
    }
}

module center(){
    translate([width/2, width/2]) circle(d=center);
}

module homes(){
    for(j = [1:1:4]){
        pitch = width/2 - (1+j)*(marble+margin);
        for(i = [45:360/4:360]){
            translate([cos(i)*pitch + width/2, sin(i)*pitch + width/2]) circle(d=marble);
            translate([
                (cos(i)*pitch + width/2 + cos(i+90)*stiftabstand/2),
                (sin(i)*pitch + width/2 + sin(i+90)*stiftabstand/2)
            ]) circle(d=stift_d);
             translate([
                (cos(i)*pitch + width/2 + cos(i-90)*stiftabstand/2),
                (sin(i)*pitch + width/2 + sin(i-90)*stiftabstand/2)
            ]) circle(d=stift_d);
        }
    }
}

module kugelschablone(){
        intersection(){
        difference(){
            field();
            roundabout();
            nests();
            center();
            homes();
        }
        square([max_width, max_height]);
    }
}

module fraese_zentrierring(){
    difference(){
        circle(d=fraese_d);
        circle(d=fraeser+2);
        translate([ stiftabstand/2, 0]) circle(d=stift_schaft_d);
        translate([-stiftabstand/2, 0]) circle(d=stift_schaft_d);
    }
}

module hilfsringe(){
    union(){
        difference(){
            square(center + margin, center=true);
            circle(d=center);
        }
        difference(){
            square(nest + 2*margin, center=true);
            circle(d=nest);
        }
    }
}