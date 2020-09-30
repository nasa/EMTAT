%Infineon IKQ75N120CH3
%A1
%Ic_max at25C: 150A
%IC_max at 100C: 75A
%IC_puls_max: 300A
%IF_max: 75A
%IF_puls_max: 300A
%Ptot_max: 938W, 256W at 134C
%Max V_CE: 1200V
%FSw range: 18-60kHz
clear 

I_max = 75;
V=1200;
P=938;
Fsw_low = 18e3;
Fsw_high = 60e3;

save('C_I');


T=[25,175];

%Switching Energy: (x=Ic, Y=E)
Xe1 = [30,150]; 
Ye1= [7e-3,54e-3];
%VCE (x=Vce, y=current Ic), 17V VGe
Xc1 = [2,3];
Yc1 = [80,155];
%VD (diode forward voltage) (x=Vf,Y=If)
Xd1 = [2,3];
Yd1 = [76,195];


Xe2 = Xe1; 
Ye2= Ye1;
%1 and 2 are the same here since we ONLY get a 175 degree, not 
%a 25 degree table table


Xc2 = [2,4];
Yc2 = [55,168];

Xd2 = [1.5,3];
Yd2 = [40,172];

save('C');