function RL = InductorDCR(L)

%Size of interpolated direct current resistance vector:
RL_VecSize = 1000;
%Approximate ranges of reasonable values:
L_min = 1e-9;
L_max = 1e-3;

%Minimum and maximum DCR:
RL_min = 0.0001;
RL_max = 0.315;

%Linear interpolation of DCR given a set of L values within the range of
%[L_min,L_max]
domainVec = [L_min, L_max];
rangeVec = [RL_min,RL_max];
xq = linspace(L_min, L_max, RL_VecSize);

%Range of Inductor DC Resistances (low to high):
RL_Vec = interp1(domainVec,rangeVec,xq);

i = 1;
if L > xq(i) && L < xq(RL_VecSize)
    while L > xq(i)
        i = i + 1;
    end
elseif L > xq(RL_VecSize)
    i = RL_VecSize;
end
%Maximum DCR:
RL = RL_Vec(i);
end