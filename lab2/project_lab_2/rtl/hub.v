`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2020 23:26:34
// Design Name: 
// Module Name: KEY_Switching
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

//������ hub 
//�� ���������� ������� ������ - ��������� ��������� ����������. ��� ������� ��� ����� ����������, � ��� ������� ��������� � mainframe
module hub(               //������ hub (������� - "KS")
input   [9:0]   sw_i,              //���� ��������������
input   [4:0]   btn_i,             //���� ������ 
input           clk_50m,        //���� ��������� ������� �������� 50 ���
output  [9:0]   register_o,        //����� ��������
output  [7:0]   counter_o          //����� ��������
    );
  
  wire          synced_event;    //���� ������� � ������������ ��
  wire  [4:0]   btn_ondn;        //���� ������� � ���, ��� ������ ���� ������
  
 //����/����� �������� �� ������ KEY_Pressing (������� - "KP")
  keys_debounce u1(
    .btn_i(btn_i[4:0]),
    .clk_50m(clk_50m),
    .btn_ondn_o(btn_ondn[4:0])
  ); // ���� ������
  
  //����/����� �������� �� ������ Register_10 (������� �� 10 �������)
  register_10 u2(
    .d_i(sw_i[9:0]),                 
    .clk_i(clk_50m),              
    .rst_i(btn_ondn[3]),           
    .en_i(btn_ondn[0]),            
    .register_o(register_o[9:0])     
  );
  
  //����/����� �������� �� ������ Counter_8 (8-������ �������)
  counter_8 u3(
    .clk_i(clk_50m),
    .rst_i(btn_ondn[3]),
    .en_i(synced_event),
    .counter_o(counter_o[7:0])
  ); 
  
  //����/����� �������� �� ������ REG_Event (������� - "REG")(�������� ������� ��)
  switch_event u4(
    .sw_i(sw_i[9:0]),
    .clk_50m(clk_50m),
    .synced_event_o(synced_event),
    .btn_sync_i(btn_ondn[0])
  );
  
  
endmodule