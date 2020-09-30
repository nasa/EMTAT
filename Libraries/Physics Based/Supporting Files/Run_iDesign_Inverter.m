blockHandle = getSimulinkBlockHandle(gcb); %Get block handle 

%Get values of parameters:
V_in = str2num(get_param(blockHandle,'V_in'));
P_out = str2num(get_param(blockHandle,'P_out'));
F_elec = str2num(get_param(blockHandle,'F_elec'));
V_ripple_percent = str2num(get_param(blockHandle,'V_ripple_percent'));
V_peak_out_min = str2num(get_param(blockHandle,'V_peak_out_min'));
N_phases = str2num(get_param(blockHandle,'N_Phases'));
N_poles = str2num(get_param(blockHandle,'N_Poles'));
Fsw = str2num(get_param(blockHandle,'Fsw'));
FaultTime = str2num(get_param(blockHandle,'FaultTime'));
Pdis = str2num(get_param(blockHandle,'Pdis'));

%Call iDesign m file that calculates component values
%based on operating conditions:
[R_on,Qg_total,T_rise,T_fall,V_gate,Trr,n_MOSFETs,...
C_arm,L_arm,R_arm,N_phases,N_poles,N_modules,THD]= ...
iDesign_Inverter(V_in,P_out,F_elec,V_ripple_percent,V_peak_out_min,N_phases,...
N_poles,FaultTime)
%Convert numeric to string for set_param to use


Ron = num2str(R_on);
Qg_total = num2str(Qg_total);
T_rise = num2str(T_rise);
T_fall = num2str(T_fall);
V_gate = num2str(V_gate);
Trr = num2str(Trr);
Fsw = num2str(Fsw);
n_MOSFETs = num2str(n_MOSFETs);
Pdis=num2str(Pdis);
C_arm=num2str(C_arm);
L_arm=num2str(L_arm);
R_arm=num2str(R_arm);
N_phases=num2str(N_phases);
N_poles=num2str(N_poles);
N_modules=num2str(N_modules);
THD=num2str(THD);
Pdis=num2str(Pdis);
%Set mask parameters to calculated values:

set_param(blockHandle,'Pdis_M',Pdis);
set_param(blockHandle,'Carm_M',C_arm);
set_param(blockHandle,'Larm_M',L_arm);
set_param(blockHandle,'Rarm_M',R_arm);
set_param(blockHandle,'NPhases_M',N_phases);
set_param(blockHandle,'NModules_M',N_modules);
set_param(blockHandle,'THD_M',THD);
set_param(blockHandle,'NPoles_M',N_poles);

set_param(blockHandle,'QgTotal_M',Qg_total);
set_param(blockHandle,'Vgate_M',V_gate);
set_param(blockHandle,'TRise_M',T_rise);
set_param(blockHandle,'TFall_M',T_fall);
set_param(blockHandle,'Fsw_M',Fsw);
set_param(blockHandle,'Trr_M',Trr);
% set_param(blockHandle,'n_MOSFET',n_MOSFET);