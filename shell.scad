//roundedCubeEdge --> eighth of a sphere
module roundedCubeEdge(r=2){
    $fn=100;
    difference(){
        sphere(r);
        translate([-r-0.1,-r-0.1,-r-0.1]) cube([2*r+0.2,2*r+0.2,r+0.1]);
        translate([-r-0.1,-r-0.1,-0.1]) cube([r+0.1,2*r+0.2,r+0.2]);
        translate([-r-0.1,-r-0.1,-0.1]) cube([2*r+0.2,r+0.1,r+0.2]);
    }
}

//cut cylinder for the main mounting holes
module cylinder45Cut(r=3){
    $fn=100;
    boxHeight= sqrt(8*r*r);
    difference(){
        cylinder(2*r,r,r);
        translate([r,-r,0]) rotate([0,315,0]) cube([2*r,2*r,boxHeight]);
    }
}

//Button
module Button(gapWidth=1, gapHeight=0.4, armWidth=9, buttonClickRadius=1, buttonClickHeight=2){
    $fn=100;
    rampeWidth = (2-gapHeight)/tan(60);
    cylinder(2,4,4);
    
    translate([0,0,2]) cylinder(buttonClickHeight,4,buttonClickRadius);
    
    translate([0,-3,0]) cube([armWidth,6,gapHeight]);
    translate([armWidth,-3,gapHeight]) mirror([1,0,0]) rampe(2-gapHeight);
    translate([armWidth-2*rampeWidth-gapWidth,-3,gapHeight]) rampe(2-gapHeight);
    translate([0,-3,0]) cube([armWidth-2*rampeWidth-gapWidth,6,2]);
}

//cutout for the button
module ButtonCutOut(armWidth=9){
    $fn=100;
    cylinder(2.2,5,5);
    translate([0,-4,0]) cube([armWidth,8,2.2]);
}

//ramp for the button
module rampe(height=2){
    a = height/tan(60);
    c = height/sin(60);
    d = a*cos(30);
    difference(){
        cube([a,6,height]);
        translate([a,0,0]) rotate([0,330,0]) cube([d,6,c]);
    }
}

//shell
module shell(height=35){
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
                translate([2,2,-0.2]) cube([width-4,length-4,height-1.8]);
                
                //inner edge for the bottom shell and the carrier shell
                translate([2,2,-0.2]) hull(){
                    cylinder(2.2,1.2,1.2);
                    translate([width-4,0,0]) cylinder(2.2,1.2,1.2);
                    translate([0,length-4,0]) cylinder(2.2,1.2,1.2);
                    translate([width-4,length-4,0]) cylinder(2.2,1.2,1.2);
                }
                
                //cutout for the buttons
                translate([width/2,23,height-2.1]){
                    translate([-9.47,0,0]) rotate([0,0,180]) ButtonCutOut(armWidth=8.53);
                    translate([9.47,0,0]) rotate([0,0,0]) ButtonCutOut(armWidth=8.53);
                }
                
                //cutout for the display
                translate([width/2,34,height-2.1]){
                    translate([-16,0,0]) cube([32,12.9,2.2]);
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
            
            //buttonparts
            translate([width/2,23,height-2]){
                translate([-9.47,0,2]) rotate([0,0,180]) mirror([0,0,1]) Button(gapWidth=3, gapHeight=1, armWidth=8.53, buttonClickHeight=3, buttonClickRadius=1.25);
                translate([9.47,0,2]) rotate([0,0,0]) mirror([0,0,1]) Button(gapWidth=3, gapHeight=1, armWidth=8.53, buttonClickHeight=3, buttonClickRadius=1.25);
            }
            
            //io-pcb srew mount body
            translate([width/2-14.2,23-8.38,height-7]){
                cylinder(7,3,3);
                translate([28.48,0,0]) cylinder(5,3,3);
                translate([0,35.3,0]) cylinder(5,3,3);
                translate([28.48,35.3,0]) cylinder(5,3,3);
            }
            
            //body display cutout
            translate([width/2,33,height-4]){
                translate([-17,0,0]) cube([34,15,2]);
            }
        }
        //main screw mount holes
        translate([3,3,1.9]) cylinder(5.1,1.6,1.6);
        translate([width-3,3,1.9]) cylinder(5.1,1.6,1.6);
        translate([3,length-3,1.9]) cylinder(5.1,1.6,1.6);
        translate([width-3,length-3,1.9]) cylinder(5.1,1.6,1.6);
        
        //io-pcb srew mount holes
        translate([width/2-14.2,23-8.38,height-7.1]){
            cylinder(5,1.6,1.6);
            translate([28.48,0,0]) cylinder(5.1,1.6,1.6);
            translate([0,35.3,0]) cylinder(5.1,1.6,1.6);
            translate([28.48,35.3,0]) cylinder(5.1,1.6,1.6);
        }
        
        //hole display cutout
        translate([width/2,34,height-4.1]){
            translate([-16,0,0]) cube([32,12.9,2.2]);
        }
    }
}

shell();