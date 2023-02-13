/*TODO
- Schauen wie lang die Schrauben sind damit passende Löcher gemacht werden
- Buttoncutouts hinzufügen mit Buttonerhöhung
- connectorcutout hinzufügen
- Displaycutout und wand hinzufügen
- Halterungen für PCBs erstellen
*/

//connector-board
module connectorBoard(height=6){
    $fn=100;
    difference(){ 
        cube([30,20,height]);
        translate([3.3,10,-0.5]) cylinder(height+1,1.1,1.1);
        translate([30-3.3,10,-0.5]) cylinder(height+1,1.1,1.1);
    }
}

//io-board
module ioBoard(height=6){
    $fn=100;
    difference(){
        cube([35,42,height]);
        translate([3.3,3.3,-0.5]) cylinder(height+1,1.1,1.1);
        translate([35-3.3,3.3,-0.5]) cylinder(height+1,1.1,1.1);
        translate([3.3,42-3.3,-0.5]) cylinder(height+1,1.1,1.1);
        translate([35-3.3,42-3.3,-0.5]) cylinder(height+1,1.1,1.1);
    }   
}

//Mainboard
module mainBoard(height=12){
    $fn=100;
    difference(){
        cube([35,52,height]);
        translate([3.3,3.3,-0.5]) cylinder(height+1,1.1,1.1);
        translate([35-3.2,3.3,-0.5]) cylinder(height+1,1.1,1.1);
        translate([3.3,52-3.3,-0.5]) cylinder(height+1,1.1,1.1);
        translate([35-3.2,52-3.3,-0.5]) cylinder(height+1,1.1,1.1);
    }
}

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

//roundedCubeEdge
module roundedCubeEdge(r=2){
    $fn=100;
    difference(){
        sphere(r);
        translate([-r-0.1,-r-0.1,-r-0.1]) cube([2*r+0.2,2*r+0.2,r+0.1]);
        translate([-r-0.1,-r-0.1,-0.1]) cube([r+0.1,2*r+0.2,r+0.2]);
        translate([-r-0.1,-r-0.1,-0.1]) cube([2*r+0.2,r+0.1,r+0.2]);
    }
}

//bottomShell
module bottomShell(){
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

//carrierShell
module carrierShell(){
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
}

//topShell
module topShell(height=25){
    length=66;
    width=40;
    $fn=100;
    
    difference(){
        union(){
            difference(){
                //outerskin
                translate([2,2,0]) hull(){
                    cylinder(height-2,2,2);
                    translate([0,0,height-2]) rotate([0,0,180]) roundedCubeEdge();
                    translate([width-4,0,0]) cylinder(height-2,2,2);
                    translate([width-4,0,height-2]) rotate([0,0,270]) roundedCubeEdge();
                    translate([0,length-4,0]) cylinder(height-2,2,2);
                    translate([0,length-4,height-2]) rotate([0,0,90]) roundedCubeEdge();
                    translate([width-4,length-4,0]) cylinder(height-2,2,2);
                    translate([width-4,length-4,height-2]) rotate([0,0,0]) roundedCubeEdge();
                }
                //innerskin
                translate([2,2,-0.2]) cube([width-4,length-4,height-2.2]);
                
                //inner edge for the bottom shell and the carrier shell
                translate([2,2,-0.2]) hull(){
                    cylinder(2.2,1.2,1.2);
                    translate([width-4,0,0]) cylinder(2.2,1.2,1.2);
                    translate([0,length-4,0]) cylinder(2.2,1.2,1.2);
                    translate([width-4,length-4,0]) cylinder(2.2,1.2,1.2);
                }
            }
            
            //main screw mount body
            translate([3,3,2]) cylinder(5,3,3);
            translate([3,3,7]) rotate([0,0,45]) cylinder45Cut();
            translate([width-3,3,2]) cylinder(5,3,3);
            translate([width-3,3,7]) rotate([0,0,135]) cylinder45Cut();
            translate([3,length-3,2]) cylinder(5,3,3);
            translate([3,length-3,7]) rotate([0,0,315]) cylinder45Cut();
            translate([width-3,length-3,2]) cylinder(5,3,3);
            translate([width-3,length-3,7]) rotate([0,0,225]) cylinder45Cut();
        }
        //main screw mount holes
        translate([3,3,1.9]) cylinder(5,1.6,1.6);
        translate([width-3,3,1.9]) cylinder(5,1.6,1.6);
        translate([3,length-3,1.9]) cylinder(5,1.6,1.6);
        translate([width-3,length-3,1.9]) cylinder(5,1.6,1.6);
    }
}

module cylinder45Cut(r=3){
    $fn=100;
    boxHeight= sqrt(8*r*r);
    difference(){
        cylinder(2*r,r,r);
        translate([r,-r,0]) rotate([0,315,0]) cube([2*r,2*r,boxHeight]);
    }
}

//translate([2.5,7,17]) ioBoard();
//translate([2.5,12,5]) mainBoard();
//translate([2.5,2,2]) connectorBoard();
//bottomShell();
//%translate([1,1,1]) carrierShell();
topShell();