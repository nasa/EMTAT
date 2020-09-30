function [Pdis,MassEst,C,L,Ron,RC,RL,QgTotal,TRise,TFall,swFreq,Vgate,Trr,n_MOSFET] = ...
iDesign_BuckConverter(V_out,loadPower,minV_in,maxV_in,vRippleMax,iRippleMax,...
swFreq)
%Assigns buck converter parameters based on user specified operating
%conditions/requirements

%Design procedures loosely follow steps outlined in: 
%Texas Instruments Application Report SLVA477B 
%"Basic Calculation of a Buck Converter's Power Stage"

% %--------------------------------------------------------------------------
% %            Design Based on SLVA477B
% %--------------------------------------------------------------------------
%Constant power dissipation:
Pdis = 1;
%mass estimate in kg based on load power in watts 
MassEst = .0037515*loadPower;
%Average of min and max voltage input:
V_in = (minV_in + maxV_in)/2;

%Inductor ripple current:
iRipple = iRippleMax*(loadPower/V_out);

%Max output current:
maxI_out = (loadPower/V_out) + iRipple/2;

%Desired output voltage ripple:
vRipple = vRippleMax*(V_out);

%Inductor value:
L = (V_out*(V_in-V_out))/(iRipple * swFreq * V_in);

%Inductor DCR:
RL = InductorDCR(L);

%Boost converter iDesign also calls the MOSFETsetVals function and needs
%one less return value than the buck converter:
isBuck = true;

%Select a MOSFET based on max current rating and assign its associated
%parameters to this function's return variables:
MOSFETvals = MOSFETsetVals(maxI_out, isBuck);
Ron = MOSFETvals(1);
QgTotal = MOSFETvals(2);
TRise = MOSFETvals(3);
TFall = MOSFETvals(4);
Vgate = MOSFETvals(5);
Trr = MOSFETvals(6);
n_MOSFET = MOSFETvals(7);

%Minimum output capacitor value:
minC = iRipple/(8 * swFreq * vRipple);

%Capacitor ESR and final capacitance value:
[C,RC] = capacitorESR(minC,swFreq,V_out);


%The commented out lines below were from an attempt to automate creation of
%a system whose parameters would cause dynamics to occur on the millisecond
%timescale of engine shaft dynamics. Put on hold for now:

% %Run simulation to adjust C and L and keep timeStep the same:
%     Ron_param = num2str(Ron);
%     RC_param = num2str(RC);
%     RL_param = num2str(RL);
%     timeStep_param = num2str(timeStep);
%     L_param = num2str(L);
%     C_param = num2str(C);
%     
%     load_system('iDesign_Converter_Dynamics');
%     set_param('iDesign_Converter_Dynamics/Cons_Ron','Value',Ron_param)
%     set_param('iDesign_Converter_Dynamics/Cons_RC','Value',RC_param)
%     set_param('iDesign_Converter_Dynamics/Cons_RL','Value',RL_param)
%     set_param('iDesign_Converter_Dynamics/timeStep','Value',timeStep_param)
%     set_param('iDesign_Converter_Dynamics/Inductor_Solver','SNR_IC_M',L_param)
%     set_param('iDesign_Converter_Dynamics/Capacitor_Solver','SNR_IC_M',C_param)
%     out = sim('iDesign_Converter_Dynamics');
%     L = out.signalsOut{4}.Values.Data(numel(out.signalsOut{4}.Values.Data));
%     C = out.signalsOut{1}.Values.Data(numel(out.signalsOut{1}.Values.Data));
%     t1 = out.signalsOut{2}.Values.Data(numel(out.signalsOut{2}.Values.Data));
%     t2 = out.signalsOut{3}.Values.Data(numel(out.signalsOut{3}.Values.Data));
%     %No change to fixed step size:
%    
%     if t1 <= 1 && t1 >= -1 && t2 <= 1 && t2 >= -1
%         disp('C_M and L_M for dynamic state operation have been succesfully determined')
%     else  %Solver did not reach suitable values for forward Euler stability:
%         disp('Could not determine C_M and L_M for dynamic state operation')
%     end

disp('iDesign Complete. Physical Parameters of Buck Converter have been updated');
end