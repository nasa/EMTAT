
fsize=14;

%Machine Actual Parameters
Lambda_PM=0.3;  %Permanent Magnet Flux Linkage
R=0.23;         %Phase Resistance
L=1e-3;       %Equivalent Two-Phase Inductance
N_p=6;          %Number of Poles
N_phases=3;          %Number of Phases
Ts = 0.001;%1e-3;

%setup hack
LamPM_M = Lambda_PM;
R_M = R;
L_M = L;
NPoles_M = N_p;
NPhases_M = N_phases;

%Drive Parameters
V_bus=500;      %Bus Voltage
I_max=600;      %Maximum Inverter Current
F_sw=10e3;      %Switching Frequency
T_sw=1/F_sw;
T_dead=2e-6;    %Dead Time

%Control Parameters
% Omega_bw=1e3;           %Regulator Bandwidth
% K_p=Omega_bw*L;    %Proportional Gain
% K_i=Omega_bw*R;    %Integral Gain
% Detuned controller so that we don't go unstable with bigger timestep :P
Omega_bw=100;           %Regulator Bandwidth
K_p=Omega_bw*L;    %Proportional Gain
K_i=Omega_bw*R;    %Integral Gain

%Direct Current Calculation
V_IGBT=3.75;
V_max=V_bus/sqrt(3)-R*I_max-V_IGBT; %SVM
Omega_ct=V_max/(N_p/2)/sqrt(Lambda_PM^2 +(L*I_max)^2)
Omega_cp=V_max/(N_p/2)/sqrt((L*I_max)^2-Lambda_PM^2)
omegarv=linspace(0,800,1000);
idrv=zeros(size(omegarv));
i=find(omegarv<Omega_ct);
idrv(i)=0;
i=find((omegarv>=Omega_ct)&(omegarv<Omega_cp));
idrv(i)=-(Lambda_PM^2+(L*I_max)^2-(V_max/(N_p/2)./omegarv(i)).^2)/2/Lambda_PM/L;
i=find(omegarv>=Omega_cp);
idrv(i)=-Lambda_PM/L;
