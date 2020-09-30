blockHandle = getSimulinkBlockHandle(gcb); %Get block handle 


P_max_I = str2num(get_param(blockHandle,'P_max_I'));
V_phase_I = str2num(get_param(blockHandle,'V_phase_I'));
f_sw_I = str2num(get_param(blockHandle,'f_sw_I'));
L_s_I = str2num(get_param(blockHandle,'L_s_I'));

[T_M, u_D_M, u_ce0_M, R_c_M, R_D_M, E0_M, E1_M,f_sw_M,L_s_M]= ...
iDesign_InverterSS(P_max_I,V_phase_I,f_sw_I,L_s_I)

T_M = mat2str(T_M);
u_D_M = mat2str(u_D_M);
u_ce0_M = mat2str(u_ce0_M);
R_c_M = mat2str (R_c_M);
R_D_M = mat2str (R_D_M);
E0_M = mat2str (E0_M);
E1_M = mat2str (E1_M);
f_sw_M = num2str (f_sw_M);
L_s_M = num2str (L_s_M);

set_param(blockHandle,'T_M',T_M);
set_param(blockHandle,'u_D_M',u_D_M);
set_param(blockHandle,'u_ce0_M',u_ce0_M);
set_param(blockHandle,'R_c_M',R_c_M);
set_param(blockHandle,'R_D_M',R_D_M);
set_param(blockHandle,'E0_M',E0_M);
set_param(blockHandle,'E1_M',E1_M);
set_param(blockHandle,'f_sw_M',f_sw_M);
set_param(blockHandle,'L_s_M',L_s_M);

