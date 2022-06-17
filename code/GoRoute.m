function th = GoRoute(path,Ri,th,object,Rb,no)
global points
seed = size(path,1)-1;
for i = 1:floor(seed/2)
    Pi = path(i*2,1:3);  %输入目标末端位置 
    Ti = GesPS(Pi',Ri);
    solu1=IK_num_solu(Ti,th);
    th = solu1;
    DHfk_7Dbot(solu1(1),solu1(2),solu1(3),solu1(4),solu1(5),solu1(6),solu1(7),1,object,Rb,no);

    DrawSpace;
    DrawBox;
    ClearObject(no,object);
    BlanketObject(no-1,points);
    plot3(path(:,1),path(:,2),path(:,3),'LineWidth',2,'color','r');
end

% 画出路径上最后一个位置
Pi = path(size(path,1),1:3); %输入目标末端位置 
Ti = GesPS(Pi',Ri);
solu1=IK_num_solu(Ti,th);
DHfk_7Dbot(solu1(1),solu1(2),solu1(3),solu1(4),solu1(5),solu1(6),solu1(7),1,object,Rb,no);
th = solu1;

DrawSpace;
DrawBox;
ClearObject(no,object);
BlanketObject(no-1,points);
plot3(path(:,1),path(:,2),path(:,3),'LineWidth',2,'color','r');
end