clear all
close all
clc

global Link
DH_Table;

th=[0,0,0,0,0,0,-90]'; 
%%设置矩阵存储参数
x=[];y=[];z=[];

n = 0;

% 固定关节
dz1=0;

%间距可以调
for dz1=-2000:500:2000 
    for th2= -360:89:360
        for th3= -360:90:360
             for th4= -360:90:360
                for th5= -360:90:360
                    for th6= -360:90:360
                        for th7= -360:120:360
                            Link(2).dz=dz1; 
                            Link(3).th=th2*pi/180;
                            Link(4).th=th3*pi/180;
                            Link(5).th=th4*pi/180;
                            Link(6).th=th5*pi/180; 
                            Link(7).th=th6*pi/180;
                            Link(8).th=th7*pi/180;
                            %fprintf('%d %d %d %d %d %d\n',[th1,th2,th3,th4,th5,dz6]');
                        for i=1:8
                            Matrix_DH(i);
                        end
                        for i=2:8
                            Link(i).A=Link(i-1).A*Link(i).A;
                            Link(i).p= Link(i).A(:,4); 
                        end
                        x=[x Link(8).p(1)];
                        y=[y Link(8).p(2)];
                        z=[z Link(8).p(3)]; 
%                         figure
%                         grid on;  
%                         plot3(Link(8).p(1),Link(8).p(2),Link(8).p(3),'r*');hold on;
                        n = n+1;
                        disp(n);
                        end
                    end
                 end
             end
        end
    end
end

figure(1)
view(125,50);axis([-1300,1300,-2300,2300,-600,2300]);
plot3(x,y,z,'ro','MarkerFaceColor','w','MarkerSize', 2);hold on;
xlabel('X');ylabel('Y');zlabel('Z');grid on;

% 绘制blacket和space
DrawSpace;
DrawBox;

disp(['完成工作空间绘制，运行时间: ',num2str(toc)]);
