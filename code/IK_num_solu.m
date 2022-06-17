function q=IK_num_solu(W,q)%ÊıÖµ½âº¯Êı
global circleCenter r Link

lamda=0.5;%·¶Î§£¨0,1£© 0.5

e=zeros(1,6);
pref=W(1:3,4);
Rref=W(1:3,1:3);
ilimit=20000;

for count=1:ilimit
%     DrawFrame(Rref,pref);     
 
    if count >= ilimit
        fprintf('iteration number %d final err %f \n',count,err);
        break
    end

    P=DHfk_nodraw(q(1),q(2),q(3),q(4),q(5),q(6),q(7));
    p=P(1:3,4);
    perr=pref-p;%¼ÆËãÎ»ÖÃÎó²îperr

    R=P(1:3,1:3);
    if isequal(R, Rref)
        werr = 0;
        else
            R_err = R' * Rref;
            Err_th = acos((R_err(1,1) + R_err(2,2) + R_err(3,3) - 1)/2);
        if Err_th == 0
            werr = [0,0,0]';
        else
             werr = (Err_th / (2 * sin(Err_th))) * [  R_err(3,2)-R_err(2,3),  R_err(1,3)-R_err(3,1),  R_err(2,1)-R_err(1,2)  ]';
        end
    end

    % Ä©¶ËÎó²î
    e(1:3)=perr(1:3); % Î»ÖÃÎó²î
    e(4:6)=werr(1:3); % ½Ç¶ÈÎó²î
%     norm(e(1:3))
%     norm(e(4:6))
%     err=norm(e(1:3))+norm(e(4:6));
    err=norm(e(1:3));

    if err<=25
       fprintf(' iteration number %d final err %f \n',count,err);
      break
    end

    J=Creat_Jacobian(q(1),q(2),q(3),q(4),q(5),q(6),q(7));
    deta_q=lamda*pinv(J)*e';
    q=q+deta_q;
    
%    DHfk_7Dbot(q(1),q(2),q(3),q(4),q(5),q(6),q(7),1,0,0,0);
%    DrawSpace;
   fprintf('iteration number %d\n',count);
end  
end