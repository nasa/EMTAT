 %==========================================================================
% 
%     Electrothermal_Battery_V2_Script_Feedback.m
%     Purpose:    Loads simulation parameters 
%               (ElectrothermalBattery_v1_BatteryCoreConfiguration_LiFePO4)
%                 and battery parameter estimation optimization program
%                 written by Don Simon (BatteryDischargeCurve_E0.m, and
%                 battery_optimize_function_E0.m)
%
%     Programmer: Mark Bell (Vantage Partners)
%     Date:       June 21, 2019
%
%     Modified: MONTH DD, YYYY by FIRST_NAME LAST_NAME to STATE_PURPOSE_FOR
%               MODIFICATION
% 
%==========================================================================

clear; close all; clc;

% Initial state-of-charge percentage. Do not use exactly 0.
initial_SOC = 100;

charge_switch = 0;

ElectrothermalBattery_v1_BatteryCoreConfiguration_LiFePO4;

% Sim-compatible Time inputs:
t = 6000; %simulation run time input - May change for longer/shorter cycling
dt = 0.001; %time step for simulation SOLVER input - Do not change
open Electrothermal_Battery_v2_Simulation_Feedback;
%sim('Electrothermal_Battery_Current_Limiting');

%Plots for Core and Surface Temperature
%plot(Tsurf)
%hold on
%plot(Tcore)
%xlabel('Time(s)')
%ylabel('Temperature (degrees C)')
%legend({'Surface Temperature (Tsurf)','Core Temperature (Tcore)'},'Location','southeast')



% Simulation settings begin
% Original Current inputs (- for charge, + for discharge)
% charge_current = -20;
% discharge_current = 20;

% Modified Current Inputs: UoM Battery (- for charge, + for discharge)
% charge_current = -4.6;
% discharge_current = 4.6;

% Hi-Fi Time Inputs
% dt = 0.015; %time-step used for both simulation input and t vector for plotting
% tf = 50000; %Final time used for simulation input

% UoM Simulation Time Inputs
% Modified Time Inputs
% t_run = 1800; %t_run: Cycling run time in seconds (s)- Original time: 1800s
% dt = t_run*10; %dt: linspace input - multiplying by 10 creates a vector that matches length(I)
% t = linspace(1, t_run, dt);
% t = t';
% options = [];


% Requests number of cycles (n) and creates current profile accordingly

% n = input('Enter the number of cycles here:  '); %Note: 1 Cycle = 1 Discharge Curve + 1 Charge Curve
% I = []; %Creates empty vector for concatenating/appending discharge & charge vectors
% half_c = ones(floor(length(t)/(2*n)), 1); % Allocates length of a half cycle (a discharge curve, OR a charge curve) as a function of 'length(t)' and number of cycles 'n'
% I_disch = 4.6*half_c; %Assigns a length and magnitude to a Discharge Curve (+I) corresponding to a total number of cycles n
% I_chg = -4.6*half_c; %Assigns a length and magnitude to a Charge Curve (-I) corresponding to a total number of cycles n

%The following for-loop appends/concatenates discharge and charge curves of
%length(t) and for a total of n cycles

% for k = 1:n
%     I = [I; I_disch; I_chg];
% end


% ORIGINAL - Francisco
% ut=[t I]; % simulation input
% [ts,xs,y]=sim('FMS_ElectrothermalModel_Sim.mdl', t, options, ut);
% Tc= y(:,1); % simulated battery core temperature;
% Ts= y(:,2); % simulated battery surface temperature;
% SOC= y(:,3); % simulated battery SOC;
% V_T = y(:,4); % simulated battery voltages;


% PLOTS - Generates plots for Core and Surface Temperatures

% % t_plot=t/dt;
% % figure;
% % plot(t_plot, Tsurf, t_plot, Tcore)
% % xlabel('t (s)')
% % ylabel('T (^oC)')
% % legend('Tsurf','Tcore')

% figure;
% subplot(2,1,1)
% plot(t, SOC);
% xlabel('t (s)')
% ylabel('State of Charge')
% subplot(2,1,2)
% plot(t, V_T)
% xlabel('t (s)')
% ylabel('Voltage (V)')