blockHandle = getSimulinkBlockHandle(gcb); %Get block handle 

%Get values of parameters:
V_out = str2num(get_param(blockHandle,'vOut'));
loadPower = str2num(get_param(blockHandle,'pow'));
minV_in = str2num(get_param(blockHandle,'minV'));
maxV_in = str2num(get_param(blockHandle,'maxV'));
vRippleMax = str2num(get_param(blockHandle,'vRip'));
iRippleMax = str2num(get_param(blockHandle,'iRip'));
swFreq = str2num(get_param(blockHandle,'freq'));

%Call iDesign m file that calculates component values
%based on operating conditions:
[Pdis,C,L,Ron,RC,RL,QgTotal,vDiode,...
    TRise,TFall,swFreq,Vgate,n_MOSFET] = ...
    iDesign_BoostConverter(V_out,loadPower,...
    minV_in,maxV_in,vRippleMax,iRippleMax,swFreq);
%Convert numeric to string for set_param to use
Pdis = num2str(Pdis);
C = num2str(C);
L = num2str(L);
Ron = num2str(Ron);
RC = num2str(RC);
RL = num2str(RL);
QgTotal = num2str(QgTotal);
vDiode = num2str(vDiode);
TRise = num2str(TRise);
TFall = num2str(TFall);
swFreq = num2str(swFreq);
Vgate = num2str(Vgate);
n_MOSFET = num2str(n_MOSFET);

%Set mask parameters to calculated values:

set_param(blockHandle,'Pdis_M',Pdis);
set_param(blockHandle,'C_M',C);
set_param(blockHandle,'L_M',L);
set_param(blockHandle,'Ron_M',Ron);
set_param(blockHandle,'RC_M',RC);
set_param(blockHandle,'RL_M',RL);
set_param(blockHandle,'QgTotal_M',QgTotal);
set_param(blockHandle,'Vdiode_M',vDiode);
set_param(blockHandle,'TRise_M',TRise);
set_param(blockHandle,'TFall_M',TFall);
set_param(blockHandle,'Fsw_M',swFreq);
set_param(blockHandle,'Vgate_M',Vgate);
set_param(blockHandle,'n_MOSFET',n_MOSFET);