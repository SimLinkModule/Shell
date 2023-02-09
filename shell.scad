//connector-board
module connectorBoard(height=4){
    $fn=100;
    difference(){ 
        cube([30,20,height]);
        translate([3.3,10,-0.5]) cylinder(height+1,1.1,1.1);
        translate([30-3.3,10,-0.5]) cylinder(height+1,1.1,1.1);
    }
}

//io-board
module ioBoard(height=4){
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
module mainBoard(height=8){
    $fn=100;
    difference(){
        cube([35,52,height]);
        translate([3.3,3.3,-0.5]) cylinder(height+1,1.1,1.1);
        translate([35-3.2,3.3,-0.5]) cylinder(height+1,1.1,1.1);
        translate([3.3,52-3.3,-0.5]) cylinder(height+1,1.1,1.1);
        translate([35-3.2,52-3.3,-0.5]) cylinder(height+1,1.1,1.1);
    }
}

//bottomShell
module bottomShell(){
    length=64;
    width=38;
    $fn=100;
    translate([1,1,0]) hull(){
        cylinder(1,1,1);
        translate([width-2,0,0]) cylinder(1,1,1);
        translate([0,length-2,0]) cylinder(1,1,1);
        translate([width-2,length-2,0]) cylinder(1,1,1);
    }
}

//carrierShell
module carrierShell(){
    length=64;
    width=38;
    $fn=100;
    translate([1,1,0]) hull(){
        cylinder(2,1,1);
        translate([width-2,0,0]) cylinder(2,1,1);
        translate([0,length-2,0]) cylinder(2,1,1);
        translate([width-2,length-2,0]) cylinder(2,1,1);
    }
}

//topShell
module topShell(height=25){
    length=66;
    width=40;
    $fn=100;
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
            cylinder(3.2,1,1);
            translate([width-4,0,0]) cylinder(3.2,1,1);
            translate([0,length-4,0]) cylinder(3.2,1,1);
            translate([width-4,length-4,0]) cylinder(3.2,1,1);
        }
    }
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

translate([2.5,7,19]) ioBoard();
translate([2.5,12,10]) mainBoard();
translate([1,1,0]) bottomShell();
translate([1,1,1]) carrierShell();
%topShell();