% Run iDesign for motor controller block

BlockHandle = getSimulinkBlockHandle(gcb);

%Get mask values of system level iDesign parameters
Js = str2num(get_param(BlockHandle,'Js'));
bs = str2num(get_param(BlockHandle,'bs'));
tau = str2num(get_param(BlockHandle,'tau'));
SetAmp = str2num(get_param(BlockHandle,'SetAmp'));

% Calulate lower level parameters
controller = iDesign_SpeedController(Js,bs,tau,SetAmp);
P = controller.kp;
I = controller.Ki;
D = controller.kd;

%Set lower level parameters in mask
set_param(BlockHandle,'P',num2str(P));
set_param(BlockHandle,'I',num2str(I));
set_param(BlockHandle,'D',num2str(D));