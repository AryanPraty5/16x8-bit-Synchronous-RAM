`timescale 1ns/1ps

module ram_model_tb;

reg [3:0]address;
reg clk,wr;         //wr = 1 implies writing onto memory
                    //wr = 0 implies reading and going to the bus
wire [7:0]bus;

reg [7:0]bus_tb;
reg bus_drive;

    assign bus = (bus_drive) ? bus_tb : 8'bz;

    ram_model ram1(.address(address),.clk(clk),.wr(wr),.bus(bus));

    initial
        begin
            clk =0;
            forever #5 clk = ~clk;
        end
    
    initial
        begin
            bus_tb = 8'h6;      
            bus_drive = 1'b1;   //writing value 6 to memory address 3
            address = 4'h3;
            wr = 1'b1;          

            #11;

            wr = 1'b1;
            bus_tb = 8'ha;      
            bus_drive = 1'b1;   //writing value 10(a) to memory address 7
            address = 4'h7;

            #10;

            wr = 1'b0;
            bus_drive = 1'b0;   // reading value from memory address 3
            address = 4'h3;
           
            #10;

            address = 4'h5;     //reading value from memory address 5 which isnt assigned yet

            #10;

            address = 4'h7;

            #10;

            $stop;

        end
endmodule
