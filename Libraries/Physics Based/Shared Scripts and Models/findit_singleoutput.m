function idx = findit_singleoutput(x,vec)
%findit_singleoutput(x,vec)
%Find indeces of the value(s) in vec[1,n] closest to the value of x.
%It checks to make sure it has selected the nearest value unlike findit,
%and if it is the same, it chooses the smaller index.

gotit = false;
a = 1;
b = 1;
%First check for x itself:
for q = 1:length(vec)
    if vec(q) == x
        idx(a) = q;
        a = a+1;
        gotit = true;
    end
end

if ~gotit
%Initial closest:
close = abs(x - vec(1));
idx(1) = 1;
        for i = 2:length(vec)
            %Distance between target and found:
            dist = abs(x - vec(i));
            if dist < close
                close = dist;
                idx(b) = i;
            elseif dist == close
                b = b+1;
                idx(b) = i;
            end
        end
end

%I (Gregory) encountered a bug with a dataset with two identical values in
%a row (unsure if that was the root cause)
%where findit would return two values, one of which was completely wrong
%Thus, I added this check.

if length(idx) ~= 1
    k = length(idx);
    for j = 1:k %j is indices OF the indices...
        dists(j) = abs(x - vec(idx(j)));
    end
    [min_j,ind_j_min] = min(dists);%min also guarantees one output if
    %there are two identical distances

    idx = idx(ind_j_min);
end
    



end