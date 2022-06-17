R = 1000;  %‘≤Õ∞∞Îæ∂
rt = 500;   %πÏº£∞Îæ∂
pos = [0,2000,1000]; % ‘≤–ƒŒª÷√
t=0:0.001:(2*pi);  % ‘≤ª¨–‘…Ë÷√
t=[t,0];
figure(1)
% ªÊ÷∆¡Ωµ◊√Ê
plot3(pos(1)+R*sin(t),pos(2)*ones(size(t)),pos(3)+R*cos(t),'b:'); hold on;
plot3(pos(1)+R*sin(t),-pos(2)*ones(size(t)),pos(3)+R*cos(t),'b:');hold on;
plot3(pos(1)+rt*sin(t),-pos(2)*ones(size(t)),pos(3)+rt*cos(t),'b:');hold on;
plot3(pos(1)+rt*sin(t),pos(2)*ones(size(t)),pos(3)+rt*cos(t),'b:');hold on;
% ªÊ÷∆≥ı º‘≤ª¨πÏº£
% plot3(0+rt*sin(t),0*ones(size(t)),1000+rt*cos(t),'k-');hold on;

% ªÊ÷∆4Ãı±ﬂ
plot3([pos(1)+R*sin(0) pos(1)+R*sin(0)],[pos(2) -pos(2)],[pos(3)+R*cos(0) pos(3)+R*cos(0)],'b:'); hold on;
plot3([pos(1)+R*sin(pi/2) pos(1)+R*sin(pi/2)],[-pos(2) pos(2)],[pos(3)+R*cos(pi/2) pos(3)+R*cos(pi/2)],'b:');hold on;
plot3([pos(1)+R*sin(pi) pos(1)+R*sin(pi)],[pos(2) -pos(2)],[pos(3)+R*cos(pi) pos(3)+R*cos(pi)],'b:'); hold on;
plot3([pos(1)+R*sin(3*pi/2) pos(1)+R*sin(3*pi/2)],[-pos(2) pos(2)],[pos(3)+R*cos(3*pi/2) pos(3)+R*cos(3*pi/2)],'b:');hold on;

% ªÊ÷∆∆Ω“∆œﬂ
% plot3([pos(1)+R*sin(pi) pos(1)+R*sin(pi)],[pos(2) -pos(2)],[pos(3)+R*cos(pi)+200 pos(3)+R*cos(pi)+200],'b:'); hold on;
plot3([pos(1)+R*sin(pi) pos(1)+R*sin(pi)],[pos(2) -pos(2)],[pos(3)+R*cos(pi)+1000 pos(3)+R*cos(pi)+1000],'b:'); hold on;

view(110,10);
% view(0,0);
axis([-1300,1300,-2300,2300,-600,2300]);
xlabel('x');
ylabel('y'); 
zlabel('z');
grid on