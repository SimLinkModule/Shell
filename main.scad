use <basePlate.scad>
use <carrierPlate.scad>
use <shell.scad>

//connector PCB dummy
module connectorPCB(height=6){
    $fn=100;
    difference(){ 
        cube([30,20,height]);
        translate([3.3,10,-0.5]) cylinder(height+1,1.1,1.1);
        translate([30-3.3,10,-0.5]) cylinder(height+1,1.1,1.1);
    }
}

//IO PCB dummy
module ioPCB(height=6){
    $fn=100;
    difference(){
        cube([35,42,height]);
        translate([3.3,3.3,-0.5]) cylinder(height+1,1.1,1.1);
        translate([35-3.3,3.3,-0.5]) cylinder(height+1,1.1,1.1);
        translate([3.3,42-3.3,-0.5]) cylinder(height+1,1.1,1.1);
        translate([35-3.3,42-3.3,-0.5]) cylinder(height+1,1.1,1.1);
    }   
}

//main PCB dummy
module mainPCB(height=12){
    $fn=100;
    difference(){
        cube([35,52,height]);
        translate([3.3,3.3,-0.5]) cylinder(height+1,1.1,1.1);
        translate([35-3.2,3.3,-0.5]) cylinder(height+1,1.1,1.1);
        translate([3.3,52-3.3,-0.5]) cylinder(height+1,1.1,1.1);
        translate([35-3.2,52-3.3,-0.5]) cylinder(height+1,1.1,1.1);
    }
}

shell();
translate([1,1,1]) carrierPlate();
translate([1,1,1]) mirror([0,0,1]) basePlate();