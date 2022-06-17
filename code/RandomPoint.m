function circleCenter = RandomPoint()
% x y z ·¶Î§
% [-1000,1000];
% [-2000,2000];
% [0,2000];
pos = [0 1000];
Rc = 950*rand(1,9);
th = 2 * pi * rand;
x = pos(1) + Rc * cos(th);
z = pos(2) + Rc * sin(th);

for i = 1:9
    y(i) = -1900 + 300*i + 100*rand;
end
u = 150 + 50*rand;
x(10) = x(9)+ u;
y(10) = y(9)+ 50;
z(10) = z(9)+ u;
circleCenter = [x' y' z'];

end