%Infineon IKQ100N60T
%3
%Ic_max at25C: 160.0A
%IC_max at 100C: 100.0A
%IC_puls_max: 400A
%IF_max: 160A
%IF_puls_max: 400A
%Ptot_max: 714W
%Max V_CE: 600V
%FSw range: 2kHz-20kHz
clear

I_max = 100;
V=600;
P=714;
Fsw_low = 2e3;
Fsw_high = 20e3;

save('D_I')

T=[25,175];

%Switching Energy: (x=Ic, Y=E)
Xe1 = [10,70]; 
Ye1= [14e-3,50e-3];
%VCE (x=Vce, y=current Ic), 15V
Xc1 = [1.5,2.5]
Yc1 = [92,275]
%VD (diode forward voltage) (x=Vf,Y=If)
Xd1 = [1.5,2.5];
Yd1 = [80,280];


Xe2 = [10,70]; 
Ye2= [14e-3,50e-3];
%1 and 2 are the same here since we ONLY get a 175 degree, not 
%a 25 degree table table
Xc2 = [1.5,3.5];
Yc2 = [65,260];

Xd2 = [1.5,2.5];
Yd2 = [85,248];

save('D');