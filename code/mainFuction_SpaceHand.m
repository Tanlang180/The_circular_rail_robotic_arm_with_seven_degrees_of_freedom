clc;clear;
close all;

global Link circleCenter r points

ToDeg = 180/pi;  %转角度
ToRad = pi/180;  %转弧度

% 随机生成object半径并排序
a = 50; b = 100;
R = a+(b-a)*rand(1,10);
[r,  index] = sort(R,2,'ascend');
% 随机生成object位置
circleCenter = RandomPoint();

DrawSpace;
DrawBox;
DrawObject;
points = [270,60,0;230,60,0;190,60,0;150,60,0;
        270,20,0;230,20,0;190,20,0;150,20,0;
        270,-20,0;230,-20,0;190,-20,0;150,-20,0]; % 篮筐里的球心

%输入起始六关节位置
th=[200,0,90,0,0,0,-90]'; 
tic
Ri=rpy2rot(10*ToRad,20*ToRad,80*ToRad); 
for i = 1:10
     
    Pi= circleCenter(i,:)'; %输入目标末端位置 
    
    %绘制机械臂初始位姿及末端姿态
    DHfk_7Dbot(th(1), th(2), th(3), th(4), th(5), th(6),th(7), 0,0,0,0);   %绘制机械臂  函数里面转弧度
    DrawFrame(Ri,Pi);      %绘制目标点坐标系
    view(110,10);

    % 抓物体
    source = Link(8).p(1:3)';
    pathone = RRT_run(source,Pi',i);
    th = GoRoute(pathone,Ri,th,0,0,i);
    
    % 再回到篮筐位置
    blacket = [150 0 200];
    source = Link(8).p(1:3)';
    pathtwo = RRT_run(source,blacket,i);
    th = GoRoute(pathtwo,Ri,th,1,r(i),i);
    fprintf('抓完第 %d 个球: ',i); 
    toc;
end

fprintf('finish all jobs !!! Using time : '); 
toc;