%--------------------------------------------------------------------------
%                       Written by Peter Matt
%                              NASA GRC
%                             8/23/2019
%--------------------------------------------------------------------------

function [rmse] = RMSE(v_target,v_calc)
%[rmse] = RMSE(v_target,v_calc)
%Calculate root mean squared error between v_target and v_calc

    rmse = sqrt(sum((v_target - v_calc).^2)./length(v_calc));

end

