%Infineon IKA10N60T
%1
%Ic_max at25C: 11.7A
%IC_max at 100C: 7.2A
%IC_puls_max: 30A
%IF_max: 11.9A
%IF_puls_max: 30A
%Ptot_max: 30W
%Max V_CE: 600V
%FSw range: 2kHz-20kHz
clear

I_max = 7.2;
V=600;
P=30;
Fsw_low = 2e3;
Fsw_high = 20e3;

save('F_I');
clear

T=[25,175]

%Switching Energy: (x=Ic, Y=E)
Xe1 = [2.5,15];
Ye1= [0.21e-3,0.92e-3];
%VCE (x=Vce, y=current Ic
Xc1 = [2,2.5];
Yc1 = [18.5,27];
%VD (diode forward voltage) (x=Vf,Y=If)
Xd1 = [1.5,2];
Yd1 = [9,17];


Xe2 = [2.5,15];
Ye2= [0.21e-3,0.92e-3];
%1 and 2 are the same here since we ONLY get a 175 degree, not 
%a 25 degree table table
Xc2 = [2,3];
Yc2 = [11.5,21];
Xd2 = [1.5,2.5];
Yd2 = [9.5,27];

save('F');