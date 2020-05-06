`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2020 14:43:01
// Design Name: 
// Module Name: keys_debounce
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

//������ keys_debounce (������� - "KP")
//���������� ����� ������ - ���������� ���������� ����������� ��������� ������ � ���� ������
module keys_debounce(
  input   [4:0] btn_i,         //���� ������
  input         clk_50m,    //���� ��������� ��������
  output  [4:0] btn_ondn_o     //����� ������� � ���, ��� ������ ���� ������
    );
    
  wire [4:0]btn_onup;        //����������������� ���� ������� ������
  wire [4:0]btn_state;       //����������������� ���� ��������� ������
      
// ������ ��������� �������� � ������ [4:0]btn_i   
  debouncer u1(
    .btn_i   (btn_i[0]),
    .onup_o  (btn_onup[0]),
    .ondn_o  (btn_ondn_o[0]),
    .state_o (btn_state[0]),
    .clk_i     (clk_50m)
  ); // ������ btn_i[0]
    debouncer u2(
    .btn_i   (btn_i[1]),
    .onup_o  (btn_onup[1]),
    .ondn_o  (btn_ondn_o[1]),
    .state_o (btn_state[1]),
    .clk_i     (clk_50m)
  ); // ������ btn_i[1] ��� KEY[0]
    debouncer u3(
    .btn_i   (btn_i[2]),
    .onup_o  (btn_onup[2]),
    .ondn_o  (btn_ondn_o[2]),
    .state_o (btn_state[2]),
    .clk_i     (clk_50m)
  ); // ������ btn_i[2]
    debouncer u4(
    .btn_i   (btn_i[3]),
    .onup_o  (btn_onup[3]),
    .ondn_o  (btn_ondn_o[3]),
    .state_o (btn_state[3]),
    .clk_i     (clk_50m)
  ); // ������ btn_i[3] ��� KEY[1]
    debouncer u5(
    .btn_i   (btn_i[4]),
    .onup_o  (btn_onup[4]),
    .ondn_o  (btn_ondn_o[4]),
    .state_o (btn_state[4]),
    .clk_i     (clk_50m)
  ); // ������ btn_i[4]
endmodule