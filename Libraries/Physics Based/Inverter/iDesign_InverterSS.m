function [T_M, u_D_M, u_ce0_M, R_c_M, R_D_M, E0_M, E1_M,f_sw_M,L_s_M,MassEst_M]= ...
iDesign_InverterSS(P_max_I,V_phase_I,f_sw_I,L_s_I)

MassEst_M = 0.00865 * P_max_I;
load('IGBT_Database.mat')
%I_max is ordered from low to high here

%P = 3 * Irms * Vphase
I = P_max_I/(3*V_phase_I);
idx=1;

while I >= IGBT_Data(idx).I_max
    idx = idx + 1;
end

T_M = IGBT_Data(idx).T;

%Temperature 1
[r_c_1,u_ce0_1,r_D_1,u_D0_1,E1_1,E0_1] = ...
    IGBT_Params(IGBT_Data(idx).Xe1,IGBT_Data(idx).Ye1,...
    IGBT_Data(idx).Xc1,IGBT_Data(idx).Yc1,IGBT_Data(idx).Xd1,...
    IGBT_Data(idx).Yd1);


[r_c_2,u_ce0_2,r_D_2,u_D0_2,E1_2,E0_2] = ...
    IGBT_Params(IGBT_Data(idx).Xe2,IGBT_Data(idx).Ye2,...
    IGBT_Data(idx).Xc2,IGBT_Data(idx).Yc2,IGBT_Data(idx).Xd2,...
    IGBT_Data(idx).Yd2);

u_D_M = [u_D0_1,u_D0_2];
u_ce0_M = [u_ce0_1,u_ce0_2];
R_c_M = [r_c_1, r_c_2];
R_D_M = [r_D_1, r_D_2];
E0_M = [E0_1, E0_2];
E1_M = [E1_1, E1_2];


if f_sw_I == 0
    f_sw_M = IGBT_Data(idx).Fsw_high;
else f_sw_M = F_sw_I;
end

L_s_M = L_s_I;





    