%Gregory Fretti
%12/12/2019
%This script is executed upon clicking the Run iDesign button for the
%PMSM. It was derived from the code used in the DC-DC converters (boost
%and buck), but placed in a separate script to aid in debugging. For the
%DC-DC converters, the Run iDesign code is in the mask itself, which is
%generally more difficult to handle.

blockHandle = getSimulinkBlockHandle(gcb); %Get block handle 

%Get values of parameters:

nPoles = str2num(get_param(blockHandle,'Poles_i'));
Rs = str2num(get_param(blockHandle,'R_s_i'));
Ls = str2num(get_param(blockHandle,'L_s_i'));
S_nom = str2num(get_param(blockHandle,'S_nom_i'));
T_nom = str2num(get_param(blockHandle,'T_nom_i'));
P_out_max = str2num(get_param(blockHandle,'P_out_max_i'));
I=str2num(get_param(blockHandle,'I_max_i'));
P_in_max = str2num(get_param(blockHandle,'P_in_max_i'));
K = str2num(get_param(blockHandle,'K_i'));
% nPhases = 3; %hardcode/placeholder
V_nom=str2num(get_param(blockHandle,'V_nom_i'))
P_Fe_Nom = str2num(get_param(blockHandle,'P_Fe_Nom_i'))
I_nom = str2num(get_param(blockHandle,'I_nom_i'));
PF=str2num(get_param(blockHandle,'PF_nom_i'));
CalculatePFe=str2num(get_param(blockHandle,'P_Fe_Calc_Flag'));
T_max_i = str2num(get_param(blockHandle,'T_max_i'));

%Call iDesign m file that calculates component values
%based on operating conditions:
MassEst_M = (P_out_max/1000) * (6.257) - (.0022)*((P_out_max/1000)^2); %W to kW

[PolePairs,LamPM_M, R_M, L_M, P_Fe_nom, S_nom, T_nom, P_out_max, I_max, P_in_max, T_max]= ...
iDesign_SS_PMSM(nPoles,Rs,Ls,S_nom,T_nom,P_out_max,I,P_in_max,K,V_nom,P_Fe_Nom,I_nom,PF,CalculatePFe,T_max_i)
%Convert numeric to string for set_param to use


PolePairs = num2str(PolePairs);
R_M = num2str(R_M);
L_M = num2str(L_M);
LamPM_M = num2str(LamPM_M);
% NPhases_M = num2str(NPhases_M);
P_Fe_nom = num2str(P_Fe_nom);
S_nom = num2str(S_nom);
T_nom = num2str(T_nom);
P_out_max=num2str(P_out_max);
I_max=num2str(I_max);
P_in_max = num2str(P_in_max);
T_max = num2str(T_max);
MassEst_M = num2str(MassEst_M);


%Set mask parameters to calculated values:
set_param(blockHandle,'MassEst_M',MassEst_M);

set_param(blockHandle,'pp',PolePairs);
set_param(blockHandle,'flux_m',LamPM_M);
set_param(blockHandle,'R_s',R_M);
set_param(blockHandle,'L_s',L_M);
set_param(blockHandle,'P_Fe_Nom',P_Fe_nom);
set_param(blockHandle,'S_nom',S_nom);
set_param(blockHandle,'T_nom',T_nom);
set_param(blockHandle,'P_out_max', P_out_max);
set_param(blockHandle,'I_max', I_max);
set_param(blockHandle,'P_in_max', P_in_max);
set_param(blockHandle,'T_max', T_max);