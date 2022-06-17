%% 绘制障碍物(以球为例，主要是方便计算)
global circleCenter r hp
% circleCenter = [500,-500,500;
%     800,-800,1000;
%     600,-400,600;
%     -500,600,1200;
%     300,130,700;
%     620, 700, 300;
%     250,200,1100;
%     200, 300, 500;
%     600, 200, 500;
%     800, -1000 ,1000];

% r=[50;60;70;50;60;50;70;50;60;60];%半径

%下面开始画
figure(1);
[x,y,z]=sphere;
for i = 1:length(circleCenter(:,1))
    hp(i) = mesh(r(i)*x+circleCenter(i,1),r(i)*y+circleCenter(i,2),r(i)*z+circleCenter(i,3));hold on;
    text(circleCenter(i,1)+70,70+circleCenter(i,2),70+circleCenter(i,3),num2str(i),'color','k','FontSize',10) 
end

% view(110,10);

% view(0,0);
axis([-1300,1300,-2300,2300,-600,2300]);
xlabel('x');
ylabel('y'); 
zlabel('z');