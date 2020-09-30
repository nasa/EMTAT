function [Pdis,C,L,Ron,RC,RL,QgTotal,vDiode,TRise,TFall,swFreq,Vgate, n_MOSFET] = ...
iDesign_BoostConverter(V_out,loadPower,minV_in,maxV_in,vRippleMax,iRippleMax,...
swFreq)
%Assigns boost converter parameters based on user specified operating
%conditions/requirements

%Design procedures loosely follow steps outlined in: 
%Texas Instruments Application Report (SLVA372C)
%"Basic Calculation of a Boost Converter's Power Stage" 



% %--------------------------------------------------------------------------
% %            Design Based on TSLVA372C
% %--------------------------------------------------------------------------
%   Constant power dissipation:
Pdis = 1;

%Voltage in as average of min and max on input bus
V_in = (minV_in+maxV_in)/2;

%Calculate inductor ripple current with estimate of 85% efficiency used to calculate input current:
iRipple = iRippleMax * (loadPower/0.85)/V_in;
vRipple = vRippleMax * V_out;

%Assuming that max current is 25% greater than specified current to load:
maxI_out = (loadPower+.25*loadPower)/V_out;

%Assuming approximate efficiency of 85% (No bearing on actual simulation
%efficiency):
d = 1 - (minV_in * 0.85)/V_out; 

%Inductance:
L = (V_in *(V_out-V_in))/(iRipple * swFreq * V_out);
%Inductor DCR:
RL = InductorDCR(L);

%Minimum capacitance
minC = (maxI_out*d)/(swFreq*V_out*vRipple);
   
%Set capacitor value and ESR:
[C,RC] = capacitorESR(minC,swFreq,V_out);

% %--------------------------------------------------------------------------
% %         Switching MOSFET Selection based on peak current rating
% %--------------------------------------------------------------------------
%This is the peak current the inductor, the integrated switch(es), and the
%external diode have to withstand:
iMax_MOSFET = iRipple/2 + maxI_out/(1-d);

%Buck converter iDesign also calls the MOSFETvals function and needs an extra
%return value that the boost does not need:
isBuck = false;

MOSFETvals = MOSFETsetVals(iMax_MOSFET,isBuck);
Ron = MOSFETvals(1);
QgTotal = MOSFETvals(2);
vDiode = MOSFETvals(3);
TRise = MOSFETvals(4);
TFall = MOSFETvals(5);
Vgate = MOSFETvals(6);
n_MOSFET = MOSFETvals(7);

%The commented out lines below were from an attempt to automate creation of
%a system whose parameters would cause dynamics to occur on the millisecond
%timescale of engine shaft dynamics. Put on hold for now:

%Run simulink model iDesign_BoostConverter_Sim in order to calculate values for
% dynamic state space implementation
% if dynamicFlag == true
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
%     if t1 <= 1 && t1 >= -1 && t2 <= 1 && t2 >= -1
%         disp('C_M and L_M for dynamic state operation have been determined')
%     else
%         disp('Could not determine C_M and L_M for dynamic state operation')
%     end
% end
disp('iDesign Complete. Physical Parameters of Boost Converter have been updated');
end