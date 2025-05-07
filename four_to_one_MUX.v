//4 to 1 MUX
module mux4_to_1(out, i0, i1, i2, i3, s1, s0);
  output out;
  input i0, i1, i2, i3;
  input s1, s0;

  wire s1n, s0n;
  wire y0, y1, y2, y3;

  not (s1n, s1);
  not (s0n, s0);

  and (y0, i0, s1n, s0n);
  and (y1, i1, s1n, s0);
  and (y2, i2, s1, s0n);
  and (y3, i3, s1, s0);

  or (out, y0, y1, y2, y3);
endmodule

module stimulus;
  reg IN0, IN1, IN2, IN3;
  reg S1, S0;

  wire OUTPUT;

  mux4_to_1 mymux(OUTPUT, IN0, IN1, IN2, IN3, S1, S0);

  initial
    begin
      IN0 = 1; IN1 = 0; IN2 = 1; IN3 = 0;
      #1 $display("IN0 = %b, IN1 = %b, IN2 = %b, IN3 = %b\n", IN0, IN1, IN2, IN3);

      S1 = 0; S0 = 0;
      #1 $display("S1 = %b, S0 = %b, OUTPUT = %b \n", S1, S0, OUTPUT);

      S1 = 0; S0 = 1;
      #1 $display("S1 = %b, S0 = %b, OUTPUT = %b \n", S1, S0, OUTPUT);
      
      S1 = 1; S0 = 0;
      #1 $display("S1 = %b, S0 = %b, OUTPUT = %b \n", S1, S0, OUTPUT);
      
      S1 = 1; S0 = 1;
      #1 $display("S1 = %b, S0 = %b, OUTPUT = %b \n", S1, S0, OUTPUT);
    end
endmodule

