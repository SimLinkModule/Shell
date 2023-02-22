//attaches the connector pcb to the carrier plate
module connectorCarrier(){
    $fn=100;

    difference(){
        union(){
            //arm1
            translate([14,0,4]) cylinder(2,3,3);
            translate([11,0,4]) cube([6,7,2]);
            translate([11,5,-0.8]) cube([6,2,4.8]);

            //arm2
            translate([10.3,31.5,4]) cylinder(2,3,3);
            translate([7.3,26.2,4]) cube([6,5.3,2]);
            translate([7.3,26.2,-2]) cube([6,2,6]);

            //main body between the arms
            translate([0,0,-0.8]) linear_extrude(height = 6.8){
                polygon([[11,7],[17,7],[13.3,26.2],[7.3,26.2]]);
            }
            
            //pcb holder pin
            translate([11.7,14.35,-2]) cylinder(1.5,1,1);
        }
        
        //arm holes
        translate([14,0,3.9]) cylinder(2.2,1.1,1.1);
        translate([10.3,31.5,3.9]) cylinder(2.2,1.1,1.1);
        
        //cutout for the carrier plate
        translate([15,4.35,-1]) cube([3,24,1.2]);
    }
}

connectorCarrier();
mirror([1,0,0]) connectorCarrier();