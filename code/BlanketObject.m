function BlanketObject(k,points)
% global r
% radio = 0.5;
% R= r*radio;
R = 30;

if k>=1
    [x,y,z]=sphere;
     for i = 1:k
        figure(1);
    %     mesh(R(i)*x+points(i,1),R(i)*y+points(i,2),R(i)*z+points(i,3));hold on;
        mesh(R*x+points(i,1),R*y+points(i,2),R*z+points(i,3));hold on;
     end
end

% view(110,10);
axis([-1300,1300,-2300,2300,-600,2300]);
xlabel('x');
ylabel('y'); 
zlabel('z');

end