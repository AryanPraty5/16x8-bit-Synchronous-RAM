module ram_model(
    input [3:0]address,
    input clk,wr,
    inout [7:0]bus
);

    reg [7:0] mem[0:15]; // 16 of the 8bits array acting as RAM

    always@(posedge clk)
        begin
            if(wr)
                mem[address] <= bus;
        end
    
    assign bus = (!wr) ? mem[address] : 8'bz;

endmodule






