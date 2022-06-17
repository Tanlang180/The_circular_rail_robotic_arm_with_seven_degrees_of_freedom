function T = GesPS(p,Ri)
%得到目标末端位置旋转矩阵
ni=[Ri(:,1);0]; 
oi=[Ri(:,2);0];
ai=[Ri(:,3);0];
p=[p;1];
T=[ni,oi,ai,p];
end