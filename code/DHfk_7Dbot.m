function A=DHfk_7Dbot(dz1,th2,th3,th4,th5,th6,th7,fcla,object,a,no)
% close all

global Link

DH_Table;        %构建DH表
radius    = 25;  %25
len       = 60;  %60
joint_col = 0;

%plot3(0,0,0,'ro'); 

 Link(2).dz=dz1;    %伸缩关节
 Link(3).th=th2*pi/180;
 Link(4).th=th3*pi/180;
 Link(5).th=th4*pi/180;
 Link(6).th=th5*pi/180;
 Link(7).th=th6*pi/180;
 Link(8).th=th7*pi/180;   

% p0=[0,0,0]';


for i=1:8
Matrix_DH(i);
end


for i=2:8

      Link(i).A=Link(i-1).A*Link(i).A;
      Link(i).p= Link(i).A(:,4);
      Link(i).n= Link(i).A(:,1);
      Link(i).o= Link(i).A(:,2);
      Link(i).a= Link(i).A(:,3);
      Link(i).R=[Link(i).n(1:3),Link(i).o(1:3),Link(i).a(1:3)];
      if i~=3
        Connect3D(Link(i-1).p,Link(i).p,'b',2); hold on;
      end
      plot3(Link(i).p(1),Link(i).p(2),Link(i).p(3),'rx');hold on;
      
      if i<=8
          DrawCylinder(Link(i-1).p, Link(i-1).R * Link(i).az, radius,len, joint_col); hold on;
      end 
end

% 绘制圆形滑动轨迹
rt = 500;
t=0:0.001:(2*pi);  % 圆滑性设置
t=[t,0]; 
pos = [Link(2).p(1) Link(2).p(2) Link(2).p(3)];
plot3(pos(1)+rt*sin(t),pos(2)*ones(size(t)),pos(3)+rt*cos(t),'g*');hold on;

DrawFrame(Link(8).R, [Link(8).p(1),Link(8).p(2),Link(8).p(3)]' );hold on;    %绘制机械臂末端坐标系
if object
    [x,y,z]=sphere;
    mesh(a*x+Link(8).p(1),a*y+Link(8).p(2),a*z+Link(8).p(3));hold on;
    text(Link(8).p(1)+70,70+Link(8).p(2),70+Link(8).p(3),num2str(no),'color','k','FontSize',10) 
end


axis([-1300,1300,-2300,2300,-600,2300]);
% axis([-1300,1300,-2300,2300,-600,2300]);
xlabel('x');
ylabel('y'); 
zlabel('z');
grid on
drawnow;

A=Link(8).A;
%判断是否清空坐标系
if(fcla)
    cla;
end

end