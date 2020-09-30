function idx = findit(x,vec)
%findit(x,vec)
%Find indeces of the value(s) in vec[1,n] closest to the value of x.

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

end