close all;
clear;clc;
% global Link

ToDeg = 180/pi;
ToRad = pi/180;

dz1=0;   
th2=0;
th3=0;
th4=0;
th5=0;
th6=0;
th7=-90;

th=[dz1,th2,th3,th4,th5,th6,th7]';
DHfk_7Dbot(th(1),th(2),th(3),th(4),th(5),th(6),th(7),0,0,0);

% th_initial = [0,0,0,0,0,0,-90]';
% thf = [1200,100,25,-24,-5,-90,85]
% p_initial = [500;-580;1000]
% pf = [-140,-1600,1646]

% 434轨迹规划
[TH1,V1,ACC1]=Tra434(0,300,1000,1200,0,0,0,0);  %末端在高度变化情况下的轨迹  
[TH2,V2,ACC2]=Tra434(0,30,60,100,0,0,0,0); 
[TH3,V3,ACC3]=Tra434(0,10,15,25,0,0,0,0); 
[TH4,V4,ACC4]=Tra434(0,-8,-16,-24,0,0,0,0); 
[TH5,V5,ACC5]=Tra434(0,-1,-2,-5,0,0,0,0); 
[TH6,V6,ACC6]=Tra434(0,-30,-60,-90,0,0,0,0); 
[TH7,V7,ACC7]=Tra434(-90,-32,26,85,0,0,0,0); 


figure(2);
grid on;
t = 0.1:0.1:8.3;
subplot(4,4,1);
plot(t,V1,'g-',t,ACC1,'b:'); h1 = legend('V1','ACC1'); set(h1,'Box','off'); hold on; 
subplot(4,4,2);
plot(t,V2,'g-',t,ACC2,'b:'); h2 = legend('V2','ACC2'); set(h2,'Box','off'); hold on;
subplot(4,4,3);
plot(t,V3,'g-',t,ACC3,'b:'); h3 = legend('V3','ACC3'); set(h3,'Box','off'); hold on;
subplot(4,4,4);
plot(t,V4,'g-',t,ACC4,'b:'); h4 = legend('V4','ACC4'); set(h4,'Box','off'); hold on;
subplot(4,4,5);
plot(t,V5,'g-',t,ACC5,'b:'); h5 = legend('V5','ACC5'); set(h5,'Box','off'); hold on;
subplot(4,4,6);
plot(t,V6,'g-',t,ACC6,'b:'); h6 = legend('V6','ACC6'); set(h6,'Box','off'); hold on;
subplot(4,4,7);
plot(t,V7,'g-',t,ACC7,'b:'); h7 = legend('V7','ACC7'); set(h7,'Box','off'); hold on;

figure(1);
for t=1:83 
    A=DHfk_7Dbot(TH1(t),TH2(t),TH3(t),TH4(t),TH5(t),TH6(t),TH7(t),1,0,0,0);%清除
    p=A(1:3,4);
    x(t)=p(1);
    y(t)=p(2);
    z(t)=p(3);
    plot3(x,y,z,'kX');
end





