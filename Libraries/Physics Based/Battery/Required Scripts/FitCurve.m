%--------------------------------------------------------------------------
%                       Written by Peter Matt
%                              NASA GRC
%                             8/23/2019
%--------------------------------------------------------------------------
clc

%Fit to a curve created in the iDesign GUI:
% load('battery_parameters.mat');
% [v_target,it_target] = voltage(500,Q_M+3,A_M+.233,B_M,K_M+.000242421,E0_M+2,R_M);
% i_target = Q_M;

%Fit to a curve from imported data:
v_target = v1;
it_target = q1;
i_target = i1;

%How much to decrease the exponential zone voltage as a percentage of the
%full charge voltage between subsequent iterations of the sweep. A lower number gets
%a more accurate result but takes longer:
percDecr1 = .001;


[params,majorPts,RMSEprimary,vFit,itReturn] = sweep(v_target,it_target,i_target,percDecr1);

Q_Fit = params(1);
A_Fit = params(2);
B_Fit = params(3);
K_Fit = params(4);
R_Fit = params(5);
E0_Fit = params(6);

%This should be greater than percDecr1 as it will take much longer to run:
percDecr2 = .1;
[vFinal,itFinal,minRMSE,Q,A,B,K,R,E0] = sweepParams(...
    Q_Fit,A_Fit,B_Fit,K_Fit,R_Fit,E0_Fit,v_target,it_target,i_target,percDecr2);




% figure()
% plot(q1,v1,"DisplayName","Fit to this");
% hold();
% plot(fit_it,fit_v,"DisplayName","Best Fit");
% legend()
clc
fprintf("STATUS --> COMPLETE\n")
paramsTable = table(Q,A,B,K,R,E0);
plot(itReturn,vFit,"DisplayName","Fit from sweep()");
hold(gca,'on');
plot(itFinal,vFinal,"DisplayName","Fit from sweepParams()");
hold(gca,'on');
plot(it_target,v_target,"DisplayName","vTarget");
legend()