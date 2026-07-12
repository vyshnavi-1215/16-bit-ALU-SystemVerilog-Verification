// ---------------------------------------------------------------------
// Scoreboard
// Computes expected result independently (golden model) and checks
// it against the DUT's actual output
// ---------------------------------------------------------------------
class scoreboard;
  transaction tr1, tr2;
  mailbox drv2scb;
  mailbox mon2scb;
  bit [32:0] y1;

  int pass_cnt = 0;
  int fail_cnt = 0;

  function new(mailbox drv2scb, mailbox mon2scb);
    this.drv2scb = drv2scb;
    this.mon2scb = mon2scb;
  endfunction

  task scb_run();
    tr1 = new();
    tr2 = new();
    drv2scb.get(tr1);
    mon2scb.get(tr2);

    // Golden / reference model - mirrors the DUT operation table
    case (tr1.sel)
      4'b0000: y1 = tr1.a + tr1.b;                                   // Addition
      4'b0001: y1 = tr1.a - tr1.b;                                   // Subtraction
      4'b0010: y1 = tr1.a * tr1.b;                                   // Multiplication
      4'b0011: y1 = (tr1.b != 0) ? (tr1.a / tr1.b) : 33'd0;          // Division
      4'b0100: y1 = tr1.a & tr1.b;                                   // AND
      4'b0101: y1 = tr1.a | tr1.b;                                   // OR
      4'b0110: y1 = ~(tr1.a & tr1.b);                                // NAND
      4'b0111: y1 = ~(tr1.a | tr1.b);                                // NOR
      4'b1000: y1 = tr1.a << 1;                                      // Logical shift left
      4'b1001: y1 = tr1.a >> 1;                                      // Logical shift right
      4'b1010: y1 = {tr1.a[14:0], tr1.a[15]};                        // Rotate left
      4'b1011: y1 = {tr1.a[0], tr1.a[15:1]};                         // Rotate right
      4'b1100: y1 = tr1.a ^ tr1.b;                                   // XOR
      4'b1101: y1 = ~(tr1.a ^ tr1.b);                                // XNOR
      4'b1110: y1 = (tr1.a > tr1.b) ? 33'd1 : 33'd0;                 // Greater comparison
      4'b1111: y1 = (tr1.a == tr1.b) ? 33'd1 : 33'd0;                // Equal comparison
      default: y1 = 33'd0;
    endcase

    if (tr2.y == y1) begin
      $display("actual   : a=%0d b=%0d sel=%0b y=%0d", tr2.a, tr2.b, tr2.sel, tr2.y);
      $display("expected : a=%0d b=%0d sel=%0b y=%0d", tr1.a, tr1.b, tr1.sel, y1);
      $display("PASS\n");
      pass_cnt++;
    end
    else begin
      $display("actual   : a=%0d b=%0d sel=%0b y=%0d", tr2.a, tr2.b, tr2.sel, tr2.y);
      $display("expected : a=%0d b=%0d sel=%0b y=%0d", tr1.a, tr1.b, tr1.sel, y1);
      $display("FAIL\n");
      fail_cnt++;
    end
  endtask

  function void report();
    $display("=====================================");
    $display(" TOTAL PASS = %0d   TOTAL FAIL = %0d", pass_cnt, fail_cnt);
    $display("=====================================");
  endfunction
endclass
