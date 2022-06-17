function J=Creat_Jacobian(dz1,th2,th3,th4,th5,th6,th7)
% close all

global Link

jsize=7;
J=zeros(6,jsize);

Link(2).dz=dz1+100;
Link(3).th=th2*pi/180;
Link(4).th=th3*pi/180;
Link(5).th=th4*pi/180;
Link(6).th=th5*pi/180;
Link(7).th=th6*pi/180;
Link(8).th=th7*pi/180;

for i=1:8
Matrix_DH(i);
end

Link(1).p=Link(1).p(1:3);
for i=2:8
      Link(i).A=Link(i-1).A*Link(i).A;
      Link(i).p= Link(i).A(1:3,4);
      Link(i).n= Link(i).A(:,1);
      Link(i).o= Link(i).A(:,2);
      Link(i).a= Link(i).A(:,3);
      Link(i).R=[Link(i).n(1:3),Link(i).o(1:3),Link(i).a(1:3)];
end

target=Link(8).p;
% 滑动关节JT1 雅可比矩阵列
a=Link(1).R*Link(1).az;  
J(:,1)=[a;0;0;0];
% 旋转关节JT2-JT7 雅可比矩阵列
for n=2:7
     a=Link(n).R*Link(n).az;  
     J(:,n)=[cross(a,target-Link(n).p); a];
end
% % 滑动关节JT7 雅可比矩阵列
% a=Link(7).R*Link(7).az;  
% J(:,7)=[a;0;0;0];
end