%...Run InverterMotorModel
%...Samuel Faulk, NASA Glenn Research Center
%...MATLAB 2021a

clear; clc; close all;

%% inverter ...............................................................

%...inverter catastrophic
fprintf('\n')
fprintf('For Inverter:\n')
%...catastrophic fault toggle, 0 or 1
fprintf('Catastrophic Fault Toggle\n')
inv_catastrophic_fault_toggle = input('   0 = no fault  -or-  1 = fault: ');
fprintf('\n')
if inv_catastrophic_fault_toggle > 1 || inv_catastrophic_fault_toggle < 0
    fprintf('!! Error, Catastrophic Fault Toggle is Out of Input Range !!\n')
    return; end
if inv_catastrophic_fault_toggle == 1; inv_toggle = 'Faulted';
    else; inv_toggle = 'Not Faulted'; end
clc
fprintf('\n')
fprintf('For Inverter:\n')
%...inverter degradation
%...degradation input, 0 --> Inf
fprintf('Degradation Input\n')
inv_degradation_input = input('   beginning from  0.0 = no degradation  -to-  Inf: ');
fprintf('\n')
if inv_degradation_input < 0.0; fprintf('!! Error, Degradation Input is Out of Input Range !!\n')
    return; end
clc

%...inverter parameter adjustment values
inv_u_D_M_adjustment = 0.1; % V, diode voltage at 0A
inv_E1_M_adjustment = 0.1; % Hz, E1 switching frequency
inv_f_sw_M_adjustment = 0.1; % Hz, switching frequency

%% motor ..................................................................

%...motor catastrophic
fprintf('\n')
fprintf('For Motor:\n')
%...catastrophic fault toggle, 0 or 1
fprintf('Catastrophic Fault Toggle\n')
mot_catastrophic_fault_toggle = input('   0 = no fault  -or-  1 = fault: ');
fprintf('\n')
if mot_catastrophic_fault_toggle > 1 || mot_catastrophic_fault_toggle < 0
    fprintf('!! Error, Catastrophic Fault Toggle is Out of Input Range !!\n')
    return; end
if mot_catastrophic_fault_toggle == 1; mot_toggle = 'Faulted'; else
    mot_toggle = 'Not Faulted'; end
clc
fprintf('\n')
fprintf('For Motor:\n')
%...motor degradation
%...degradation input, 0 --> inf
fprintf('Degradation Input\n')
mot_degradation_input = input('   beginning from  0.0 = no degradation  -to-  Inf: ');
fprintf('\n')
if mot_degradation_input < 0.0; fprintf('!! Error, Degradation Input is Out of Input Range !!\n')
    return; end
clc

%...motor parameter adjustment values
mot_flux_m_adjustment = 0.5; % Wb, magnetic flux
mot_R_s_adjustment = 0.5; % Ohms, stator resistance
mot_P_Fe_Nom_adjustment = 0.5; % W, iron losses at nominal speed
mot_S_nom_adjustment = 0.5; % rpm, nominal speed

%% run Component Degradation Parameter models..............................

open DegradationParameterInverter
inv_ans = sim('DegradationParameterInverter'); %..run sim

open DegradationParameterMotor
mot_ans = sim('DegradationParameterMotor'); %..run sim

%% run system model .......................................................

open InverterMotorModel
tstep = 0.001; %...simulation timestep
t = 1; %...simulation time
temp = 528; %...temperature, R
sim_ans = sim('InverterMotorModel'); %...run slx

%% output variables .......................................................

fprintf('Inverter Outputs:\n')
fprintf('   Catastrophic Fault Toggle: %.0f\n',inv_catastrophic_fault_toggle)
fprintf('      (Inverter is %s)\n',inv_toggle)
fprintf('   Degradation Input: %.2f\n',inv_degradation_input)
fprintf('   Inverter Efficiency: %.5f\n',sim_ans.inv_eff.Data(end))
fprintf('\n')
fprintf('Motor Outputs:\n')
fprintf('   Catastrophic Fault Toggle: %.0f\n',mot_catastrophic_fault_toggle)
fprintf('      (Motor is %s)\n',mot_toggle)
fprintf('   Degradation Input: %.2f\n',mot_degradation_input)
fprintf('   Motor Efficiency: %.5f\n',sim_ans.mot_eff.Data(end))
fprintf('   Motor Power Factor: %.3f\n',sim_ans.mot_PF.Data(end))
fprintf('   Motor Demanded Power (W): %.3f\n',sim_ans.mot_P_demanded.Data(end))
fprintf('   Motor Mechanical Power (W): %.3f\n',sim_ans.mot_P_mech.Data(end))
fprintf('\n')
