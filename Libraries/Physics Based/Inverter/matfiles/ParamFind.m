%This mfile is an example that imports 7 sets of IGBT parameters


list = dir('data')
x=[];            % start w/ an empty array
n=0
for i=1:length(list)
if isfolder(list(i).name) == 0
    n=n+1
    x=[x; load(list(i).name)];   % read/concatenate into x
end
end

