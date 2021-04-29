function [radius_c, t_i, Mass, R_c, alpha] = iDesign_Cable(V_max, V_drop_percent, I_max,...
    Length, Material_c, Material_i, derat_fact)
%Assigns cable parameters based on user specified operating conditions/requirements


%From material selection, assign properties:
switch (Material_c)
    case 'Copper'
        r_c = 0.00000168;   %ohm-cm @20C
        dens_c = 8.96;      %g/cm^3
        alpha = 0.00393    %/C @ 20C
    case 'Aluminum'
        r_c = 0.00000265;   %ohm-cm @20C
        dens_c = 2.70;      %g/cm^3
        alpha = 0.004308    %/C @ 20C
    case 'Steel'
        r_c = 0.000006897;   %ohm-cm @20C
        dens_c = 7.7;      %g/cm^3
        alpha = 0.0000172    %/C @ 20C
end


switch (Material_i)
    case 'PVC'
        ep = 8; %dielectric permittivity for PVC @ 50Hz
        dens_i = 1.40;  %g/cm^3
    case 'PE'
        ep = 2.5;
        dens_i = 0.93;   %g/cm^3
    case 'ETFE'
        ep = 2.6;
        dens_i = 1.70;   %g/cm^3
end

%Calculate conductor voltage drop and resistance
VD = V_max*(V_drop_percent*0.01);
I_derat = I_max*derat_fact;
R_c = VD/I_derat;

%Find cross-sectional area of conductor
    %From R = r*(L/A):
A_c = r_c * Length / R_c;

%Find mass of conductor
Mass_c = A_c * Length * dens_c;

%Find thickness of insulator
K = (3*ep)/(1+2*ep);
t_v = 0.005; %void thickness (cm)
a = 340; %min breakdown voltage of air (V)
radius_c = sqrt(A_c/pi());  %radius of conductor (cm)

if (V_max >= 20000)
    C = 0;
else
    C = 0.1; %cm

t_i = R_c*(exp((K*V_max*sqrt(2/3)*t_v)/(a*radius_c)) - 1) + C;    %Insulator thickness, for use in insulator Area & Mass

%Find area of insulator
A_i = (t_i^2 + 2*t_i*radius_c)*pi();

%Find mass of insulator
Mass_i = A_i*Length*dens_i;

%Find total mass of wire
Mass = Mass_c + Mass_i;

%Convert conductor radius & insulator thickness to mm
radius_c = radius_c*10;
t_i = t_i*10;

disp('iDesign Complete. Physical Parameters of Cable have been updated');
end