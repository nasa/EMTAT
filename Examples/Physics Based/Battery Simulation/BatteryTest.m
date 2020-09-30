%------------------------------------------------------------------------------
% BatteryTest.m
%
% Edmond Wong/ NASA Glenn Research Center
%------------------------------------------------------------------------------

clear; close all; clc;

% Simulation settings 
charge_current = -20;
discharge_current = 20;

% Initial state-of-charge percentage. Do not use exactly 0.
initial_SOC = 100;

charge_switch = 0;

BatteryCoreConfiguration;

open SimulateBatteryModel
