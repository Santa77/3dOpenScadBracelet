// BRACELET TOOL FOR MEASUREMENT

//parameters
inner_text="21";
outer_circumference =  210; //mm
thickness = 1;
spacer =10;
overall_height =  20;
base = 1.2;
accuracy = 256;

// CALCULATION
outer_radius = outer_circumference/(2*3.14);


// TEXT EXTRUSION
module generate_text(text, font, h) {
    linear_extrude(height=h)
    text(text, font=font);
  
}

// MAIN CODE
union() {
    
    // MAIN TUBE
    difference() {

        // OUTER
        linear_extrude (height = overall_height)
            circle (r = outer_radius, $fn = accuracy);

        // INNER
        translate ([0, 0, -1])
            linear_extrude (height = overall_height+2)
                circle (r = outer_radius-thickness, $fn = accuracy);
    }

    // BASE
    linear_extrude (height = base)
        circle (r = outer_radius+spacer, $fn = accuracy);
    
    // CENTRAL TEXT
    translate ([-10, -5, base])
        scale (v = [1.44, 1.44, 1])
            generate_text(inner_text,"Liberation Sans:style=Bold", base*1.5);
}
