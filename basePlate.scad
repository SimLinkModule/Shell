module moduleSlot(){
    cube([5,40.65,2]);
    //outerbarrier
    translate([3.13,0,2]) difference(){
        cube([1.87,40.65,2.1]);
        //first slot
        translate([0,3.25,0]){
            cube([1.02,2.86,2.1]);
            cube([1.02,7.7,1.27]);
            translate([0,2.86,1.57]) rotate([225,0,0]) cube([1.02,0.5,0.5]);
        }
        
        //second slot
        translate([0,23.25,0]){
            cube([1.02,2.86,2.1]);
            cube([1.02,7.7,1.27]);
            translate([0,2.86,1.57]) rotate([225,0,0]) cube([1.02,0.5,0.5]);
        }
    }
    
    //innerbarrier
    translate([0,0,2]){
        difference(){
            cube([1.28,40.65,2.1]);
            translate([1.28,0,0.82]) rotate([0,-45,0]) cube([1,40.65,2]);
        }
        translate([0,0.9,0.82]) cube([1.28,1.47,1.28]);
    }
}

module moduleConnection(){
    translate([-15,40.65,0]) cube([30,2,4.1]);
    mirror([1,0,0]) translate([10,0,0]) moduleSlot();
    translate([10,0,0]) moduleSlot();
}

//basePlate
module basePlate(){
    length=64;
    width=38;
    $fn=100;
    difference(){
        translate([1,1,0]) hull(){
            cylinder(1,1,1);
            translate([width-2,0,0]) cylinder(1,1,1);
            translate([0,length-2,0]) cylinder(1,1,1);
            translate([width-2,length-2,0]) cylinder(1,1,1);
        }
        //connector cutout
        translate([9,length-42.65,-0.1]) cube([20,10,1.2]);
        
        //screw holes
        translate([2.05,length-2.05,-0.3]) cylinder(1.4,1.1,2);
        translate([2.05,2.05,-0.3]) cylinder(1.4,1.1,2);
        translate([width-2.05,2.05,-0.3]) cylinder(1.4,1.1,2);
        translate([width-2.05,length-2.05,-0.3]) cylinder(1.4,1.1,2);
    }
    
    translate([width/2,length-42.65,1]) moduleConnection();
}

basePlate();
