`timescale 1ns / 1ps
timeunit 1ns;
timeprecision 1ps;

module register (
    input  logic        clk,
    input  logic        rstn,    // active low asynchronous reset
    input  logic        enable,
    input  logic [7:0]  data_i,
    output logic [7:0]  data_o
);

    always_ff @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            data_o <= '0;
        end else if (enable) begin
            data_o <= data_i;
        end
        // else: retain current value
    end

endmodule
