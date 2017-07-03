$fn = 360;
width = 580;
height = width;
margin = 20;
marble = 10;
nest = 32;
center = 100;

module feld(){
    square([width, height]);
}

module roundabout(){
    pitchradius = width/2 - marble/2 - margin;
    for(i = [0:360/64:360]){
        translate([cos(i)*pitchradius + width/2, sin(i)*pitchradius + height/2]) circle(d=marble);
    }
}

module nests(){
    pitchradius = width/sqrt(2) - nest/2 - 2*margin;
    for(i = [45:360/4:360]){
        translate([cos(i)*pitchradius + width/2, sin(i)*pitchradius + height/2]) circle(d=nest);
    }
}

module center(){
    translate([width/2, height/2]) circle(d=center);
}

module homes(){
    diff = marble + margin;
    pitch1 = width/2 - 2*diff;
    for(i = [3:360/4:360]){
        translate([cos(i)*pitch1 + width/2, sin(i)*pitch1 + height/2]) circle(d=marble);
    }
    pitch2 = width/2 - 3*diff;
    for(i = [10:360/4:360]){
        translate([cos(i)*pitch2 + width/2, sin(i)*pitch2 + height/2]) circle(d=marble);
    }
    pitch3 = width/2 - 4*diff;
    for(i = [17:360/4:360]){
        translate([cos(i)*pitch3 + width/2, sin(i)*pitch3 + height/2]) circle(d=marble);
    }
    pitch4 = width/2 - 5*diff;
    for(i = [24:360/4:360]){
        translate([cos(i)*pitch4 + width/2, sin(i)*pitch4 + height/2]) circle(d=marble);
    }
}

difference(){
    feld();
    roundabout();
    nests();
    center();
    homes();
}