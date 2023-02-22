//one side of the holder for the light module slot
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

//u-shaped holder for the light module slot
module moduleConnection(){
    translate([-15,40.65,0]) cube([30,2,4.1]);
    mirror([1,0,0]) translate([10,0,0]) moduleSlot();
    translate([10,0,0]) moduleSlot();
}

//final base plate for the shell
module basePlate(){
    length=64;
    width=38;
    $fn=100;
    
    difference(){
        union(){
            //box inside the light module holder
            translate([9,length-32.65,1]) cube([20,30.65,4.1]);
            
            translate([1,1,0]) hull(){
                cylinder(1,1,1);
                translate([width-2,0,0]) cylinder(1,1,1);
                translate([0,length-2,0]) cylinder(1,1,1);
                translate([width-2,length-2,0]) cylinder(1,1,1);
            }
            
            translate([width/2,length-42.65,1]) moduleConnection();
        }
        
        //connector pins cutout
        translate([8.5,length-42.65,-0.1]) cube([21,10,5.2]);
        
        //cutout for the connector pcb
        translate([3.5,length-36.65,-0.1]) cube([31,24,2.1]);
        
        //screw holes
        translate([width/2-7,length-4,-0.5]){
            cylinder(1.5,1.1,2.2);
            translate([0,0,1.5]) cylinder(5,2.2,2.2);
        }
        translate([4,4,-0.5]) cylinder(1.5,1.1,2.2);
        translate([width-4,4,-0.5]) cylinder(1.5,1.1,2.2);
        translate([width/2+7,length-4,-0.5]){
            cylinder(1.5,1.1,2.2);
            translate([0,0,1.5]) cylinder(5,2.2,2.2);
        }
    }
}

basePlate();
