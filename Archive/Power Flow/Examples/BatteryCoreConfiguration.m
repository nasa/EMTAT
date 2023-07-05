%------------------------------------------------------------------------------
% BatteryCoreConfiguration.m
%
% Edmond Wong/ NASA Glenn Research Center
% Last Revision: 5-09-2018
%------------------------------------------------------------------------------

% BATTERY PARAMETERS
% E0 – battery constant voltage (V)
% Q – battery capacity (Ah)
% R – battery internal resistance (ohm)
% K – polarization constant (Ah^-1)
% A – exponential zone amplitude (V)
% B – exponential zone time constant inverse (Ah^-1)

% Battery Type: 1 = Li-Ion; 0 = Ni-Mh/Lead Acid
battery_type = 1;

%  Lithium-Ion from Mathworks Simscape Example 
E0 = 52.5443;
Q = 40;
R = 0.012;
K = 0.010422;
A = 3.5358;
B = 1.5306;

% Panasonic Lithium-Ion CGR18650AF 
% E0 = 3.3;
% Q = 2.3;
% R = 0.01;
% K = 0.0076;
% A = 0.26422;
% B = 26.5487;

