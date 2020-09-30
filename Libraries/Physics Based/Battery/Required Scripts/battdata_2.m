%--------------------------------------------------------------------------
%                       Written by Peter Matt
%                     Updated by Gregory Fretti
%                              NASA GRC
%                             8/23/2019
%                            **/**/2019
%--------------------------------------------------------------------------

% FILENAME = input('Please input XLS file name, e.g. "X57_Amprius":  ','s');
% SHEET = input('Please input sheet name, e.g. "Channel_1-010":  ','s');
% 
% data = xlsread(FILENAME,SHEET);


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

for k = 2:length(current)
    if current(k) > 0 && ((current(k-1) == 0) || (current(k-1) < 0))
        idx_pos(a) = k;
        a = a +1;
    elseif current(k) < 0 && ((current(k-1) == 0) || (current(k-1) > 0))
        idx_neg(b) = k;
        b = b +1;
    elseif current(k) == 0 && ((current(k-1) ~= 0))
        idx_zero(c) = k;
        c = c+1;
    end
end
idx_zero_falling=idx_zero(1:2:end);
idx_zero_rising=idx_zero(2:2:end);
%rising and falling form the perspective of the current vs. time plot

t={};
q={};
v={};
i={};

for n = 1:length(idx_zero_rising)
    t{n}=time([idx_neg(n):(idx_zero_rising(n)-1)]);
    q{n}=dischQ([idx_neg(n):(idx_zero_rising(n)-1)]);
    v{n}=uservoltage([idx_neg(n):(idx_zero_rising(n)-1)]);
    i{n}=current([idx_neg(n):(idx_zero_rising(n)-1)]);

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
