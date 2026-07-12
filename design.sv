// Design Under Test: 16-bit ALU
// 2 x 16-bit operands, 4-bit select line -> 16 operations, 33-bit output
// (matches Fig 4 "RTL pinout diagram" in the reference paper)

module alu16bit(
  input  clk, rst,
  input  [15:0] a,
  input  [15:0] b,
  input  [3:0]  sel,
  output reg [32:0] y
);

  always @(posedge clk) begin
    if (rst) begin
      y <= 33'd0;
    end
    else begin
      case (sel)
        4'b0000: y <= a + b;                              // Addition
        4'b0001: y <= a - b;                               // Subtraction
        4'b0010: y <= a * b;                                // Multiplication
        4'b0011: y <= (b != 0) ? (a / b) : 33'd0;           // Division
        4'b0100: y <= a & b;                                // AND
        4'b0101: y <= a | b;                                // OR
        4'b0110: y <= ~(a & b);                             // NAND
        4'b0111: y <= ~(a | b);                             // NOR
        4'b1000: y <= a << 1;                               // Logical shift left
        4'b1001: y <= a >> 1;                               // Logical shift right
        4'b1010: y <= {a[14:0], a[15]};                     // Rotate left
        4'b1011: y <= {a[0], a[15:1]};                      // Rotate right
        4'b1100: y <= a ^ b;                                // XOR
        4'b1101: y <= ~(a ^ b);                             // XNOR
        4'b1110: y <= (a > b)  ? 33'd1 : 33'd0;              // Greater comparison
        4'b1111: y <= (a == b) ? 33'd1 : 33'd0;              // Equal comparison
        default: y <= 33'd0;
      endcase
    end
  end

endmodule
