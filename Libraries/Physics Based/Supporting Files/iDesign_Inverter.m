function [R_on,Qg_total,T_rise,T_fall,V_gate,Trr,n_MOSFETs,...
C_arm,L_arm,R_arm,N_phases,N_poles,N_modules,THD]= ...
iDesign_Inverter(V_in,P_out,F_elec,V_ripple_percent,V_peak_out_min,N_phases,...
N_poles,FaultTime)

Eff_assumed=0.8;

P_in = P_out/Eff_assumed;

I_in = P_in/V_in;

I_max = I_in + 0.25*I_in; %tolerance for surges in input current

%Now we can appropriately size each switch
vals=MOSFETsetVals_Inverter(I_max)
R_on=vals(1);
Qg_total=vals(2);
T_rise=vals(3);
T_fall=vals(4);
V_gate=vals(5);
Trr=vals(6);
n_MOSFETs=vals(7);


%Now to select nArm.
%We have gates that can handle iMax, but they can only handle
%a relatively small voltage. Each arm will be exposed to a maximum of
%V_in/2 volts.

V_arm=V_in/2;
N_arm=ceil(V_arm/V_gate);

% R_arm = R_on*N_arm;
% C_arm_gates = (Qg_total/V_gate)/N_arm, but we can neglect this since it
%is a very small component of capacitance



%https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=6785126&tag=1

%just from switches
%https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=6785126&tag=1
%Assuming offset angle is pi/2, we can eliminate part of the capacitance
%formula and obtain a worst case minimum required capacitance
%C_module_worstcase = (2*P1)/((Vc^2)*d*gv*w*N)
%P1 - single phase apparent power
%d is voltage ripple percentage max
%g_v = (vmax(out)*2)/Vdc
%w = angular electrical frequency
%N is number of submodules per arm
%Vc is capacitor voltage

%Since g_v's formula is known, and V_c = Vdc/2N, we can rearrange
%the formula to eliminate G_v

%what is P1?
%P1 is signle-phase apparent power

%Power in an n-phase system:
%sqrt(n)*Vphase*Iphase*cos(phi) (?)
%Power in 

w=F_elec*2*pi;
P_in_perphase = P_in/N_phases;
C_min = (4*P_in_perphase*N_arm)/(V_in*V_peak_out_min*V_ripple_percent*w);

C_arm_modules=C_min/N_arm;
C_arm = C_arm_modules;


%Inductor sizing

R_arm=N_arm*R_on;
FaultCurrent=V_in/R_arm; %2? 1/2?

%https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=6785126&tag=1
%You can size the inductor by fault current protection
%or by circulating current control. Since this block already
%implements control of the circulating current, we will use the fault
%criterion.
%Kappa is the fault current rise rate. Assume
%it is linear. We have assumed a fault time.

kappa=FaultCurrent/FaultTime;
V_cap_avg = V_in/(2*N_arm);

L_arm= (N_arm*V_cap_avg)/(2*kappa);

THD = (33.733*(N_arm^(-1.279)))*(1/100);

%Empirical power law regression derived from a graph
%in https://www.nist.gov/system/files/documents/pml/high_megawatt/Fan-Peng_Converter-Topologies-Using-High-Voltage-High-Frequency-SiC-Power-Devices.pdf
%This applies to a 3-phase inverter.

N_modules = N_arm * 2; %modules per phase

end






