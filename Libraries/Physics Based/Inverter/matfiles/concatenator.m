clear

list = dir('generalmatfiles')
x=[];            % start w/ an empty array
n=0
for i=1:length(list)
if isfolder(list(i).name) == 0
    n=n+1
    x=[x; load(list(i).name)];   % read/concatenate into x
end
end
% Fsw_high = [x.Fsw_high];
% Fsw_low = [x.Fsw_low];
% I_max = [x.I_max];
% P = [x.P];
% V = [x.V];
indices = [1:n];
IGBT_Data=x;
% % save('iDesign_Fsw_high.mat','Fsw_high');
% % save('iDesign_Fsw_low.mat','Fsw_low');
% % save('iDesign_I_max.mat','I_max');
% % save('iDesign_P.mat','P');
% % save('iDesign_V.mat','V');
% % save('iDesign_indices','n');
save('IGBT_Database','IGBT_Data');