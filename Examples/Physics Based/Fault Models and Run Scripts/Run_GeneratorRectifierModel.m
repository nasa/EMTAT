%...Run GeneratorRectifierModel
%...Samuel Faulk, NASA Glenn Research Center
%...MATLAB 2021a

clear; clc; close all;

%% generator ..............................................................

%...generator catastrophic
fprintf('\n')
fprintf('For Generator:\n')
%...catastrophic fault toggle, 0 or 1
fprintf('Catastrophic Fault Toggle\n')
gen_catastrophic_fault_toggle = input('   0 = no fault  -or-  1 = fault: ');
fprintf('\n')
if gen_catastrophic_fault_toggle > 1 || gen_catastrophic_fault_toggle < 0
    fprintf('!! Error, Catastrophic Fault Toggle is Out of Input Range !!\n')
    return; end
if gen_catastrophic_fault_toggle == 1; gen_toggle = 'Faulted'; else
    gen_toggle = 'Not Faulted'; end
clc
fprintf('\n')
fprintf('For Generator:\n')
%...generator degradation
%...degradation input, 0 --> Inf
fprintf('Degradation Input\n')
gen_degradation_input = input('   beginning from  0.0 = no degradation  -to-  Inf: ');
fprintf('\n')
if gen_degradation_input < 0.0; fprintf('!! Error, Degradation Input is Out of Input Range !!\n')
    return; end
clc

%...generator parameter adjustment values
gen_flux_m_adjustment = 0.7; % Wb, magnetic flux
gen_R_s_adjustment = 0.5; % Ohms, stator resistance
gen_P_Fe_Nom_adjustment = 0.5; % W, Iron Losses at Nominal Speed

%% rectifier ..............................................................

%...rectifier catastrophic
fprintf('\n')
fprintf('For Rectifier:\n')
%...catastrophic fault toggle, 0 or 1
fprintf('Catastrophic Fault Toggle\n')
rect_catastrophic_fault_toggle = input('   0 = no fault  -or-  1 = fault: ');
fprintf('\n')
if rect_catastrophic_fault_toggle > 1 || rect_catastrophic_fault_toggle < 0
    fprintf('!! Error, Catastrophic Fault Toggle is Out of Input Range !!\n')
    return; end
if rect_catastrophic_fault_toggle == 1; rect_toggle = 'Faulted';
else; rect_toggle = 'Not Faulted'; end
clc
fprintf('\n')
fprintf('For Rectifier:\n')
%...rectifier degradation
%...degradation input, 0 --> Inf
fprintf('Degradation Input\n')
rect_degradation_input = input('   beginning from  0.0 = no degradation  -to-  Inf: ');
fprintf('\n')
if rect_degradation_input < 0.0; fprintf('!! Error, Degradation Input is Out of Input Range !!\n')
    return; end
clc

%...rectifier parameter adjustment values
rect_u_D_M_adjustment = -0.1; % V, diode voltage at 0A
rect_E1_M_adjustment = -0.1; % Hz, E1 switching frequency
rect_f_sw_M_adjustment = -0.1; % Hz, switching frequency

%% run Component Degradation Parameter models..............................

open DegradationParameterGenerator
gen_ans = sim('DegradationParameterGenerator'); %..run sim

open DegradationParameterRectifier
rect_ans = sim('DegradationParameterRectifier'); %..run sim

%% run system model .......................................................

open GeneratorRectifierModel
tstep = 0.001; %...simulation timestep
t = 1; %...simulation time
temp = 528; %...temperature, R
sim_ans = sim('GeneratorRectifierModel'); %...run slx

%% output variables .......................................................

fprintf('\n')
fprintf('Generator Outputs:\n')
fprintf('   Catastrophic Fault Toggle: %.0f\n',gen_catastrophic_fault_toggle)
fprintf('      (Generator is %s)\n',gen_toggle)
fprintf('   Degradation Input: %.2f\n',gen_degradation_input)
fprintf('   Generator Efficiency: %.5f\n',sim_ans.gen_eff.Data(end))
fprintf('\n')
fprintf('Rectifier Outputs:\n')
fprintf('   Catastrophic Fault Toggle: %.0f\n',rect_catastrophic_fault_toggle)
fprintf('      (Rectifier is %s)\n',rect_toggle)
fprintf('   Degradation Input: %.2f\n',rect_degradation_input)
fprintf('   Rectifier Efficiency: %.5f\n',sim_ans.rect_eff.Data(end))
fprintf('   Rectifier Output Voltage (V): %.5f\n',sim_ans.rect_V_out.Data(end))
fprintf('\n')
