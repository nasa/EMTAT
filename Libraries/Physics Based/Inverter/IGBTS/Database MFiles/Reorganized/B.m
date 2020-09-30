1%Infineon IKP20N60T
%2
%Ic_max at25C: 41.0A
%IC_max at 100C: 28.0A
%IC_puls_max: 60A
%IF_max: 41.0A
%IF_puls_max: 60A
%Ptot_max: 166W
%Max V_CE: 600V
%FSw range: 2kHz-20kHz
clear

I_max = 28;
V=600;
P=166;
Fsw_low = 2e3;
Fsw_high = 20e3;

save('B_I');


T=[25,175];

%Switching Energy: (x=Ic, Y=E)
Xe1 = [2.5,27.5];
Ye1= [0.2e-3,1.6e-3];
%VCE (x=Vce, y=current Ic), 15V
Xc1 = [1.4,2]
Yc1 = [15,36]
%VD (diode forward voltage) (x=Vf,Y=If)
Xd1 = [1.5,2];
Yd1 = [14,35];


Xe2 = [2.5,27.5];
Ye2= [0.2e-3,1.6e-3];
%1 and 2 are the same here since we ONLY get a 175 degree, not 
%a 25 degree table table
Xc2 = [1.4,3];
Yc2 = [10,39];

Xd2 = [1.5,2.5];
Yd2 = [17,51];

save('B');