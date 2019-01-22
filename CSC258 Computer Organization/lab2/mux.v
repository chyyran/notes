//SW[2:0] data inputs
//SW[9] select signal

//LEDR[0] output display

wire ConnectionUV ;
wire ConnectionWX ;

module mux(LEDR, SW);
    input [9:0] SW;
    output [9:0] LEDR;

    mux2to1 u0(
        .x(SW[0]),
        .y(SW[1]),
        .s(SW[9]),
        .m(LEDR[0])
        );
endmodule

module mux4(LEDR, SW);
    input [9:0] SW;
    output [9:0] LEDR;

    mux2to1 u0(
        .x(SW[0]),
        .y(SW[1]),
        .s(SW[9]),
        .m(ConnectionUV)
    );
    
    mux2to1 u1(
        .x(SW[2]),
        .y(SW[3]),
        .s(SW[9]),
        .m(ConnectionWX)
    );

    mux2to1 u_switch(
        .x(ConnectionUV),
        .y(ConnectionWX),
        .s(SW[8]),
        .m(LEDR[0])
    );

endmodule

module mux2to1(x, y, s, m);
    input x; //selected when s is 0
    input y; //selected when s is 1
    input s; //select signal
    output m; //output
  
    assign m = s & y | ~s & x;
    // OR
    // assign m = s ? y : x;
endmodule

