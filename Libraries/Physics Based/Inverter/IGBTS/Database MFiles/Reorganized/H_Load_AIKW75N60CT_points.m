%Infineon AIKW75N60CT
%4
%Ic_max at25C: 80.0A
%IC_max at 100C: 75.0A
%IC_puls_max: 225A
%IF_max: 80A
%IF_puls_max: 225A
%Ptot_max: 428W
%Max V_CE: 600V
%FSw range: 0-30kHz
clear

I_max = 75;
V=600;
P=428;
Fsw_low = 0e3;
Fsw_high = 30e3;

save('H_I');
clear

T=[25,175];

%Switching Energy: (x=Ic, Y=E)
Xe1 = [20,140]; 
Ye1= [1.7e-3,14e-3];
%VCE (x=Vce, y=current Ic), 15V VGe
Xc1 = [1.5,2.5];
Yc1 = [70,190];
%VD (diode forward voltage) (x=Vf,Y=If)
Xd1 = [1.5,2.5];
Yd1 = [52,228];


Xe2 = Xe1; 
Ye2= Ye1;
%1 and 2 are the same here since we ONLY get a 175 degree, not 
%a 25 degree table table


Xc2 = [1.5,3.5];
Yc2 = [45,172];

Xd2 = [1,2.5];
Yd2 = [24,190];

save('H');