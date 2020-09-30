%--------------------------------------------------------------------------
%                       Written by Peter Matt
%                              NASA GRC
%                             8/23/2019
%--------------------------------------------------------------------------

function [vn,itReturn,varargout] = calcParams(v_full,v_exp,v_nom,q_full,q_exp,q_nom,i,it)
    
    Q = q_full;
    A = v_full - v_exp;
    B = 2.3./q_exp;
    K = 0.065*(v_full-v_nom+ A*exp(-B*q_nom)-1)*((q_full-q_nom)./q_nom);
    R = v_nom*((.01)./(0.2*q_nom));
    E0 = v_full+K+R*i-A;
    
    len = length(it);
    [vn,itReturn] = voltage(len,Q,A,B,K,E0,R,i);
       
    if nargout == 3 
        varargout{1} = [Q,A,B,K,R,E0];
    end
end