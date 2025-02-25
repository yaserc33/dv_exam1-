`timescale 1ns / 1ps

module bit_serial_adder (
    input  logic        clk,
    input  logic        rst_n,
    input  logic        load,
    input  logic        start,
    input  logic [3:0]  A,
    input  logic [3:0]  B,
    output logic  [3:0]  sum,
    output logic         done
);

  logic [3:0] A_logic, B_logic;
  logic [3:0] sum_logic;
  logic       carry;
  logic [2:0] bit_count;
  logic sum_bit;
  logic carry_out;

  localparam IDLE   = 2'b00,
             ADDING = 2'b01,
             DONE   = 2'b10;

  logic [1:0] state;

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      A_logic     <= 4'd0;
      B_logic     <= 4'd0;
      sum_logic   <= 4'd0;
      sum       <= 4'd0;
      carry     <= 1'b0;
      bit_count <= 3'd0;
      done      <= 1'b0;
      state     <= IDLE;
    end 
    else begin
      case (state)
        IDLE: begin
          done <= 1'b0;
          if (load) begin
            A_logic     <= A;
            B_logic     <= B;
            sum_logic   <= 4'd0;
            carry     <= 1'b0;
            bit_count <= 3'd0;
          end
          if (start) begin
            state <= ADDING;
          end
        end

        ADDING: begin
          sum_bit   = A_logic[0] ^ B_logic[0] ^ carry;
          carry_out = (A_logic[0] & B_logic[0]) | (carry & (A_logic[0] ^ B_logic[0]));
          sum_logic        <= {sum_bit, sum_logic[3:1]};
          A_logic          <= A_logic >> 1;
          B_logic          <= B_logic >> 1;
          carry          <= carry_out;
          bit_count      <= bit_count + 1'b1;
          if (bit_count == 3'd3) begin
            state <= DONE;
          end
        end

        DONE: begin
          sum  <= sum_logic;
          done <= 1'b1;
          state <= IDLE;
        end
      endcase
    end
  end

endmodule
