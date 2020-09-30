%--------------------------------------------------------------------------
%                       Written by Peter Matt
%                              NASA GRC
%                             8/23/2019
%--------------------------------------------------------------------------

data = xlsread('X57_Amprius','Channel_1-010');
%Columns:
%2 - time
%9 - Current
%10 - Voltage
%13 - Discharge Capacity

time = [data(:,2)]';
current = [data(:,9)]';
uservoltage = [data(:,10)]';
dischQ = [data(:,13)]';


a = 1;
b = 1;
c = 1;

for i = 2:length(current)
    if current(i) > 0 && ((current(i-1) == 0) || (current(i-1) < 0))
        idx_pos(a) = i;
        a = a +1;
    elseif current(i) < 0 && ((current(i-1) == 0) || (current(i-1) > 0))
        idx_neg(b) = i;
        b = b +1;
    elseif current(i) == 0 && ((current(i-1) ~= 0))
        idx_zero(c) = i;
        c = c+1;
    end
end
t1 = time([idx_neg(1):(idx_zero(2)-1)]);
q1 = dischQ([idx_neg(1):(idx_zero(2)-1)]);
v1 = uservoltage([idx_neg(1):(idx_zero(2)-1)]);
i1 = current([idx_neg(1):(idx_zero(2)-1)]);

plot(q1,v1);
axis([0,3.7, 2.8, 4.4]);

%Redefine time vector to start from 0:
step = zeros(1,length(t1)-1);
t0 = zeros(1,length(t1));
for idx = 1:length(t1)
    if idx+1 < length(t1)
        step(idx) = t1(idx+1) - t1(idx);
        t0(idx+1) = t0(idx) + step(idx);
    end
end
step(length(t1)) = t1(length(t1))-t1(length(t1)-1);
t0(length(t1)) = t0(length(t1)-1)+step(length(t1));
figure()
plot(t0,v1)
xlabel('time (sec)');
ylabel('voltage (volts)');
title('User Discharge Data');

% vfull = max(v1);
% vexp = v1(findit(max(v1)-0.15*max(v1),v1));
% vnom = v1(findit(max(v1)-0.25*max(v1),v1));
% qfull = max(q1);
% %Find index of qexp:
% qexp_idx = findit(vexp,v1);
% qnom_idx = findit(vnom,v1);
% %Assign qexp and qnom:
% qexp = q1(qexp_idx);
% qnom = q1(qnom_idx);

% data = table(vfull,vexp,vnom,qfull,qexp,qnom);
% disp(data)

disp('Use v1 for voltage, q1 for capacity, i1 for current, and t1 for time')
