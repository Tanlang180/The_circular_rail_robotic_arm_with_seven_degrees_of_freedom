function Matrix_DH(i) 
% Caculate the D-H Matrix
global Link      %声明全局变量

ToDeg = 180/pi;
ToRad = pi/180;


C=cos(Link(i).th);
S=sin(Link(i).th);
Ca=cos(Link(i).alf);
Sa=sin(Link(i).alf);
a=Link(i).dx;    %distance between zi and zi-1
d=Link(i).dz;    %distance between xi and xi-1

Link(i).n=[C,S,0,0]';    %增加结构体中的成员变量
Link(i).o=[-1*S*Ca,C*Ca,Sa,0]';
Link(i).a=[S*Sa, -1*C*Sa,Ca,0]';
Link(i).p=[a*C,a*S,d,1]';

Link(i).R=[Link(i).n(1:3),Link(i).o(1:3),Link(i).a(1:3)];
Link(i).A=[Link(i).n,Link(i).o,Link(i).a,Link(i).p];
