clc;
clear all;
close all;

global Link

ToDeg = 180/pi;  %转角度
ToRad = pi/180;  %转弧度

%输入起始六关节位置
th=[0,0,0,0,0,0,0]';

%输入目标末端位置及旋转矩阵
Ri=rpy2rot(20*ToRad,0*ToRad,80*ToRad);   %有用
Pi=[480,10,550]';    

ni=[Ri(:,1);0]; 
oi=[Ri(:,2);0];
ai=[Ri(:,3);0];
pi=[Pi;1];
Ti=[ni,oi,ai,pi];

%绘制机械臂初始位姿及末端姿态
DHfk_7Dbot(th(1), th(2), th(3), th(4), th(5), th(6),th(7), 0);   %绘制机械臂  函数里面转弧度
DrawFrame(Ri,Pi);      %绘制目标点坐标系
view(-21,12); 
% pause; 
cla;

solu1=IK_num_solu(Ti);

DHfk_7Dbot(solu1(1),solu1(2),solu1(3),solu1(4),solu1(5),solu1(6),solu1(7),0);