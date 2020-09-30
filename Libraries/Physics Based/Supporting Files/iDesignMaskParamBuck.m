%Get block handle: 
blockHandle = getSimulinkBlockHandle(gcb); 


%Get values of parameters and convert from string type to numeric data type:
V_out = str2num(get_param(blockHandle,'vOut'));
loadPower = str2num(get_param(blockHandle,'pow'));
minV_in = str2num(get_param(blockHandle,'minV'));
maxV_in = str2num(get_param(blockHandle,'maxV'));
vRippleMax = str2num(get_param(blockHandle,'vRip'));
iRippleMax = str2num(get_param(blockHandle,'iRip'));
swFreq = str2num(get_param(blockHandle,'freq'));

%Call iDesign_BuckConverter.m to calculate component values
%based on specified operating conditions:
[Pdis,C,L,Ron,RC,RL,QgTotal,...
    TRise,TFall,swFreq,Vgate,Trr,n_MOSFET] = ...
    iDesign_BuckConverter(V_out,loadPower,...
    minV_in,maxV_in,vRippleMax,iRippleMax,swFreq);

%Convert numeric data types to strings so set_param can assign them to the
%simulation:
Pdis = num2str(Pdis);
C = num2str(C);
L = num2str(L);
Ron = num2str(Ron);
RC = num2str(RC);
RL = num2str(RL);
QgTotal = num2str(QgTotal);
TRise = num2str(TRise);
TFall = num2str(TFall);
swFreq = num2str(swFreq);
Vgate = num2str(Vgate);
Trr = num2str(Trr);
n_MOSFET = num2str(n_MOSFET);

%Set block parameters according to the values returned above:
set_param(blockHandle,'Pdis_M',Pdis);
set_param(blockHandle,'C_M',C);
set_param(blockHandle,'L_M',L);
set_param(blockHandle,'Ron_M',Ron);
set_param(blockHandle,'RC_M',RC);
set_param(blockHandle,'RL_M',RL);
set_param(blockHandle,'QgTotal_M',QgTotal);
set_param(blockHandle,'TRise_M',TRise);
set_param(blockHandle,'TFall_M',TFall);
set_param(blockHandle,'Fsw_M',swFreq);
set_param(blockHandle,'Vgate_M',Vgate);
set_param(blockHandle,'Trr_M',Trr);
set_param(blockHandle,'n_MOSFET',n_MOSFET);