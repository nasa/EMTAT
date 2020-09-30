%Infineon FZ600R12KE4
%Module 2
%Ic_max 600A
%IC_puls_max: ?
%IF_max: ?
%IF_puls_max: ?
%Ptot_max: 3kW
%Max V_CE: 1200V
%FSw range: 18-60kHz
clear

I_max = 600;
V=1200;
P=3000;
Fsw_low = 18e3;
Fsw_high = 60e3;

save('D_I');
T=[25,150];

%Switching Energy: (x=Ic, Y=E)
%This is given at 125 and 150C
%We are going to use 150 here
Xe1 = [200,1000]; 
Ye1= [(25+30)*10^-3,(90+142)*10^-3];
%VCE (x=Vce, y=current Ic), 15V VGe
Xc1 = [1.5,2.5];
Yc1 = [420,1200];
%VD (diode forward voltage) (x=Vf,Y=If)
Xd1 = [1.6,2.2];
Yd1 = [410,1030];


Xe2 = Xe1; 
Ye2= Ye1;
%1 and 2 are the same here
%for consistency


Xc2 = [1.5,2.5];
Yc2 = [340,820];

Xd2 = [1.4,2.2];
Yd2 = [380,1080];

save('D');