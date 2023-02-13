
module Button(gapWidth=1, gapHeight=0.4, armWidth=9){
$fn=100;
rampeWidth = (2-gapHeight)/tan(60);
cylinder(2,4,4);
translate([0,-3,0]) cube([armWidth,6,gapHeight]);
translate([armWidth,-3,gapHeight]) mirror([1,0,0]) rampe(2-gapHeight);
translate([armWidth-2*rampeWidth-gapWidth,-3,gapHeight]) rampe(2-gapHeight);
translate([0,-3,0]) cube([armWidth-2*rampeWidth-gapWidth,6,2]);
}

module ButtonCutOut(armWidth=9){
    $fn=100;
    cylinder(2.2,5,5);
    translate([0,-4,0]) cube([armWidth,8,2.2]);
}

module rampe(height=2){
    a = height/tan(60);
    c = height/sin(60);
    d = a*cos(30);
    difference(){
        cube([a,6,height]);
        translate([a,0,0]) rotate([0,330,0]) cube([d,6,c]);
    }
}

$fn = 100;
difference(){
    cube([96,76,2]);
    translate([3,3,1]) cylinder(2,1,1);
    //first row
    translate([14,14,-0.1]) ButtonCutOut();
    translate([14,30,-0.1]) ButtonCutOut();
    translate([14,46,-0.1]) ButtonCutOut();
    translate([14,62,-0.1]) ButtonCutOut();
    
    //second row
    translate([35,14,-0.1]) ButtonCutOut();
    translate([35,30,-0.1]) ButtonCutOut();
    translate([35,46,-0.1]) ButtonCutOut();
    translate([35,62,-0.1]) ButtonCutOut();
    
    //third row
    translate([56,14,-0.1]) ButtonCutOut();
    translate([56,30,-0.1]) ButtonCutOut();
    translate([56,46,-0.1]) ButtonCutOut();
    translate([56,62,-0.1]) ButtonCutOut();
    
    //fourth row
    translate([77,14,-0.1]) ButtonCutOut();
    translate([77,30,-0.1]) ButtonCutOut();
    translate([77,46,-0.1]) ButtonCutOut();
    translate([77,62,-0.1]) ButtonCutOut();
}

//first row gapWidth=0.5
translate([14,14,0]) Button(gapWidth=0.5, gapHeight=0.4);
translate([14,30,0]) Button(gapWidth=0.5, gapHeight=0.6);
translate([14,46,0]) Button(gapWidth=0.5, gapHeight=0.8);
translate([14,62,0]) Button(gapWidth=0.5, gapHeight=1);

//second row gapWidth=1
translate([35,14,0]) Button(gapWidth=1, gapHeight=0.4);
translate([35,30,0]) Button(gapWidth=1, gapHeight=0.6);
translate([35,46,0]) Button(gapWidth=1, gapHeight=0.8);
translate([35,62,0]) Button(gapWidth=1, gapHeight=1);

//third row gapWidth=2
translate([56,14,0]) Button(gapWidth=2, gapHeight=0.4);
translate([56,30,0]) Button(gapWidth=2, gapHeight=0.6);
translate([56,46,0]) Button(gapWidth=2, gapHeight=0.8);
translate([56,62,0]) Button(gapWidth=2, gapHeight=1);

//fourth row gapWidth=3
translate([77,14,0]) Button(gapWidth=3, gapHeight=0.4);
translate([77,30,0]) Button(gapWidth=3, gapHeight=0.6);
translate([77,46,0]) Button(gapWidth=3, gapHeight=0.8);
translate([77,62,0]) Button(gapWidth=3, gapHeight=1);