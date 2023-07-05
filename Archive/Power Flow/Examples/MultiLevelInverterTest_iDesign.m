
% Model parameters and inputs.
% mostly from "Phasor Model of Modular Multilevel Converter
% With Circulating Current Suppression Control,"
% Dragan Jovcic and Ali Akbar Jamshidifar
clear;
Vin = 640e3;        % 640 kV DC bus
VoutACRMS = 370e3;  % 370 kV RMS AC bus
% assuming this is line to line...
% The model needs line to neutral, so 1/sqrt(3) of that.
VoutACRMS = VoutACRMS/sqrt(3);
VArated = 1000e6;   % 1000 MVA rating
NModules = 401;     % 401 submodules in the inverter
Csm = 10e-3;        % Capacitance per module, F
Carm = Csm/(NModules/2);% Total arm capacitance, F
Rarm = 1.2;         % Total resistance per arm of inverter, Ohms
Larm = 0.08;        % Total arm inductance, Henries
NPhases = 3;        % 3 Phase system!

% Assuming balanced 3-phase system and using POWER INVARIANT dq0 transform
% This is the dq voltage that gets you the desired AC RMS value (phasor)
Voutdq = [1 ; 0] * 206.5e3;%VoutACRMS;

% Ok, we are going to run this thing at a stairstep power profile
% Running to values that are in the reference above (Table IV)
P_puvec = [ 1.0  1.0  0.5  0.5  0.1  0.1 -0.1 -0.1 -0.5 -0.5 -1.0 -1.0];
P_tvec  = [0.00 1.00 1.01 2.00 2.01 3.00 3.01 4.00 4.01 5.00 5.01 6.00]*1;
P_Pvec  = P_puvec*VArated;
I_Idvec = P_Pvec/VoutACRMS;
I_Iqvec = -0.0*P_Pvec/VoutACRMS; % the reference says Xt = 8%? lol idk?
IinIC = I_Idvec(1);

% Time step
dt=0.001;

%Power Loss values
%Efficiency of Buck Converter
%www.rohm.com
QgTotal=2e-9; %C Gate charge of high side MOSFET 1nC and Gate charge low side MOSFET 1nC
Vgate=5;   %V 
Fsw=1e6;      %Hz
TRise=4e-9;   %seconds
TFall=6e-9;   %seconds
Trr=25e-9;    %seconds

% PI control design
Kp = 0.00;    % duty/Verr
Ki = 0.00020; % this is descently fast.
Kd = 0.00;

% % Some stuff below I used to examine 3 phase vs dq time domain signals.
% t = [0 : 0.01 : 2*pi];
% cosArg = [t-(2*pi/3) ; t ; t+(2*pi/3)]';
% VoutAC_ABC = sqrt(2)*VoutACRMS*cos(cosArg);
% for i = 1 : size(VoutAC_ABC,1)
%     % Power invariant dq0 transform matrices
%     Kp = [ cos(cosArg(i,1)), sin(cosArg(i,1)), 0; ...
%           -sin(cosArg(i,1)), cos(cosArg(i,1)), 0; ...
%                 0                 0            1];
%     Kc = sqrt(2/3)*[    1       -0.5       -0.5    ; ...
%                         0     sqrt(3)/2  -sqrt(3)/2 ; ...
%                     1/sqrt(2) 1/sqrt(2)  1/sqrt(2)];
%     VoutAC_DQ0(i,:) = (Kp*Kc*VoutAC_ABC(i,:)')';
%     V_ABCNorm(i) = norm(VoutAC_ABC(i,:));
%     V_DQ0Norm(i) = norm(VoutAC_DQ0(i,:));
%     V_DQNorm(i) = norm(VoutAC_DQ0(i,1:2));
% end

%% manually recorded results and analysis
% OK here is some data I got out of the model.
Idiffexp = [506 248 48.6 -48.2 -236 -461];
edexp = [207.9 207.2 206.6 206.4 205.8 205.1]*1e3;
eqexp = [-35.18 -17.59 -3.518 3.518 17.59 35.18]*1e3;
% and reference data from the paper
Idiffref = [.518 .260 .0519 -.052 -.261 -.524]*1e3;
edref = [208.5 207.1 206.2 205.8 205.2 204.7]*1e3;
eqref = [-35.00 -17.40 -3.38 3.62 17.60 35.05]*1e3;

IdiffPctErr = 100*(Idiffexp-Idiffref)./Idiffref
edPctErr = 100*(edexp-edref)./edref
eqPctErr = 100*(eqexp-eqref)./eqref
