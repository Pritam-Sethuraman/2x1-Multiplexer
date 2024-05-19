module mux_2to1 (
    input logic sel,        // Selector input
    input logic input0,     // Data input 0
    input logic input1,     // Data input 1
    output logic y          // Output
);

    initial begin
        if (sel) begin
            y = input1;     // If sel is 1, choose input1
        end else begin
            y = input0;     // If sel is 0, choose input0
        end
    end
endmodule
