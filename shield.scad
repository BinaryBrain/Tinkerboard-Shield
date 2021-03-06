holeSize = 3;
holeLen = 58;
holeWidth = 49;

W = 54.102;
L = 85.598;

fanLen = 30;
fanHoleSpacing = 24;
fanBlades = 28;

mainMargin = 3;
margin = (W - holeWidth) / 2;
l = margin + holeLen;

module fan() {
    margin = (fanLen - fanHoleSpacing) / 2;
    translate([margin, margin])
    circle(d=holeSize, $fn=20);
    translate([fanLen - margin, margin])
    circle(d=holeSize, $fn=20);
    translate([margin, fanLen - margin])
    circle(d=holeSize, $fn=20);
    translate([fanLen - margin, fanLen - margin])
    circle(d=holeSize, $fn=20);
    translate([fanLen / 2, fanLen / 2])
    circle(d=fanBlades, $fn=30);
}

module board() {
    translate([margin, margin])
    circle(d=holeSize, $fn=20);
    translate([l, margin])
    circle(d=holeSize, $fn=20);
    translate([margin, W - margin])
    circle(d=holeSize, $fn=20);
    translate([l, W - margin])
    circle(d=holeSize, $fn=20);
}

// text("BinaryMedia", size=5.7, font="SirinStencil:style=Regular")

difference() {
    translate([-mainMargin, -mainMargin])
    square([L+mainMargin*2, W+mainMargin*2]);
    board();
    translate([20, W - fanLen - 8])
    fan();
    translate([margin + holeSize, W - 6])
    square([l - (margin * 2 + holeSize), 6 + mainMargin]);

    rotate(-90) 
    translate([-45, 75]) {
        fontSize = 9;
        text("Binary", size=fontSize, font="Allerta Stencil:style=Regular");
        
        translate([0, -fontSize * 1.3])
        text("Media", size=fontSize, font="Allerta Stencil:style=Regular");
    }
}
