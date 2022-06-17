function ReduceObject(a)
%% 绘制障碍物(以球为例，主要是方便计算)
global circleCenter r tmp
% circleCenter = [500,-500,500;
%     800,-800,1000;
%     600,-400,600;
%     -500,600,1200;
%     300,130,700;
%     600, 700, 300;
%     200,200,1200;
%     100, 300, 500;
%     600, 0, 500;
%     800, -1000 ,1000];
r=[50;60;70;50;60;50;70;50;60;60];%半径
%下面开始画
figure(2);
[x,y,z]=sphere;
for i = 1:length(circleCenter(:,1))
    mesh(r(i)*x+circleCenter(i,1),r(i)*y+circleCenter(i,2),r(i)*z+circleCenter(i,3));hold on;
end
tmp =r(a);
r(a) = 0;
view(125,50);
axis([-1300,1300,-2300,2300,-300,2300]);
xlabel('x');
ylabel('y'); 
zlabel('z');
end