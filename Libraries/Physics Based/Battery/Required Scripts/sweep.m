%--------------------------------------------------------------------------
%                       Written by Peter Matt
%                       Edited by Gregory Fretti
%                   (to utilize findit_singleoutput)
%                              NASA GRC
%                             8/23/2019
%                             12/12/2019
%--------------------------------------------------------------------------

function [params,majorPts,minRMSE,vFit,itReturn] = sweep(v_target,it_target,i_target,percDecr,RMSEMinIdx,RMSEMaxIdx)
% [params,majorPts,minRMSE,vFit,itReturn] = sweep(v_target,it_target,i_target,percDecr)
%
%[battery mask parameters, battery characteristics, minimum root mean
% squared error, discharged capacity vector(for plot x-axis)] =
%  sweep(voltage we want to fit to, capacity of the
%   battery we want to fit to,constant discharge current of battery data
%    we want to fit to,percentage of v_full each increment through the
%     sweep will differ by)
%
%Gregory Fretti - The Min and Max index restrict the domain we use to calc
%the RMSEs
%
%This function sweeps the points where we define the exponential and
%nominal voltage zones of a discharge curve. It first sets the exponential
%zone = to the full charge voltage and sweeps the location of the nominal
%zone from just less than this all the way to the end of the discharge
%curve. Then the location of the exponential zone moves to just less than
%it was previously and the process repeats. 
%
%For each pair of points, the corresponding battery parameters are
%calculated as well as a root mean squared error (RMSE) measurement between the
%current curve determined by the sweep and the curve we want to fit to.
%Once the sweep is complete the curve with the lowest RMSE is selected as
%the best fit, and those parameters are returned.


%Number of points along the discharge curve that the sweep will be conducted
%on:
numPts = ceil(1./percDecr);

%Initialize:
error = 1e6.*ones(numPts,numPts);
v_exp = zeros(1,numPts); %Vexp value possibilities [Greg]
v_nom = zeros(numPts,numPts); %Vnom value possibilities per Vexp [greg]

%First major points:
v_full = max(v_target);
q_full = max(it_target);

%AS a percentage of v_full, v_exp must be GREATER than v_nom:

for n = 1:numPts
    if n == 1
        %Initial sweep starts at fully charged voltage:
        v_exp(n) = v_full;
    else
        %Incrementally decrease exponential zone voltage:
        v_exp(n) = v_exp(n-1) - v_full*percDecr;
    end
    
    
    %Find index of corresponding capacity at exponential voltage zone:
    q_exp_idx = findit_singleoutput(v_exp(n),v_target);
    %Assign capacity value:
    q_exp = it_target(q_exp_idx);
    %Increment nominal voltage:
    v_nom(n,1) = v_exp(n) - v_full*percDecr;
    
    
    
        %Sweep nominal voltage from high to low for each exponential zone voltage
        %and record root mean squared error results:
        for n1 = 1:numPts

            %Sweep through v_nom from high to low:
            if n1 ~= 1
                v_nom(n,n1) = v_nom(n,n1-1) - v_full*percDecr;
            end
            %Find index of corresponding capacity at nominal voltage zone:
            q_nom_idx = findit_singleoutput(v_nom(n,n1),v_target);
            q_nom = it_target(q_nom_idx);
          
            %Get voltage and discharged capacity vectors for current points
            %in the sweep:
            [vn,itReturn] = calcParams(v_full,v_exp(n),v_nom(n,n1),q_full,q_exp,q_nom,i_target,it_target);
            %Trim the end of v_target to mach the length of vn for error
            %calculaton:
            v_targetTrim = v_target(1:length(vn));
            %Calculate RMSE for every combination of v_exp and v_nom in the
            %sweep:
            MAX = min(RMSEMaxIdx,length(vn));
            error(n,n1) = RMSE(v_targetTrim(RMSEMinIdx:MAX),vn(RMSEMinIdx:MAX));
            
            %Stop looping once V_nom is set to less than 1% of full charge
            %voltage:
            if v_nom(n,n1) < .01*v_full 
                break;
            end
        end
        loading = 100.*n/numPts;
        clc
        fprintf("STATUS --> sweep(): %.0f%%\n",loading)     
end


        %Minimum value in each column:
        [minColumns,~] = min(error);
        %Column index that minimum of the column minimums is from:
        [~,idxCol] = min(minColumns);
        %Actual minimum RMSE and row where its found.
        [minRMSE,idxRow] = min(error(:,idxCol));
        
        vExp = v_exp(1,idxRow);
        qExp_idx = findit_singleoutput(vExp,v_target);
        qExp = it_target(qExp_idx);
        
        vNom = v_nom(idxRow,idxCol);
        qNom_idx = findit_singleoutput(vNom,v_target);
        qNom = it_target(qNom_idx);
        
      
        [vFit,itReturn,params] = calcParams(v_full,vExp,vNom,q_full,qExp,qNom,i_target,it_target);
        majorPts = [v_full,vExp,vNom,q_full,qExp,qNom];
        
        
      
end