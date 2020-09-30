function [r_c,u_ce0,r_D,u_D0,E1,E0] =...
    IGBT_Params(Xe,Ye,Xc,Yc,Xd,Yd)
%IGBT_PARAMS Summary of this function goes here
%   Detailed explanation goes here


C1 = polyfit(Xe,Ye,1);

%VCE (x=Vce, y=current Ic
C2 = polyfit(Xc,Yc,1);

%VD (diode forward voltage) (x=Vf,Y=If)

C3=polyfit(Xd,Yd,1);

r_c=C2(1)^-1;
u_ce0 = -(C2(2)/C2(1));
r_D=C3(1)^-1;
u_D0 = -(C3(2)/C3(1));

E1 = C1 (1);
E0 = C1 (2);


end

