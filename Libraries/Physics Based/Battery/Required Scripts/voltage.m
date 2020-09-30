%--------------------------------------------------------------------------
%                       Written by Peter Matt
%                              NASA GRC
% Updated by Gregory Fretti to correct incorrect formulae
%                             8/23/2019
%--------------------------------------------------------------------------
%The model for this battery is based on "Modeling Stationary Lithium-Ion
%Batteries for Optimization and Predictive Control" by Emma Raszman
%https://www.nrel.gov/docs/fy17osti/67809.pdf


function [v,it_trim] = voltage(len,Q,A,B,K,E0,R,varargin)
% [v,it_trim] = voltage(len,Q,A,B,K,E0,R,varargin)
%len is the length of the voltage vector to be calculated before trimming. 
%Q through R are EMTAT battery parameters
%
% This function calculate voltage based on provided parameters. Uses the same equations
% as the EMTAT battery block in Simulink. it_trim will be the length of len
% unless the voltage ends up with derivatives below -10. These negative
% derivatives occur at very low states of charge and extend to minus
% infinity if taken to full discharge. Trimming removes those infinite
% derivatives from the voltage, and so the discharged capacity vector (it) also
% has to be trimmed (it_trim) to match. 
%If discharge current is known, it can be entered as the last argument as a
%vector the same length as len. If not it will be set equal to Q.


%Time for discharge (hrs):
tmax = 1;
%Array of Battery Currents (Amps):
if nargin == 8
    iBatt = mean(abs(varargin{1}));
else
    iBatt = Q;
end
%Time array (sec) 150 ms time step initially:
t_sec = linspace(0,(tmax.*(60^2)),len);
%Battery charge consumed during discharge (Ah):
it = linspace(0,Q,length(t_sec));
% Exponential Zone Voltage of Li_Ion (V):
v_Exp = A .* exp(-1 .* B .* (it));
% Polarization Resistance Discharging (Ohms):
r_Pol = K .* Q./(Q-it);
% Polarization Voltage:
v_Pol = it .* K .* Q./(Q-it);


% v_Pol_old = K .* Q./(Q-it);
%This was the formula in several old versions, which implied that v_Pol and
%r_Pol are the same thing. I kept it in a comment just to show what was
%wrong and how it was fixed.


% Battery Voltage Over One Complete Discharge:
v = E0 + v_Exp - v_Pol - (iBatt .* r_Pol)-(R * iBatt);

%Sharpest negative derivative of the reference voltage curve:


derivs = diff(v);
for i = 1:length(derivs)
    if derivs(i) < - 10
        %Cut off points where derivative approaches negative infinity.
        %These occur at very low states of charge:
        v = v(1:i);
        %Trim the discharged capacity vector to match where we trimmed v:
        it_trim = it(1:i);
        break
    else
         it_trim = it;
    end
end


end
