%------------------------------------------------------------------------------
% BatteryCoreConfiguration.m
%
% Original Author: Edmong Wong / NASA Glenn Research Center
% Edited by: Francisco Mendez Sosa / NASA GRC Intern - Fall 2018
% Last Revision: 10/17/2018
%------------------------------------------------------------------------------

%--- Battery Type: 1 = Li-Ion; 0 = Ni-Mh/Lead Acid ---
battery_type = 1;

%--- BATTERY PARAMETERS from Mathworks Simscape Example (E0 through B) ---
E0 = 3.3000; %Battery Constant (Nominal) Voltage (V)
Q = 2.3; %Capacity (Ah)
R = 0.012; %Internal Resistance (Ohms)
K = 0.004; %Polarization Constant (V/Ah)/Polzarization Rsistance(Ohms)
A = 0.3120; %Exponential Voltage (V)
B = 10.3543; %Exponential Capacity (Ah-1)

% NOTE: Values for K, A, and B were obtained by using equations provided in
% the 'generic battery model' from the Simscape library. 
% For these equations, please refer to MathWorks Documentation path 
% Simscape/Electrical/Specialized Power Systems/Electric/Drives/Extra Resources

%--- THERMAL MODEL PARAMETERS ---
% The following variables were added to the mask as part of the thermal 
% model from University of Michigan's LiPO4 model
Cj=62.7; %J/K, Lumped Cell Core Heat Capacity
Cs=4.5; %J/K, Lumped Cell Surface (Casing) Heat Capacity
Rj=1.94; %K/W, conduction resistance b/w Core and Surface; 
Ru = 15; %K/W, convection resistance b/w Surface and Coolant; for natural convection, this number is above 10

% A123 Systems LiFePO4 26650
% E0 = 3.3 V;
% Q = 2.5 Ah;
% R = 0.01 (Ohms);
% K = ?;
% A = ?;
% B = ?;

