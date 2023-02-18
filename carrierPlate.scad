//carrierPlate
module carrierPlate(){
    length=64;
    width=38;
    $fn=100;
    
    difference(){
        union(){
            difference(){
                translate([1,1,0]) hull(){
                    cylinder(1,1,1);
                    translate([width-2,0,0]) cylinder(1,1,1);
                    translate([0,length-2,0]) cylinder(1,1,1);
                    translate([width-2,length-2,0]) cylinder(1,1,1);
                }
                
                //connector cutout
                translate([8.5,length-42.65,-0.1]) cube([21,27,1.2]);
                
                //main screw holes
                translate([2.05,length-2.05,-1.1]) cylinder(1.4,2,1.1);
                translate([2.05,length-2.05,0.2])cylinder(0.9,1.1,1.1);
                translate([2.05,2.05,-1.1]) cylinder(1.4,2,1.1);
                translate([2.05,2.05,0.2])cylinder(0.9,1.1,1.1);
                translate([width-2.05,2.05,-1.1]) cylinder(1.4,2,1.1);
                translate([width-2.05,2.05,0.2])cylinder(0.9,1.1,1.1);
                translate([width-2.05,length-2.05,-1.1]) cylinder(1.4,2,1.1);
                translate([width-2.05,length-2.05,0.2])cylinder(0.9,1.1,1.1);
            }
            
            //screw body connector pcb
            translate([width/2,25,1]){
                translate([14,0,0]) cylinder(4,3,3);
                translate([-14,0,0]) cylinder(4,3,3);
            }
            
            translate([width/2,45,1]){
                translate([14,0,0]) cylinder(4,3,3);
                translate([-14,0,0]) cylinder(4,3,3);
            }
            
            //screw body main pcb
            translate([width/2,10,1]){
                translate([14.2,0,0]) cylinder(8,3,3);
                translate([-14.2,0,0]) cylinder(8,3,3);
                translate([14.2,45.5,0]) cylinder(8,3,3);
                translate([-14.2,45.5,0]) cylinder(8,3,3);
            }
        }
        
        //screw holes connector pcb
        translate([width/2,25,1]){
            translate([14,0,0]) cylinder(4.1,1.6,1.6);
            translate([-14,0,0]) cylinder(4.1,1.6,1.6);
        }
        
        translate([width/2,45,1]){
            translate([14,0,0]) cylinder(4.1,1.6,1.6);
            translate([-14,0,0]) cylinder(4.1,1.6,1.6);
        }
        
        //screw holes main pcb
        translate([width/2,10,5]){
            translate([14.2,0,0]) cylinder(4.1,1.6,1.6);
            translate([-14.2,0,0]) cylinder(4.1,1.6,1.6);
            translate([14.2,45.5,0]) cylinder(4.1,1.6,1.6);
            translate([-14.2,45.5,0]) cylinder(4.1,1.6,1.6);
        }
    }
}

carrierPlate();
