//plate that is used to attach the connector pcb and main pcb
module carrierPlate(){
    length=64;
    width=38;
    $fn=100;
    
    difference(){
        union(){
            difference(){
                //main body
                translate([1,1,0]) hull(){
                    cylinder(1,1,1);
                    translate([width-2,0,0]) cylinder(1,1,1);
                    translate([0,length-2,0]) cylinder(1,1,1);
                    translate([width-2,length-2,0]) cylinder(1,1,1);
                }
                
                //connector cutout
                translate([8.5,length-42.65,-0.1]) cube([21,10,1.2]);
                translate([3.5,length-36.65,-0.1]) cube([31,24,1.2]);
                translate([width/2-5,length-12.65,-0.1]) cube([10,5,1.2]);
                
                //main screw holes
                translate([width/2-7,length-4,-1]) cylinder(1.5,2.2,1.1);
                translate([width/2-7,length-4,0.4])cylinder(0.7,1.1,1.1);
                
                translate([4,4,-1]) cylinder(1.5,2.2,1.1);
                translate([4,4,0.4])cylinder(0.7,1.1,1.1);
                
                translate([width-4,4,-1]) cylinder(1.5,2.2,1.1);
                translate([width-4,4,0.4])cylinder(0.7,1.1,1.1);
                
                translate([width/2+7,length-4,-1]) cylinder(1.5,2.2,1.1);
                translate([width/2+7,length-4,0.4])cylinder(0.7,1.1,1.1);
            }
            
            //screw body connector pcb
            translate([width/2,23,1]){
                translate([14,0,0]) cylinder(4,3,3);
                translate([-14,0,0]) cylinder(4,3,3);
            }
            
            translate([width/2,54.5,1]){
                translate([10.3,0,0]) cylinder(4,3,3);
                translate([-10.3,0,0]) cylinder(4,3,3);
            }
            
            //screw body main pcb
            translate([width/2,14,1]){
                translate([14.2,0,0]) cylinder(8,3,3);
                translate([-14.2,0,0]) cylinder(8,3,3);
                translate([14.2,45.5,0]) cylinder(8,3,3);
                translate([-14.2,45.5,0]) cylinder(8,3,3);
            }
        }
        
        //screw holes connector pcb
        translate([width/2,23,1]){
            translate([14,0,0]) cylinder(4.1,1.6,1.6);
            translate([-14,0,0]) cylinder(4.1,1.6,1.6);
        }
        
        translate([width/2,54.5,1]){
            translate([10.3,0,0]) cylinder(4.1,1.6,1.6);
            translate([-10.3,0,0]) cylinder(4.1,1.6,1.6);
        }
        
        //screw holes main pcb
        translate([width/2,14,5]){
            translate([14.2,0,0]) cylinder(4.1,1.6,1.6);
            translate([-14.2,0,0]) cylinder(4.1,1.6,1.6);
            translate([14.2,45.5,0]) cylinder(4.1,1.6,1.6);
            translate([-14.2,45.5,0]) cylinder(4.1,1.6,1.6);
        }
    }
}

carrierPlate();
