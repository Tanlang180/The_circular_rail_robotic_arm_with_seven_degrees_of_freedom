function A=DHfk_nodraw(dz1,th2,th3,th4,th5,th6,th7)

ToDeg = 180/pi;
ToRad = pi/180;

global Link
DH_Table;

%input angle
Link(2).dz = dz1;
Link(3).th = th2*ToRad;
Link(4).th = th3*ToRad;
Link(5).th = th4*ToRad;
Link(6).th = th5*ToRad;
Link(7).th = th6*ToRad;
Link(8).th = th7*ToRad;
 
%DH matrix
for i=1:8
    Matrix_DH(i);
end

%position and orientation
for i=2:8
	Link(i).A=Link(i-1).A*Link(i).A;
    Link(i).p= Link(i).A(:,4);
    Link(i).n= Link(i).A(:,1);
    Link(i).o= Link(i).A(:,2);
    Link(i).a= Link(i).A(:,3);
    Link(i).R=[Link(i).n(1:3),Link(i).o(1:3),Link(i).a(1:3)];
end

A=Link(8).A;