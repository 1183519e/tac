$fn = 360;
width = 580;
margin = 20;
marble = 10;
nest = 32;
center = 140;
hops = 66;

module field(){
    circle(d=width,$fn=6);
}

module roundabout(){
    pitchradius = width*sqrt(3)/4 - marble/2 - margin;
    for(i = [0:360/hops:360]){
        translate([cos(i)*pitchradius , sin(i)*pitchradius ]) circle(d=marble);
    }
}

module nests(){
    pitchradius = width/2 - nest/2 - margin;
    for(i = [0:360/6:360]){
        translate([cos(i)*pitchradius, sin(i)*pitchradius]) circle(d=nest);
    }
}

module center(){
    circle(d=center);
}

module homes(){
    diff = marble + margin/1.5;
    pitch1 = width*sqrt(3)/4 - 2*diff;
    for(i = [0:360/6:360]){
        translate([cos(i)*pitch1, sin(i)*pitch1]) circle(d=marble);
    }
    pitch2 = width*sqrt(3)/4 - 3*diff;
    for(i = [0:360/6:360]){
        translate([cos(i)*pitch2, sin(i)*pitch2]) circle(d=marble);
    }
    pitch3 = width*sqrt(3)/4 - 4*diff;
    for(i = [0:360/6:360]){
        translate([cos(i)*pitch3, sin(i)*pitch3]) circle(d=marble);
    }
    pitch4 = width*sqrt(3)/4 - 5*diff;
    for(i = [0:360/6:360]){
        translate([cos(i)*pitch4, sin(i)*pitch4]) circle(d=marble);
    }
}

difference(){
    field();
    roundabout();
    nests();
    center();
    homes();
}