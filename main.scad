use <basePlate.scad>
use <carrierPlate.scad>
use <shell.scad>
use <connectorCarrier.scad>


//Illustration of how to put everything together
%shell();
translate([1,1,1]) carrierPlate();
translate([1,1,1]) mirror([0,0,1]) basePlate();
translate([20,24,2]) connectorCarrier();
translate([20,24,2]) mirror([1,0,0]) connectorCarrier();