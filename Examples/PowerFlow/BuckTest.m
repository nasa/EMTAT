
% Model parameters and inputs.
% mostly from "DIGITALLY-CONTROLLED DC-DC CONVERTER WITH VARIABLE SWITCHING
% FREQUENCY, Priewasser R. et al."
Vin = 12;      % V
Vref = 1;      % V and Vout
Io = 0.1;      % A
IoLoaded = 20; % A
L = 0.3e-6;    % uH
C = 600e-6;    % uF
Rc = 1e-3;     % mOhm
RL = 1e-3;     % mOhm
Ron = 15e-3;   % mOhm
Rp = Ron+RL+Rc;

% High side switch ON state-space model
A1 = [  0    1/C ;
      -1/L -Rp/L  ];
B1 = [  0   -1/C ;
       1/L  Rc/L  ];
C1 = [  1    Rc   ];
D1 = [  0   -Rc   ];

% High side switch OFF state-space model
A2 = A1;
B2 = [  0   -1/C ;
        0   Rc/L  ];
C2 = C1;
D2 = D1;

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

% Initial conditions
Vc_0 = Vin;
IL_0 = Io*(Vref/Vin);
% Initial input guess (input current is inductor current...)


% PI control design
Kp = 0.00;    % duty/Verr
Ki = 2.00;
Kd = 0.00;


