`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2020 18:25:31
// Design Name: 
// Module Name: switch_event
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


module switch_event(
    input       [9:0]   sw_i,                  //���� ������ c �������������� � ���������� ��
    input               clk_50m,            //���� ��������� ��������
    input               btn_sync_i,        //���� ������ (��� ������ ������������ ��� ������ �� ���������� �������� � �� �������� �� ��)
    
    output reg          synced_event_o = 0 //����� ��
      );
    
    reg         sw_event = 0;            //������� ����������� �������
    reg  [2:0]  event_sync_reg = 3'b000;     //���������������� ������� 1         
    parameter   EV_CONST = 4'd2;
    // ���������� ����������� ������� (�������������� �������)
    // �������� ������� ����������� ������� � ������ ��������� ����������� �������� KEY[0]
    always @(sw_i[9:0])
        if (sw_i[0]+sw_i[1]+sw_i[2]+sw_i[3]+sw_i[4]+sw_i[5]+sw_i[6]+sw_i[7]+sw_i[8]+sw_i[9]>EV_CONST) 
            sw_event <= 1'b1; 
        else 
            sw_event <= 1'b0;
    //��������� sw_event ����������, ��������� �� ���������� ������� ��� ��������� ��������� ��������� ��������������
    
    
    //���������  sw_event ���������������� � 2 �����
    //���� 1 - ������������� Reg_sw_event � clk_50m
    //���� ���� ��������� ����� ������� ���������� (��� ���������� ������������ sw_i) ������ � �������� ���������
    //(�� �� ��� ����������, �� 0->1 ���������� ������������ � ��������)
    always @(posedge clk_50m) begin
        event_sync_reg[2]   <= sw_event;
        event_sync_reg[1:0] <= event_sync_reg[2:1];
    end
    
    //���� 2 - ������������� Reg_sw_event � btn_sync_i
    //���� ���� ��������� ����� ������� ������������������ � �������� ������ Reg_sw_event � ��������� �� ������� ������
    //(��������� ���������� ������ �� ����������� �� � ��������� ��������� ������� �� ������� ������)
    always @(posedge btn_sync_i) begin
        synced_event_o <= event_sync_reg[1] & event_sync_reg[0];
        #20;
        synced_event_o <= 1'b0; 
    end
    //����� ���� ������������� �� ������ ������� synced_event
endmodule