
%% Remove directories and sub-directories from path.
path(pathdef) %restore paths to paths set at startup
rmpath(genpath(pwd)) %remove current and sub-directories to path.
SP = savepath;

if SP == 0 %Ensure paths are permanently saved.
    fprintf('Paths removed and saved...\n')
else
    error('Installation Error: Paths not saved.\n')
end

lb = LibraryBrowser.LibraryBrowser2; %Simulink Library Browser
refresh(lb) %refresh Simulink Library Browser

show(lb)

clear lb SP

fprintf('EMTAT nninstalled. Please remove EMTAT directory from computer.\n')