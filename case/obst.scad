/*
 * Obst Case
 * Copyright (c) 2024 Lone Dynamics Corporation. All rights reserved.
 *
 * required hardware:
 *  - 4 x M3 x 30mm countersunk bolts
 *  - 4 x M3 nuts
 * 
 */

$fn = 100;

board_width = 62;
board_thickness = 1.404;
board_length = 100;
board_height = 1.6;
board_spacing = 2;

wall = 1.5;

translate([2,2,-1.6]) mdr_board();

translate([0,0,0])
	mdr_case_top();

translate([0,0,-10])
	mdr_case_bottom();

module mdr_board() {
	
	difference() {
		union() {
			color([0,0.5,0])
				roundedcube(board_width,board_length,board_thickness, 4);

		}
		translate([4, 4, -1]) cylinder(d=3.2, h=100);
		translate([4, 96, -1]) cylinder(d=3.2, h=100);
		translate([58, 4, -1]) cylinder(d=3.2, h=100);
		translate([58, 96, -1]) cylinder(d=3.2, h=100);
	}	
		
}

module mdr_case_top() {

		translate([0,25,19])
				rotate([90,0,270])
					translate([-62.5,-10,0])
						linear_extrude(1)
							text("O B S T", size=4, halign="center",
								font="Liberation Sans:style=Bold");

		// addl supports
		translate([62,30.5+(14.5/2)+2,0]) cube([3.25,4,20]);
		translate([62,49.5+(14.5/2)+1.5,0]) cube([3.25,4.425,20]);

				
		translate([2,2,0]) {
			difference() {
				union() {
					translate([0,0,0]) cube([10,9,20]);
					translate([0,91.65,0]) cube([10,8.5,20]);
					translate([52,0,0]) cube([10,9,20]);
					translate([52,91.65,0]) cube([10,8.5,20]);
				}		

				// bolt holes
				translate([4,4,0]) cylinder(d=3.2, h=50);
				translate([4,96,0]) cylinder(d=3.2, h=50);
				translate([58,4,0]) cylinder(d=3.2, h=50);
				translate([58,96,0]) cylinder(d=3.2, h=50);
				
				translate([4,4,18.5]) cylinder(d=6, h=2);
				translate([4,96,18.5]) cylinder(d=6, h=2);
				translate([58,4,18.5]) cylinder(d=6, h=2);
				translate([58,96,18.5]) cylinder(d=6, h=2);

			}

		}
	
		difference () {
			
			// body			
			union() {
				roundedcube(board_width+4,board_length+4,20,5);
			}
			
			translate([2,2,-0.01]) {
				
				translate([0,0,0]) roundedcube(board_width,board_length,20-2,5);

				// vents
				translate([66/2-(15/2)-2,104/2-2-5,15]) rotate([0,0,-10]) cube([15,1,20]);
				translate([66/2-(15/2)-2,104/2-2,15]) rotate([0,0,-10]) cube([15,1,20]);
				translate([66/2-(15/2)-2,104/2-2+5,15]) rotate([0,0,-10]) cube([15,1,20]);		
				
				// LED vents
				translate([-10,86-5,3]) cube([25,1,1]);
				translate([-10,86,3]) cube([25,1,1]);
				translate([-10,86+5,3]) cube([25,1,1]);
				
				// PMODA
				translate([-10,43.075-(16/2),0]) cube([25,16,5.1]);

				// PMODB
				translate([-10,65.95-(16/2),0]) cube([25,16,5.1]);

				// sd card
				translate([-10,19-(15/2),0])
					cube([15,15,3]);

				// usb host
				translate([25.5-(15/2),-5,0])
					cube([15,10,16.25]);
				
				// audio jack
				translate([44.5-(6.5/2),-5,0])
					cube([6.5,10,6]);
	
				// VGA
				translate([55,76.175-(31/2),0]) cube([30,31,12.5]);
	
				// PS/2
				translate([55,30.5-(14.5/2),-2]) cube([30,14.5,13+2]);
				translate([55,49-(14.5/2),-2]) cube([30,14.5,13+2]);
				
				// usb-c
				translate([55,14-(9.5/2),0])
					cube([10,9.5,3.25]);

				// bolt holes
				translate([4,4,0]) cylinder(d=3.2, h=50);
				translate([4,96,0]) cylinder(d=3.2, h=50);
				translate([58,4,0]) cylinder(d=3.2, h=50);
				translate([58,96,0]) cylinder(d=3.2, h=50);
				
				translate([4,4,18.5]) cylinder(d=6, h=2);
				translate([4,96,18.5]) cylinder(d=6, h=2);
				translate([58,4,18.5]) cylinder(d=6, h=2);
				translate([58,96,18.5]) cylinder(d=6, h=2);
		
			}

		}				
		
}

module mdr_case_bottom() {

		difference () {
			
			union() {
				roundedcube(board_width+4,board_length+4,10,5);
			}
						
			translate([2,2,0]) {
				
				translate([8,-0.1,2]) roundedcube(board_width-8-8,board_length+0.2,10,5);
				translate([-0.25,8,2]) roundedcube(board_width+0.5,board_length-16,10,5);
			
				translate([-0.125,-0.125, 10-1.65])
					roundedcube(board_width+0.25,board_length+0.25, 10, 4);
				
				// bolt holes
				translate([4,4,0]) cylinder(d=3.2, h=50);
				translate([4,96,0]) cylinder(d=3.2, h=50);
				translate([58,4,0]) cylinder(d=3.2, h=50);
				translate([58,96,0]) cylinder(d=3.2, h=50);

				// nut holes
				translate([4,4,-1.75]) cylinder(d=7, h=4.5, $fn=6);
				translate([4,96,-1.75]) cylinder(d=7, h=4.5, $fn=6);
				translate([58,4,-1.75]) cylinder(d=7, h=4.5, $fn=6);
				translate([58,96,-1.75]) cylinder(d=7, h=4.5, $fn=6);


			}

		}
		
}

// https://gist.github.com/tinkerology/ae257c5340a33ee2f149ff3ae97d9826
module roundedcube(xx, yy, height, radius)
{
    translate([0,0,height/2])
    hull()
    {
        translate([radius,radius,0])
        cylinder(height,radius,radius,true);

        translate([xx-radius,radius,0])
        cylinder(height,radius,radius,true);

        translate([xx-radius,yy-radius,0])
        cylinder(height,radius,radius,true);

        translate([radius,yy-radius,0])
        cylinder(height,radius,radius,true);
    }
}
