
%% Choose Instalation Type.
IT = input('Choose EMTAT installation type:\n (1) Temporary Installation.\n (2) Permanent Installation.\n (3) Cancel Installation.\n');

%% Install Logic.
if IT == 1 %Temporary Install
    
    addpath(genpath(pwd)) %temporarily add current and sub-directories to path.
    fprintf('Paths added...\n')
    
    lb = LibraryBrowser.LibraryBrowser2; %Simulink Library Browser
    refresh(lb) %refresh Simulink Library Browser
    fprintf('Simulink Library Refreshed...\n')
    
    show(lb) %Show Simulink Library Browser
    
    fprintf('EMTAT Temporarily Installed!\n')
elseif IT == 2
    path(pathdef) %restore paths to paths set at startup
    addpath(genpath(pwd)) %temporarily add current and sub-directories to path.
    SP = savepath; %save current matlab path to pathdef.m, which is read on startup.
    
    if SP == 0 %Ensure paths are permanently saved.
        fprintf('Paths added and saved...\n')
    else
        error('Installation Error: Paths not saved.\n')
    end
    
    lb = LibraryBrowser.LibraryBrowser2; %Simulink Library Browser
    refresh(lb) %refresh Simulink Library Browser
    
    show(lb) %Show Simulink Library Browser
    
    fprintf('EMTAT Permanently Installed!\n')
elseif IT == 3
    fprintf('EMTAT Installation Canceled.\n')
end

clear IT lb SP