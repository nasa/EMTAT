%Infineon FZ3600R12HP4
%Module 1 (3 IGBTs in parallel)
%Ic_max 3600A
%IC_puls_max: ?
%IF_max: ?
%IF_puls_max: ?
%Ptot_max: 19kW
%Max V_CE: 1200V
%FSw range: 18-60kHz
clear

I_max = 3600;
V=1200;
P=19000;
Fsw_low = 18e3;
Fsw_high = 60e3;

save('G_I');



T=[25,150];

%Switching Energy: (x=Ic, Y=E)
%This is given at 125 and 150C
%We are going to use 150 here
Xe1 = [2400,4800]; 
Ye1= [(400+600)*10^-3,(900+1500)*10^-3];
%VCE (x=Vce, y=current Ic), 15V VGe
Xc1 = [1,2];
Yc1 = [600,5200];
%VD (diode forward voltage) (x=Vf,Y=If)
Xd1 = [1.5,2.1];
Yd1 = [2000,5500];


Xe2 = Xe1; 
Ye2= Ye1;
%1 and 2 are the same here
%for consistency


Xc2 = [1,2];
Yc2 = [700,3200];

Xd2 = [1.5,2.1];
Yd2 = [2700,5900];

save('G');