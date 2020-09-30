%Infineon IKA10N60T

%Ic_max at25C: 11.7A
%IC_max at 100C: 7.2A
%IC_puls_max: 30A
%IF_max: 11.9A
%IF_puls_max: 
%Ptot_max: 4
%Max V_CE: 600V
%FSw range: 2kHz-20kHz

importName = prompt('Please enter .mat file with data points: \n');

load('importName');

[C1_1,C2_1,C3_1,r_c_1,u_ce0_1,r_D_1,u_D0_1,E1_1,E0_1]...
    = IGBT_Params(Xe1,Ye1,Xc1,Yc1,Xd1,Yd1);


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
