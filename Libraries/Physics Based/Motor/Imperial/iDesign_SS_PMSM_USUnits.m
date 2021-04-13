%Gregory Fretti
%12/12/2019
%This iDesign script finds several other parameters of the motor
% 
% function [R_M, L_M, LamPM_M, NPhases_M,P_Fe_Nom,PolePairs]= ...
function [PolePairs,LamPM_M, R_M, L_M, P_Fe_nom, S_nom, T_nom, P_out_max, I_max, P_in_max, T_max]= ...
iDesign_SS_PMSM_USUnits(nPoles_i,Rs_i,Ls_i,S_nom_i,T_nom_i,P_out_max_i,I_max_i,P_in_max_i,K,V_nom_i,P_Fe_nom_i,I_nom_i,PF_nom_i,P_Fe_Calc_Flag,T_max_i)
% iDesign_SS_PMSM(SNom,P_nom,Rs,Ls,K,nPoles,I,PF,CalculatePFe,V_nom)

%Imperial to metric
% nPoles_i
% Rs_i
% Ls_i
% S_nom_i
T_nom_i = T_nom_i %* 1.3558 (lbs-ft to Nm) Conversion removed as input is expected to be in lbs-ft (rather than Nm) as of 4/5/2021
P_out_max_i = P_out_max_i %*765.7 (hp to W) Conversion removed as input is expected to be in W (rather than hp) as of 4/5/2021
% I_max_i
% P_in_max_i
% K
% V_nom_i
% P_Fe_nom_i
% I_nom_i
% PF_nom_i
% P_Fe_Calc_Flag
T_max_i = T_max_i %* 1.3558 (lbs-ft to Nm) Conversion removed as input is expected to be in lbs-ft (rather than Nm) as of 4/5/2021





PolePairs = nPoles_i/2;

K = K * (60/(2*pi*1000)); %conversion from V/(kRPM) to Vs/rad

LamPM_M = K/((nPoles_i)/2);


if Rs_i==0
    Rs = 4.8165*(P_out_max_i/1000)^-1.163;
    %This was derived using 400V motors from 0.5 to 150kW
    %alternately, as a function of P and V, the formula
    %R_M=(4.5*10^-5)*V^2*((P*1000)^-1.639) works, but
    %that regression was only derived from lower-power motors
    %from 0.5 to 11.3kW, and also only used two different voltage motors
    %(230V and 400V)
    
else R_M = Rs_i %If R_M was input, the iDesign passes it through
end

if Ls_i == 0
    L_M = (25.655*(P_out_max_i/1000)^-0.816)/1000;
    %Another regression relationship based on 400V motors.
    %The multiplication by 1000 and divison by 1000 represents the
    %original relation being between kilowatts and millihenries.
else L_M = Ls_i; %If L_M was input, the iDesign passes it through
end


if P_Fe_Calc_Flag == true

P_Fe_nom = (sqrt(3)*V_nom_i*I_max_i*PF_nom_i-P_out_max_i)-(3*Rs_i*(I_max_i)^2);
    
    
else P_Fe_nom = P_Fe_nom_i;
end

T_nom = T_nom_i; %REF OR MAX?

P_out_max = P_out_max_i;

I_max=I_max_i;

S_nom=S_nom_i;

P_in_max = P_in_max_i;

T_max = T_max_i
end
