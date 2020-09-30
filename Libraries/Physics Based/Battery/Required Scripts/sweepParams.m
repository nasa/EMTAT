%--------------------------------------------------------------------------
%                       Written by Peter Matt
%                              NASA GRC
%                             8/23/2019
%--------------------------------------------------------------------------

function [vFinal,itFinal,minRMSE,Q_Fit,A,B,K,R,E0] = sweepParams(Q_Fit,A_Fit,B_Fit,K_Fit,R_Fit,E0_Fit,v_target,it_target,i_target,percDecr,RMSEMinIdx,RMSEMaxIdx)
%Same idea as sweep() but this one sweeps through each of the battery
%parameters instead of sweeping the locations of vexp and vnom on the
%discharge curve

A_Sweep = Param_Sweep(A_Fit,percDecr);
B_Sweep = Param_Sweep(B_Fit,percDecr);
K_Sweep = Param_Sweep(K_Fit,percDecr);
R_Sweep = Param_Sweep(R_Fit,percDecr);
E0_Sweep = Param_Sweep(E0_Fit,percDecr);



rmse = getRMSEs(length(v_target),Q_Fit,A_Sweep,B_Sweep,K_Sweep,R_Sweep,E0_Sweep,v_target,i_target,RMSEMinIdx,RMSEMaxIdx);
assignin('base','rmse',rmse);
[minRMSE,I] = min(rmse,[],[1:6],'linear');
[D1,D2,D3,D4,D5] = ind2sub(size(rmse),I);
A = A_Sweep(D1);
B = B_Sweep(D2);
K = K_Sweep(D3);
R = R_Sweep(D4);
E0 = E0_Sweep(D5);

[vFinal,itFinal] = voltage(length(v_target),Q_Fit,A,B,K,E0,R,i_target);  
end

function Param_Sw = Param_Sweep(Param_Fit,percDecr)
numPts = ceil((Param_Fit)./(Param_Fit .* percDecr));
Param_Sw = zeros(1,numPts);
Param_Sw(1) = Param_Fit;
Param_Sw(2) = Param_Fit + (Param_Fit .* percDecr);
Param_Sw(3) = Param_Fit - (Param_Fit .* percDecr);
for n = 4:numPts
    Param_Sw(n) = Param_Sw(n-2) + (Param_Fit .* percDecr).*(-1).^n;
end

end


function rmse = getRMSEs(len,Q,A,B,K,R,E0,v_target,i_target,RMSEMinIdx,RMSEMaxIdx)
dimLength = length(A);
rmse = ones(dimLength,dimLength,dimLength,dimLength,dimLength);
        for a = 1:length(A)
            loading = 100.*a/length(A);
            clc
            fprintf("STATUS --> sweepParams(): %.0f%%\n",loading) 
            for b = 1:length(B)
                for k = 1:length(K)
                    for r = 1:length(R)
                        for e = 1:length(E0)
                        [v,~] = voltage(len,Q,A(a),B(b),K(k),E0(e),R(r),i_target);  
                        v_targetTrim = v_target(1:length(v));
                        MAX = min(RMSEMaxIdx,length(v));
                        rmse(a,b,k,r,e) = RMSE(v_targetTrim(RMSEMinIdx:MAX),v(RMSEMinIdx:MAX));
                        end
                    end
                end
            end
        end

end