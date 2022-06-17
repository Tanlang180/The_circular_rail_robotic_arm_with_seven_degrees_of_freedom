% %Build Robot by D_H methods

ToDeg = 180/pi;
ToRad = pi/180;
UX = [1 0 0]';
UY = [0 1 0]';
UZ = [0 0 1]';

% version 1
% Link= struct('name','Body' , 'th',  0, 'dz', 0, 'dx', 0, 'alf',0*ToRad,'az',UZ);     % az 
% Link(1)= struct('name','Base' , 'th',  0*ToRad, 'dz', 200, 'dx',0, 'alf',90*ToRad,'az',UZ);        %BASE to 1
% Link(2) = struct('name','J1' , 'th',   0*ToRad, 'dz', 0, 'dx', 0, 'alf',0*ToRad,'az',UZ);       %1 TO 2   
% Link(3) = struct('name','J2' , 'th',  -90*ToRad, 'dz', 0, 'dx', 0, 'alf',90*ToRad,'az',UZ);    %2 TO 3     
% Link(4) = struct('name','J3' , 'th',  0*ToRad, 'dz', 0, 'dx', 750, 'alf',0*ToRad,'az',UZ);          %3 TO 4    
% Link(5) = struct('name','J4' , 'th',  -90*ToRad, 'dz', 0, 'dx', 0, 'alf',-90*ToRad,'az',UZ);          %4 TO 5    
% Link(6) = struct('name','J5' , 'th',  0*ToRad, 'dz', 750, 'dx', 0, 'alf',90*ToRad,'az',UZ);          %5 TO 6
% Link(7) = struct('name','J6' , 'th',  0*ToRad, 'dz', 0, 'dx', 0, 'alf',-90*ToRad,'az',UZ);          %6 TO 7
% Link(8) = struct('name','J7',  'th',  0*ToRad, 'dz', 150,  'dx', 0, 'alf', 0, 'az',UZ);     %7 TO E

% version 2
% Link= struct('name','Body' , 'th',  0, 'dz', 0, 'dx', 0, 'alf',0*ToRad,'az',UZ);     % az 
% Link(1)= struct('name','Base' , 'th',  0*ToRad, 'dz', 1000, 'dx',0, 'alf',90*ToRad,'az',UZ);        %BASE to 1
% Link(2) = struct('name','J1' , 'th',   0*ToRad, 'dz', 0, 'dx', 0, 'alf',0*ToRad,'az',UZ);       %1 TO 2   
% Link(3) = struct('name','J2' , 'th',  -90*ToRad, 'dz', 0, 'dx', 0, 'alf',90*ToRad,'az',UZ);    %2 TO 3     
% Link(4) = struct('name','J3' , 'th',  0*ToRad, 'dz', 450, 'dx', 0, 'alf',-90*ToRad,'az',UZ);          %3 TO 4    
% Link(5) = struct('name','J4' , 'th',  -90*ToRad, 'dz', 0, 'dx', 0, 'alf',90*ToRad,'az',UZ);          %4 TO 5    
% Link(6) = struct('name','J5' , 'th',  0*ToRad, 'dz', 0, 'dx', 450, 'alf',0*ToRad,'az',UZ);          %5 TO 6
% Link(7) = struct('name','J6' , 'th',  0*ToRad, 'dz', 0, 'dx', 0, 'alf',-90*ToRad,'az',UZ);          %6 TO 7
% Link(8) = struct('name','J7',  'th',  0*ToRad, 'dz', 150,  'dx', 0, 'alf', 0, 'az',UZ);     %7 TO E

% version 3
% Link= struct('name','Body' , 'th',  0, 'dz', 0, 'dx', 0, 'alf',0*ToRad,'az',UZ);     % az 
% Link(1)= struct('name','Base' , 'th',  0*ToRad, 'dz', 1000, 'dx',0, 'alf',90*ToRad,'az',UZ);        %BASE to 1
% Link(2) = struct('name','J1' , 'th',   0*ToRad, 'dz', 0, 'dx', 0, 'alf',0*ToRad,'az',UZ);       %1 TO 2   
% Link(3) = struct('name','J2' , 'th',  -90*ToRad, 'dz', 0, 'dx', 500, 'alf',-90*ToRad,'az',UZ);    %2 TO 3     
% Link(4) = struct('name','J3' , 'th',  0*ToRad, 'dz', 300, 'dx', 0, 'alf',90*ToRad,'az',UZ);          %3 TO 4    
% Link(5) = struct('name','J4' , 'th',  -90*ToRad, 'dz', 0, 'dx', 0, 'alf',-90*ToRad,'az',UZ);          %4 TO 5    
% Link(6) = struct('name','J5' , 'th',  0*ToRad, 'dz', 300, 'dx', 0, 'alf',90*ToRad,'az',UZ);          %5 TO 6
% Link(7) = struct('name','J6' , 'th',  0*ToRad, 'dz', 0, 'dx', 0, 'alf',-90*ToRad,'az',UZ);          %6 TO 7
% Link(8) = struct('name','J7',  'th',  0*ToRad, 'dz', 50,  'dx', 0, 'alf', 0, 'az',UZ);     %7 TO E

% version 4 finally
Link= struct('name','Body' , 'th',  0, 'dz', 0, 'dx', 0, 'alf',0*ToRad,'az',UZ);     % az 
Link(1)= struct('name','Base' , 'th', 0*ToRad, 'dz', 1000, 'dx',0, 'alf',90*ToRad,'az',UZ);        %BASE to 1
Link(2) = struct('name','J1' , 'th',  0*ToRad, 'dz', 0, 'dx', 0, 'alf',0*ToRad,'az',UZ);       %1 TO 2   
Link(3) = struct('name','J2' , 'th',  0*ToRad, 'dz', 0, 'dx', 500, 'alf',-90*ToRad,'az',UZ);    %2 TO 3     
Link(4) = struct('name','J3' , 'th',  0*ToRad, 'dz', 0, 'dx', 0, 'alf',90*ToRad,'az',UZ);          %3 TO 4    
Link(5) = struct('name','J4' , 'th',  0*ToRad, 'dz', 250, 'dx', 0, 'alf',-90*ToRad,'az',UZ);          %4 TO 5    
Link(6) = struct('name','J5' , 'th',  0*ToRad, 'dz', 0, 'dx', 0, 'alf',90*ToRad,'az',UZ);          %5 TO 6
Link(7) = struct('name','J6' , 'th',  0*ToRad, 'dz', 250, 'dx', 0, 'alf',-90*ToRad,'az',UZ);          %6 TO 7
Link(8) = struct('name','J7',  'th',  0*ToRad, 'dz', 0,  'dx', 80, 'alf', 0, 'az',UZ);     %7 TO E
