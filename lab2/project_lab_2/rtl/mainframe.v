`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2020 18:33:32
// Design Name: 
// Module Name: mainframe
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


//������ mainframe
module mainframe(                           
  input      [10:0]  sw,                     //���� ��������������
  //��������!!! sw[10] ������������ ��� ��������� ������� "debounce" ��� ������. �������� ������ = 1 
  input      [4:0]  btn,                    //���� ������ (btn[0]=key0, btn[4]=key1)
  input             clk_50m,                //���� ��������� ������� �������� 50 ���
  output     [9:0]  led,                    //����� �� ���������� 
  output reg [6:0]  hex0,                   //����� �� ������ �������������� ���������
  output reg [6:0]  hex1,                   //����� �� ������ �������������� ���������
  output     [7:0]  hex_on                  //����� ������������� ��������������� ���������� �� 8 (0 - ��������)
    );
     
  wire [9:0]register;                //���� �������� (��������� �������� ���������� ��������������)
  wire [7:0]counter;                 //���� �������� (������� ������������ �� ����� ����� ���������� ������. � �������)
  assign led = register;             //���������� �������� � ������ �� ����������
  assign hex_on = 8'b1111_1100;      //�������� ������ 
  
  //����/����� �������� �� ������ hub
  hub u1(                         
    .btn_i      (  btn[4:0]      ),
    .sw_i       (  sw[10:0]      ),
    .clk_50m    (  clk_50m       ),
    .register_o (  register[9:0] ),
    .counter_o  (  counter[7:0]  )
  );
  
  //���������� ������ �� �������������� ����������:
  always @(*) begin
      case (counter[3:0])        //�� ������ ��������� ��������� ������ 4 ���� ��������
          4'd0  : hex0 = 7'b100_0000;
          4'd1  : hex0 = 7'b111_1001;
          4'd2  : hex0 = 7'b010_0100;
          4'd3  : hex0 = 7'b011_0000;
          4'd4  : hex0 = 7'b001_1001;
          4'd5  : hex0 = 7'b001_0010;
          4'd6  : hex0 = 7'b000_0010;
          4'd7  : hex0 = 7'b111_1000;
          4'd8  : hex0 = 7'b000_0000;
          4'd9  : hex0 = 7'b001_0000;
          4'd10 : hex0 = 7'b000_1000;
          4'd11 : hex0 = 7'b000_0011;
          4'd12 : hex0 = 7'b100_0110;
          4'd13 : hex0 = 7'b010_0001;
          4'd14 : hex0 = 7'b000_0110;
          4'd15 : hex0 = 7'b000_1110;
      endcase
      case (counter[7:4])        //�� ������ ��������� ��������� ������ 4 ���� ��������
          4'd0  : hex1 = 7'b100_0000;
          4'd1  : hex1 = 7'b111_1001;
          4'd2  : hex1 = 7'b010_0100;
          4'd3  : hex1 = 7'b011_0000;
          4'd4  : hex1 = 7'b001_1001;
          4'd5  : hex1 = 7'b001_0010;
          4'd6  : hex1 = 7'b000_0010;
          4'd7  : hex1 = 7'b111_1000;
          4'd8  : hex1 = 7'b000_0000;
          4'd9  : hex1 = 7'b001_0000;
          4'd10 : hex1 = 7'b000_1000;
          4'd11 : hex1 = 7'b000_0011;
          4'd12 : hex1 = 7'b100_0110;
          4'd13 : hex1 = 7'b010_0001;
          4'd14 : hex1 = 7'b000_0110;
          4'd15 : hex1 = 7'b000_1110;
      endcase
  end
  
endmodule
