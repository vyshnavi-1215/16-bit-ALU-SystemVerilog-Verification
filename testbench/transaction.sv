// ---------------------------------------------------------------------
// Transaction class
// Data packet holding ALU operands, select line, and result
// ---------------------------------------------------------------------
class transaction;
  rand bit [15:0] a;
  rand bit [15:0] b;
  rand bit [3:0]  sel;   // select line, 16 operations
  bit [32:0]      y;     // 33-bit ALU output (as per RTL pinout in paper)

  constraint sel_range { sel inside {[0:15]}; }

  function void display(string tag);
    $display("[%0s] a=%0d b=%0d sel=%0b y=%0d", tag, a, b, sel, y);
  endfunction
endclass
