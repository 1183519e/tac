$fn = 360;
width = 580;
margin = 20;
marble = 10;
nest = 32;
center = 140;

module field(){
    square([width, width]);
}

module roundabout(){
    pitchradius = width/2 - marble/2 - margin;
    for(i = [0:360/64:360]){
        translate([cos(i)*pitchradius + width/2, sin(i)*pitchradius + width/2]) circle(d=marble);
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
    diff = marble + margin;
    pitch1 = width/2 - 2*diff;
    for(i = [0:360/4:360]){
        translate([cos(i)*pitch1 + width/2, sin(i)*pitch1 + width/2]) circle(d=marble);
    }
    pitch2 = width/2 - 3*diff;
    for(i = [0:360/4:360]){
        translate([cos(i)*pitch2 + width/2, sin(i)*pitch2 + width/2]) circle(d=marble);
    }
    pitch3 = width/2 - 4*diff;
    for(i = [0:360/4:360]){
        translate([cos(i)*pitch3 + width/2, sin(i)*pitch3 + width/2]) circle(d=marble);
    }
    pitch4 = width/2 - 5*diff;
    for(i = [0:360/4:360]){
        translate([cos(i)*pitch4 + width/2, sin(i)*pitch4 + width/2]) circle(d=marble);
    }
}

difference(){
    field();
    roundabout();
    nests();
    center();
    homes();
}