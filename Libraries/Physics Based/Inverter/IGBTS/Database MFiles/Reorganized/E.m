%Infineon IKQ120N60T

%Ic_max at 25C: 160.0A
%IC_max at 100C: 120.0A
%IC_puls_max: 480A
%IF_max: 160A
%IF_puls_max: 480A
%Ptot_max: 833W
%Max V_CE: 600V
%FSw range: 2kHz-20kHz
clear

I_max = 120;
V=600;
P=833;
Fsw_low = 2e3;
Fsw_high = 20e3;

save('E_I')


T=[25,175];

%Switching Energy: (x=Ic, Y=E)
Xe1 = [40,200]; 
Ye1= [4e-3,21e-3];
%VCE (x=Vce, y=current Ic), 15V
Xc1 = [1.5,2.5];
Yc1 = [115,335];
%VD (diode forward voltage) (x=Vf,Y=If)
Xd1 = [1.5,2.5];
Yd1 = [100,350];


Xe2 = [40,200]; 
Ye2= [4e-3,21e-3]

%1 and 2 are the same here since we ONLY get a 175 degree, not 
%a 25 degree table table
Xc2 = [1.5,3];
Yc2 = [75,245];

Xd2 = [1.5,2.5];
Yd2 = [110,290];

save('E');