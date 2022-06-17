function [Q,V,ACC]=Tra434(Th1,Th2,Th3,Th4,V1,alpha1,V4,alpha4)
%Th1-4:末端的四个高度
%V1:起始点速度  alpha1：起始点加速度
%V4：终点速度   alpha4：终点加速度

ToDeg = 180/pi;
ToRad = pi/180;%转化为弧度制
% 地起始时间
Tao1_i=0;
Tao2_i=0;
Tao3_i=0;
% 定义初始本地终端时间
Tao1_f=2;
Tao2_f=4;
Tao3_f=2;
% 定义全局起始、终止时间
t_i=0;
t_f= Tao1_f + Tao2_f + Tao3_f - (Tao1_i + Tao2_i + Tao3_i);
TH=[Th1 V1 alpha1 Th2 Th2 0 0 Th3 Th3 0 0 Th4 V4 alpha4]';

M=[1 0 0 0 0 0 0 0 0 0 0 0 0 0;
   0 1 0 0 0 0 0 0 0 0 0 0 0 0
   0 0 2 0 0 0 0 0 0 0 0 0 0 0
   1 Tao1_f Tao1_f^2 Tao1_f^3 Tao1_f^4 0 0 0 0 0 0 0 0 0
   0 0 0 0 0 1 0 0 0 0 0 0 0 0
   0 1 2*Tao1_f 3*Tao1_f^2 4*Tao1_f^3 0 -1 0 0 0 0 0 0 0
   0 0 2 6*Tao1_f 12*Tao1_f^2 0 0 -2 0 0 0 0 0 0
   0 0 0 0 0 1 Tao2_f Tao2_f^2 Tao2_f^3 0 0 0 0 0
   0 0 0 0 0 0 0 0 0 1 0 0 0 0
   0 0 0 0 0 0 1 2*Tao2_f 3*Tao2_f^2 0 -1 0 0 0
   0 0 0 0 0 0 0 2 6*Tao2_f 0 0 -2 0 0
   0 0 0 0 0 0 0 0 0 1 Tao3_f Tao3_f^2 Tao3_f^3 Tao3_f^4
   0 0 0 0 0 0 0 0 0 0 1 2*Tao3_f 3*Tao3_f^2 4*Tao3_f^3
   0 0 0 0 0 0 0 0 0 0 0 2 6*Tao3_f 12*Tao3_f^2];

C=inv(M)*TH;
a0=C(1);a1=C(2);a2=C(3);a3=C(4);a4=C(5);
b0=C(6);b1=C(7);b2=C(8);b3=C(9);
c0=C(10);c1=C(11);c2=C(12);c3=C(13);c4=C(14);
%轨迹生成
%轨迹定义条件
t1 = Tao1_i:0.1:Tao1_f;
t2 = Tao2_i:0.1:Tao2_f; %要考虑函数重合
t3 = Tao3_i:0.1:Tao3_f;
t = t_i:0.1:t_f;
%位置
q1=a0+a1*power(t1,1)+a2*power(t1,2)+a3*power(t1,3)+a4*power(t1,4);
q2=b0+b1*power(t2,1)+b2*power(t2,2)+b3*power(t2,3);
q3=c0+c1*power(t3,1)+c2*power(t3,2)+c3*power(t3,3)+c4*power(t3,4);
q=[q1 q2 q3];
%速度
v1=a1+2*a2*power(t1,1)+3*a3*power(t1,2)+4*a4*power(t1,3);
v2=b1+2*b2*power(t2,1)+3*b3*power(t2,2);
v3=c1+2*c2*power(t3,1)+3*c3*power(t3,2)+4*c4*power(t3,3);
v=[v1 v2 v3];
%加速度
acc1=2*a2+6*a3*power(t1,1)+12*a4*power(t1,2);
acc2=2*b2+6*b3*power(t2,1);
acc3=2*c2+6*c3*power(t3,1)+12*c4*power(t3,2);
acc=[acc1 acc2 acc3];

Q=q;
V=v;
ACC=acc;
