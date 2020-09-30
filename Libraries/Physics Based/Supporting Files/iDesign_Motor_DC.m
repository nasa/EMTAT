function [K,Ra,bm,Jm,La] = iDesign_Motor_DC(V,Wn,Pmax,Io,Tm,Te)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Creator: Santino Bianco (Vantage Partners, LLC)
%
%   Description: Calculates dynamic equation parameters based on
%                assumptions made about the torque vs speed and power vs
%                speed.
%
%   Inputs: V = nominal voltage (V)
%           Wn = no load speed (RPM)
%           Pmax = maximum power (W)
%           Io = no load current (A)
%           Tm = mechanical time constant (s)
%           Te = electrical time constant (s)
%
%   Outputs: k = torque/back EMF constant (N-m/A or V-s/rad)
%            Ra = armature resistance (Ohm)
%            bm = motor damping (N-m-s)
%            Jm = motor inertia (kg-m^2)
%            La = armature inductance (H)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Convert no load speed (RPM) to (rad/s)
Wn = (pi/30)*Wn;

% Torque/back EMF constant
K = V/Wn;

% Stall torque
Ts = 4*Pmax/Wn;

% Armature resistance
Ra = K*(V-K*0.5*Wn)/(0.5*Ts);

% Motor damping
bm = K*Io/Wn;

% Inertia 
Jm = Tm*K^2/Ra;

% Inductance
La = Te*Ra;

end

