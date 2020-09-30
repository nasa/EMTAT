%Infineon IKA10N60T
%5
%Ic_max at25C: 11.7A
%IC_max at 100C: 7.2A
%IC_puls_max: 30A
%IF_max: 11.9A
%IF_puls_max: 
%Ptot_max: 4
%Max V_CE: 600V
%FSw range: 2kHz-20kHz

T=[25,175]
Xe1 = [2.5,15];
Ye1= [0.21e-3,0.92e-3];
%VCE (x=Vce, y=current Ic
Xc1 = [2,2.5]
Yc1 = [18.5,27]
%VD (diode forward voltage) (x=Vf,Y=If)

Xd1 = [1.5,2];
Yd1 = [9,17];

[C1_1,C2_1,C3_1,r_c_1,u_ce0_1,r_D_1,u_D0_1,E1_1,E0_1]...
    = IGBT_Params(Xe1,Ye1,Xc1,Yc1,Xd1,Yd1);


Xe2 = [2.5,15];
Ye2= [0.21e-3,0.92e-3];
%1 and 2 are the same here since we ONLY get a 175 degree, not 
%a 25 degree table table

Xc2 = [2,3];
Yc2 = [11.5,21];

Xd2 = [1.5,2.5];
Yd2 = [9.5,27];

[C1_2,C2_2,C3_2,r_c_2,u_ce0_2,r_D_2,u_D0_2,E1_2,E0_2]...
    = IGBT_Params(Xe2,Ye2,Xc2,Yc2,Xd2,Yd2);
%IKA10N60T


r_c=[r_c_1,r_c_2];
r_D=[r_D_1,r_D_2];
u_ce0=[u_ce0_1,u_ce0_2];
u_D0=[u_D0_1,u_D0_2];
E1=[E1_1,E1_2];
E0=[E0_1,E0_2];

E0=[E0_1,E0_2];
E1=[E1_1,E1_2];
