classdef Battery_Discharge_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        TabGroup                        matlab.ui.container.TabGroup
        CalculateParametersfromDischargeCurveTab  matlab.ui.container.Tab
        TextArea                        matlab.ui.control.TextArea
        UserBatteryCharacteristicsPanel  matlab.ui.container.Panel
        V_fullEditFieldLabel            matlab.ui.control.Label
        V_fullEditField                 matlab.ui.control.NumericEditField
        V_expEditFieldLabel             matlab.ui.control.Label
        V_expEditField                  matlab.ui.control.NumericEditField
        V_nomEditFieldLabel             matlab.ui.control.Label
        V_nomEditField                  matlab.ui.control.NumericEditField
        Q_fullEditFieldLabel            matlab.ui.control.Label
        Q_fullEditField                 matlab.ui.control.NumericEditField
        Q_expEditField_2Label           matlab.ui.control.Label
        Q_expEditField                  matlab.ui.control.NumericEditField
        Q_nomEditField_2Label           matlab.ui.control.Label
        Q_nomEditField                  matlab.ui.control.NumericEditField
        EfficiencyEditFieldLabel        matlab.ui.control.Label
        EfficiencyEditField             matlab.ui.control.NumericEditField
        OpenReferenceImageButton        matlab.ui.control.Button
        ApplytoPlotsButton              matlab.ui.control.Button
        MinimizeRMSEButton              matlab.ui.control.Button
        RMSE_ErrorMessage               matlab.ui.control.TextArea
        UseOptimizetabratherthanRMSEIfOptimizefailstryRMSELabel  matlab.ui.control.Label
        ModelParametersPanel            matlab.ui.container.Panel
        Q_MEditField_2Label             matlab.ui.control.Label
        Q_MEditField_2                  matlab.ui.control.NumericEditField
        K_MEditField_2Label             matlab.ui.control.Label
        K_MEditField_2                  matlab.ui.control.NumericEditField
        A_MEditField_2Label             matlab.ui.control.Label
        A_MEditField_2                  matlab.ui.control.NumericEditField
        B_MEditField_2Label             matlab.ui.control.Label
        B_MEditField_2                  matlab.ui.control.NumericEditField
        R_MEditField_2Label             matlab.ui.control.Label
        R_MEditField_2                  matlab.ui.control.NumericEditField
        E0_MEditField_2Label            matlab.ui.control.Label
        E0_MEditField_2                 matlab.ui.control.NumericEditField
        DischargeDataPanel              matlab.ui.container.Panel
        AvgCurrentEditFieldLabel        matlab.ui.control.Label
        AvgCurrentEditField             matlab.ui.control.NumericEditField
        CRateEditFieldLabel             matlab.ui.control.Label
        CRateEditField                  matlab.ui.control.NumericEditField
        BaseWorkspaceVariablesPanel     matlab.ui.container.Panel
        VoltagevoltsLabel               matlab.ui.control.Label
        voltageBWS                      matlab.ui.control.EditField
        CapacityAhLabel                 matlab.ui.control.Label
        capacityBWS                     matlab.ui.control.EditField
        RetrieveButton                  matlab.ui.control.Button
        V_expLabel                      matlab.ui.control.Label
        V_exp_percent                   matlab.ui.control.NumericEditField
        V_nomLabel                      matlab.ui.control.Label
        V_nom_percent                   matlab.ui.control.NumericEditField
        TimesecLabel                    matlab.ui.control.Label
        timeBWS                         matlab.ui.control.EditField
        DischargeCurrentALabel          matlab.ui.control.Label
        currentBWS                      matlab.ui.control.EditField
        TextArea_2                      matlab.ui.control.TextArea
        D3Ax                            matlab.ui.control.UIAxes
        ControlsPanel_3                 matlab.ui.container.Panel
        V_expKnobLabel                  matlab.ui.control.Label
        V_expKnob                       matlab.ui.control.Knob
        V_nomKnobLabel                  matlab.ui.control.Label
        V_nomKnob                       matlab.ui.control.Knob
        XAxisPanel_2                    matlab.ui.container.Panel
        D3AxSw                          matlab.ui.control.RockerSwitch
        TruncateDataPointsPanel         matlab.ui.container.Panel
        MinSOCEditFieldLabel            matlab.ui.control.Label
        MinSOCEditField                 matlab.ui.control.NumericEditField
        MaxSOCEditFieldLabel            matlab.ui.control.Label
        MaxSOCEditField                 matlab.ui.control.NumericEditField
        TruncateButton                  matlab.ui.control.Button
        PercDecrSettingsPanel           matlab.ui.container.Panel
        NOTEPercDecr2shouldbegreaterthanPercDecr1Label_3  matlab.ui.control.Label
        PercDecr1EditFieldLabel         matlab.ui.control.Label
        PercDecr1EditField              matlab.ui.control.NumericEditField
        PercDecr2EditFieldLabel         matlab.ui.control.Label
        PercDecr2EditField              matlab.ui.control.NumericEditField
        RMSEDomainsettingsPanel         matlab.ui.container.Panel
        NOTEPercDecr2shouldbegreaterthanPercDecr1Label_4  matlab.ui.control.Label
        RMSEMinDomainEditFieldLabel     matlab.ui.control.Label
        RMSEMinDomainEditField          matlab.ui.control.NumericEditField
        RMSEMaxDomainEditFieldLabel     matlab.ui.control.Label
        RMSEMaxDomainEditField          matlab.ui.control.NumericEditField
        ElectricalCharacteristicsTab    matlab.ui.container.Tab
        ParameterValuesPanel            matlab.ui.container.Panel
        Q_MEditFieldLabel               matlab.ui.control.Label
        Q_MEditField                    matlab.ui.control.NumericEditField
        A_MEditFieldLabel               matlab.ui.control.Label
        A_MEditField                    matlab.ui.control.NumericEditField
        B_MEditFieldLabel               matlab.ui.control.Label
        B_MEditField                    matlab.ui.control.NumericEditField
        R_MEditFieldLabel               matlab.ui.control.Label
        R_MEditField                    matlab.ui.control.NumericEditField
        K_MEditFieldLabel               matlab.ui.control.Label
        K_MEditField                    matlab.ui.control.NumericEditField
        E0_MEditFieldLabel              matlab.ui.control.Label
        E0_MEditField                   matlab.ui.control.NumericEditField
        DischargePlot                   matlab.ui.control.UIAxes
        ControlsPanel                   matlab.ui.container.Panel
        PolarizationResistanceConstantK_MKnobLabel  matlab.ui.control.Label
        PolarizationResistanceConstantK_MKnob  matlab.ui.control.Knob
        BatteryInternalResistanceR_MKnob  matlab.ui.control.Knob
        BatteryInternalResistanceR_MKnobLabel  matlab.ui.control.Label
        BatteryCapacityQ_MKnobLabel     matlab.ui.control.Label
        BatteryCapacityQ_MKnob          matlab.ui.control.Knob
        ExponentialZoneAmplitudeA_MKnobLabel  matlab.ui.control.Label
        ExponentialZoneAmplitudeA_MKnob  matlab.ui.control.Knob
        ExponentialZoneTimeConstantInverseB_MKnobLabel  matlab.ui.control.Label
        ExponentialZoneTimeConstantInverseB_MKnob  matlab.ui.control.Knob
        BatteryConstantVoltageE0_MLabel  matlab.ui.control.Label
        BatteryConstantVoltageE0_MKnob  matlab.ui.control.Knob
        Panel                           matlab.ui.container.Panel
        InitialSOCLabel                 matlab.ui.control.Label
        InitialSOCSlider                matlab.ui.control.Slider
        InitialSOC_EditField            matlab.ui.control.NumericEditField
        Panel_2                         matlab.ui.container.Panel
        MinimumSOCLimitSliderLabel      matlab.ui.control.Label
        MinimumSOCLimitSlider           matlab.ui.control.Slider
        MinSOC_EditField                matlab.ui.control.NumericEditField
        XAxisPanel                      matlab.ui.container.Panel
        XAxisSwitch                     matlab.ui.control.RockerSwitch
        SaveElectricalandThermalParametersPanel  matlab.ui.container.Panel
        SavetoFileButton                matlab.ui.control.Button
        OptimizationTab                 matlab.ui.container.Tab
        ImportDatafromElectricalCharacteristicsButton  matlab.ui.control.Button
        OptPlot                         matlab.ui.control.UIAxes
        ParameterValuesPanel_Opt        matlab.ui.container.Panel
        Q_MEditField_3Label             matlab.ui.control.Label
        Q_MEditField_Opt                matlab.ui.control.NumericEditField
        A_MEditField_3Label             matlab.ui.control.Label
        A_MEditField_Opt                matlab.ui.control.NumericEditField
        B_MEditField_3Label             matlab.ui.control.Label
        B_MEditField_Opt                matlab.ui.control.NumericEditField
        R_MEditField_3Label             matlab.ui.control.Label
        R_MEditField_Opt                matlab.ui.control.NumericEditField
        K_MEditField_3Label             matlab.ui.control.Label
        K_MEditField_Opt                matlab.ui.control.NumericEditField
        E0_MEditField_3Label            matlab.ui.control.Label
        E0_MEditField_Opt               matlab.ui.control.NumericEditField
        InitialSOC_EditField_Opt        matlab.ui.control.NumericEditField
        StartingSOCLabel                matlab.ui.control.Label
        MinSOC_EditField_Opt            matlab.ui.control.NumericEditField
        MinSOCLimitLabel                matlab.ui.control.Label
        PlotUserDataButton              matlab.ui.control.Button
        ToedituseElectricalCharacteristicstabthenimportLabel  matlab.ui.control.Label
        FindRegressionButton            matlab.ui.control.Button
        PleaseeditonlyintheElectricalCharacteristicstabLabel  matlab.ui.control.Label
        StatisticalDisplayPanel         matlab.ui.container.Panel
        SSE_EditField                   matlab.ui.control.NumericEditField
        SSELabel                        matlab.ui.control.Label
        R2_EditField                    matlab.ui.control.NumericEditField
        R2Label                         matlab.ui.control.Label
        ClearAxesButton                 matlab.ui.control.Button
        ExportParameterstoElectricalCharacteristicsButton  matlab.ui.control.Button
        MassTab                         matlab.ui.container.Tab
        CalculateapproxmassButton       matlab.ui.control.Button
        MasskgEditFieldLabel            matlab.ui.control.Label
        MasskgEditField                 matlab.ui.control.NumericEditField
        ZeroCancelMassButton            matlab.ui.control.Button
        PleaseeditonlyintheElectricalCharacteristicstabLabel_2  matlab.ui.control.Label
        CalculateapproxmassButton_2     matlab.ui.control.Button
        CRateTab                        matlab.ui.container.Tab
        CRateTextArea                   matlab.ui.control.TextArea
        DischargePlot_2                 matlab.ui.control.UIAxes
        CRatePanel                      matlab.ui.container.Panel
        ConstantDischargeCurrentEditField_2  matlab.ui.control.NumericEditField
        ConstantDischargeCurrentEditField_3  matlab.ui.control.NumericEditField
        ConstantDischargeCurrentEditField_4  matlab.ui.control.NumericEditField
        ConstantDischargeCurrentEditField_5  matlab.ui.control.NumericEditField
        ConstantDischargeCurrentEditField_6  matlab.ui.control.NumericEditField
        ConstantDischargeCurrentEditField_7  matlab.ui.control.NumericEditField
        ConstantDischargeCurrentEditField_8  matlab.ui.control.NumericEditField
        AveragePowerOutputEditField_2   matlab.ui.control.NumericEditField
        AveragePowerOutputEditField_3   matlab.ui.control.NumericEditField
        AveragePowerOutputEditField_4   matlab.ui.control.NumericEditField
        AveragePowerOutputEditField_5   matlab.ui.control.NumericEditField
        AveragePowerOutputEditField_6   matlab.ui.control.NumericEditField
        AveragePowerOutputEditField_7   matlab.ui.control.NumericEditField
        AveragePowerOutputEditField_8   matlab.ui.control.NumericEditField
        C1EditFieldLabel                matlab.ui.control.Label
        C1EditField                     matlab.ui.control.NumericEditField
        C2EditFieldLabel                matlab.ui.control.Label
        C2EditField                     matlab.ui.control.NumericEditField
        C3EditFieldLabel                matlab.ui.control.Label
        C3EditField                     matlab.ui.control.NumericEditField
        C4EditFieldLabel                matlab.ui.control.Label
        C4EditField                     matlab.ui.control.NumericEditField
        C5EditFieldLabel                matlab.ui.control.Label
        C5EditField                     matlab.ui.control.NumericEditField
        C6EditFieldLabel                matlab.ui.control.Label
        C6EditField                     matlab.ui.control.NumericEditField
        C7EditFieldLabel                matlab.ui.control.Label
        C7EditField                     matlab.ui.control.NumericEditField
        C8EditFieldLabel                matlab.ui.control.Label
        C8EditField                     matlab.ui.control.NumericEditField
        ConstantDischargeCurrentAEditFieldLabel  matlab.ui.control.Label
        ConstantDischargeCurrentEditField_1  matlab.ui.control.NumericEditField
        AveragePowerOutputWEditFieldLabel  matlab.ui.control.Label
        AveragePowerOutputEditField_1   matlab.ui.control.NumericEditField
        ControlsPanel_2                 matlab.ui.container.Panel
        XAxisSwitch_2Label              matlab.ui.control.Label
        XAxisSwitch_2                   matlab.ui.control.RockerSwitch
        AddRateButton                   matlab.ui.control.Button
        RemoveRateButton                matlab.ui.control.Button
        ExporttoBaseWorkspaceTab        matlab.ui.container.Tab
        ElectricalCharacteristicsPanel  matlab.ui.container.Panel
        Q_MButton                       matlab.ui.control.Button
        A_MButton                       matlab.ui.control.Button
        B_MButton                       matlab.ui.control.Button
        R_MButton                       matlab.ui.control.Button
        K_MButton                       matlab.ui.control.Button
        E0_MButton                      matlab.ui.control.Button
        MassPanel                       matlab.ui.container.Panel
        ApproxMassButton                matlab.ui.control.Button
        CalculateParametersfromDischargeCurvePanel  matlab.ui.container.Panel
        V_fullButton                    matlab.ui.control.Button
        V_expButton                     matlab.ui.control.Button
        V_nomButton                     matlab.ui.control.Button
        Q_fullButton                    matlab.ui.control.Button
        Q_expButton                     matlab.ui.control.Button
        Q_nomButton                     matlab.ui.control.Button
        EfficiencyButton                matlab.ui.control.Button
        OptimizationPanel               matlab.ui.container.Panel
        SSEButton                       matlab.ui.control.Button
        R2Button                        matlab.ui.control.Button
        ExportAllButton                 matlab.ui.control.Button
        ThermalCharacteristicsTab       matlab.ui.container.Tab
        Temp_v_Time                     matlab.ui.control.UIAxes
        Temp_v_Voltage                  matlab.ui.control.UIAxes
        R_mod                           matlab.ui.control.UIAxes
        Q_Mod                           matlab.ui.control.UIAxes
        Panel_3                         matlab.ui.container.Panel
        LumpedHeatCapacityatSurfaceJKCs_MEditFieldLabel  matlab.ui.control.Label
        Cs_M                            matlab.ui.control.NumericEditField
        InitialSurfaceTemperatureTs_0_MEditField_3Label  matlab.ui.control.Label
        Ru_M                            matlab.ui.control.NumericEditField
        InitialSurfaceTemperatureCTs_0_MEditFieldLabel  matlab.ui.control.Label
        Ts_0_M                          matlab.ui.control.NumericEditField
        Panel_4                         matlab.ui.container.Panel
        Cj_M                            matlab.ui.control.NumericEditField
        LumpedHeatCapacityatJunctionJKCj_MLabel  matlab.ui.control.Label
        Rj_M                            matlab.ui.control.NumericEditField
        ConductionResistanceBetweenJunctionandSurfaceRj_MLabel  matlab.ui.control.Label
        InitialJunctionTemperatureCTj_0_MEditFieldLabel  matlab.ui.control.Label
        Tj_0_M                          matlab.ui.control.NumericEditField
        AmbientTemperatureCEditFieldLabel  matlab.ui.control.Label
        AmbTemp                         matlab.ui.control.NumericEditField
        Panel_5                         matlab.ui.container.Panel
        SimulateandPlotButton           matlab.ui.control.Button
    end

    %--------------------------------------------------------------------------
    %                       Written by Peter Matt
    %                              NASA GRC
    %                             8/23/2019
    %--------------------------------------------------------------------------
    
    
    %Dependencies:
    % Ideal_Discharge.PNG --- Image for ideal discharge curve reference
    % findit.m --- custom function file used in this app
    % findit_singleoutput.m --- custom variant of findit.m that
    % guarantees a single output
    % sweep.m --- custom function file used in this app
    % sweepParams.m --- custom function file used in this app
    % RMSE.m --- custom function file used in this app
    % voltage.m --- custom function file used in this app
    % calcParams.m --- custom function file used in this app
    
    
    %Note: During development, the tabs have been rearranged
    %
    %When tabs are numbered, they are numbered as follows:
    %
    %Tab 1: Electrical Characteristics
    %Tab 2: C Rate
    %Tab 3: Thermal Characteristics
    %Tab 4: Calculate Parameters from Discharge Curve
    %Tab 5: (not referenced in commments) Optimization
    %Tab 6: (not referenced in commments) Mass
    
    
    
    properties (Access = private)
        
        numRates = 1; % Number of C rates selected by user to be plotted. Corresponds to total number of plots
        constCurrent = zeros(1,8);   % Constant discharge current as determined by C rate and capacity
        avgPower = zeros(1,8);   % Average power output
        t_sec;  % Time steps
        legends = strings(1,8);
        x_ax = "C"; % X-axis display setting initialized to show capacity discharged
        xstr %X-axis label shared between plots
        xax % x-axis range shared between plots
        v_Batt %Voltage
        q; % user's discharge info from base workspace
        v; % user's voltage info from base workspace
        i; % User's discharge current info from base workspace
        t; % User's time vector from base workspace adjusted to have same start time as the time vector
        % used below in our calculations with time steps equal to the
        % corresponding steps in user's data.
        applyPlots = false % Flag signalling if apply to plots button has been pressed
        batt_mass = 0 %Initialize to zero
        RMSE_Truncate_Min_Idx=0
        RMSE_Truncate_Max_Idx=100
        
        % Description
    end
    
    
    methods (Access = private)
        
        function  updateCurve(app)
            %Calculates discharge curve for plots on tabs 1, 2, and 4 and plots
            %them accordingly.
            
            %Turn off hold on the 3 axes so their plots can be overwritten:
            hold(app.DischargePlot,'off');
            hold(app.DischargePlot_2,'off');
            hold(app.D3Ax,'off');
            
            
            % Battery capacity (Ah):
            Q_M = app.BatteryCapacityQ_MKnob.Value;
            % Discharge Rate (1/hours):
            C = zeros(1,app.numRates);
            % C1 is always 'on' so at least one curve is plotted:
            C(1) = app.C1EditField.Value;
            %Enable parameters of all of the C-Rate edit fields:
            Rates = {app.C1EditField.Enable,app.C2EditField.Enable,app.C3EditField.Enable,app.C4EditField.Enable...
                app.C5EditField.Enable,app.C6EditField.Enable,app.C7EditField.Enable,app.C8EditField.Enable};
            % Objects pertaining to add rate or remove rate options under the C
            % -Rate tab:
            rateOBJ = [app.C1EditField,app.C2EditField,app.C3EditField,app.C4EditField...
                app.C5EditField,app.C6EditField,app.C7EditField,app.C8EditField];
            
            %Pulls the rate value from all of the enabled C_rate Edit fields to
            %use for calculating discharge current:
            for y = 2:app.numRates
                if strcmp(Rates(y),'on')
                    C(y) = rateOBJ(y).Value;
                elseif strcmp(Rates(y),'off')
                    break
                end
            end
            
            %Initial state of charge (%):
            SOC_init = app.InitialSOCSlider.Value;
            %Exponential zone amplitude (V):
            A_M = app.ExponentialZoneAmplitudeA_MKnob.Value;
            %Exponential zone time constant inverse (Ah^-1):
            B_M = app.ExponentialZoneTimeConstantInverseB_MKnob.Value;
            %Polarization Resistance (Ohm):
            K_M = app.PolarizationResistanceConstantK_MKnob.Value;
            %Battery Constant Voltage (V):
            E0_M = app.BatteryConstantVoltageE0_MKnob.Value;
            %Battery Internal Resistance (Ohms):
            R_M = app.BatteryInternalResistanceR_MKnob.Value;
            %Minimum SOC (%) to display. Going too low results in discontinuities in
            %results:
            SOC_min = app.MinimumSOCLimitSlider.Value;
            
            %Time for discharge (hrs):
            tmax = [1./C];
            
            %Array of Battery Currents (A). One for each Enabled C-Rate:
            if isempty(app.currentBWS.Value)
                iBatt(1) = Q_M * C(1);
            else
                iBatt(1) = app.i;
            end
            iBatt(2:length(C)) = Q_M .* C(2:length(C));
            
            
            %Initialize:
            app.t_sec = zeros(app.numRates,10000);
            
            
            for n = 1:length(C)
                %Time array (sec) 150 ms time step initially:
                app.t_sec(n,:) = linspace(0,(tmax(n).*(60^2)),10000);
                
                %Battery charge consumed during discharge (Ah):
                it_base = linspace(0,Q_M,length(app.t_sec(n,:)));
                %Actual charge consumed, taking into account initial SOC and it_base (Ah):
                it = it_base + (100-SOC_init)./100.*Q_M;
                %State of Charge (%):
                SOC = 100-((it./Q_M).*100);
                %Dimensions of SOC:
                d_SOC = size(SOC);
                %Find where SOC_min occurs in SOC array:
                for minIdx = 1:d_SOC(2)
                    if SOC(minIdx) <= SOC_min
                        break
                    end
                end
                %Cut off all elements in it array beyond the minIdx found above so that no data from
                %battery discharge below SOC_min is considered:
                it_trim = [it([1:minIdx])];
                %dimensions of it:
                dim_it = length(it_trim);
                %Recompute time array to match size of it:
                t_sec_trim = linspace(0,tmax(n)*60^2,dim_it);
                
                
                %-----------------------------------------------------------------
                % When battery model is updated to include battery types other
                % than Li-Ion their equations will need to be added in here
                %-----------------------------------------------------------------
                
                % Exponential Zone Voltage of Li_Ion (V):
                v_Exp = A_M .* exp(-1 .* B_M .* (it_trim));
                % Polarization Resistance Discharging (Ohms):
                r_Pol = K_M .* Q_M./(Q_M-it_trim);
                % Polarization Voltage:
                v_Pol = K_M .* it_trim .* Q_M./(Q_M-it_trim); %Note - v_Pol and r_Pol were the same before, that was wrong.
                
                
                % Battery Voltage Over One Complete Discharge:
                app.v_Batt = E0_M + v_Exp - v_Pol - (iBatt(n) .* r_Pol)-(R_M .* iBatt(n));
                
                % For C Rate tab displays:
                %    Constant discharge current
                app.constCurrent(n) = iBatt(n);
                %    Average power during discharge
                app.avgPower(n) = sum([app.v_Batt .* iBatt(n)])/(length(t_sec_trim));
                
                % X-Axis Label. Can be capacity or time. Controlled by X-Axis
                % switches:
                if strcmp(app.x_ax,'C')
                    app.xax = it_trim;
                    app.xstr = 'Discharged Capacity (Ah)';
                else
                    app.xax = t_sec_trim;
                    app.xstr = 'Time (Sec)';
                end
                
                %If app is the only input argument (indicates not being called by Minimize_MSE())
                % call Plot(app,n) function. Otherwise do not plot.
                
                Plot(app,n)
            end%for n = 1:length(C)
            
        end%function
        
        
        function Plot(app,n)
            %****************************************************************************************
            %*********************************** Plottification *************************************
            %****************************************************************************************
            %Scatter plot color scheme and bubble size:
            colorq = "red";
            colort = "red";
            scatSize = 5;
            %Fill legends as needed (C1, C2, C3, etc.):
            app.legends(n) = strcat('C',num2str(n));
            
            
            %-------------------------------- Plot on tab 1 ----------------------------
            if app.applyPlots && n == 1
                if strcmp(app.x_ax,'C')
                    scatter(app.DischargePlot,app.q,app.v,scatSize,colorq)
                    legend(app.DischargePlot,'User Data')
                else
                    scatter(app.DischargePlot,app.t,app.v,scatSize,colort)
                    legend(app.DischargePlot,'User Data')
                end
                hold(app.DischargePlot,'on')
            end
            
            %app.xax is either time or discharged capacity:
            plot(app.DischargePlot,app.xax,app.v_Batt,'DisplayName',app.legends(n));
            xlabel(app.DischargePlot,app.xstr);
            legend(app.DischargePlot);
            hold(app.DischargePlot,'on')
            
            %-------------------------------- Plot on tab 2 ----------------------------
            if app.applyPlots && n == 1
                if strcmp(app.x_ax,'C')
                    scatter(app.DischargePlot_2,app.q,app.v,scatSize,colorq)
                    legend(app.DischargePlot_2,'User Data')
                else
                    scatter(app.DischargePlot_2,app.t,app.v,scatSize,colort)
                    legend(app.DischargePlot_2,'User Data')
                end
                hold(app.DischargePlot_2,'on')
            end
            
            %app.xax is either time or discharged capacity:
            plot(app.DischargePlot_2,app.xax,app.v_Batt,'DisplayName',app.legends(n));
            xlabel(app.DischargePlot_2,app.xstr);
            legend(app.DischargePlot_2);
            hold(app.DischargePlot_2,'on')
            
            %-------------------------------- Plot on tab 4 ----------------------------
            
            if app.applyPlots && n == 1
                if strcmp(app.x_ax,'C') && ~isempty(app.q) && ~isempty(app.v)
                    scatter(app.D3Ax,app.q,app.v,scatSize,colorq)
                    legend(app.D3Ax,'User Data')
                elseif ~isempty(app.t) && ~isempty(app.v)
                    scatter(app.D3Ax,app.t,app.v,scatSize,colort)
                    legend(app.D3Ax,'User Data')
                end
                hold(app.D3Ax,'on')
                %app.xax is either time or discharged capacity:
                plot(app.D3Ax,app.xax,app.v_Batt,'DisplayName',app.legends(n));
                xlabel(app.D3Ax,app.xstr);
                legend(app.D3Ax);
            else
                plot(app.D3Ax,app.xax,app.v_Batt,'DisplayName',app.legends(n));
                xlabel(app.D3Ax,app.xstr);
                legend(app.D3Ax);
                hold(app.D3Ax,'on')
            end
            %-----------------------------------------------------------------------------
        end
        
        
        
        
        function cRate_display(app)
            %Must be called after call to updateCurve(app) to work correctly.
            %This function updates the constant current and average power displays on
            %tab 2.
            
            %Constant current at each C Rate:
            app.ConstantDischargeCurrentEditField_1.Value = app.constCurrent(1);
            app.ConstantDischargeCurrentEditField_2.Value = app.constCurrent(2);
            app.ConstantDischargeCurrentEditField_3.Value = app.constCurrent(3);
            app.ConstantDischargeCurrentEditField_4.Value = app.constCurrent(4);
            app.ConstantDischargeCurrentEditField_5.Value = app.constCurrent(5);
            app.ConstantDischargeCurrentEditField_6.Value = app.constCurrent(6);
            app.ConstantDischargeCurrentEditField_7.Value = app.constCurrent(7);
            app.ConstantDischargeCurrentEditField_8.Value = app.constCurrent(8);
            %Average power output at each C Rate:
            app.AveragePowerOutputEditField_1.Value = app.avgPower(1);
            app.AveragePowerOutputEditField_2.Value = app.avgPower(2);
            app.AveragePowerOutputEditField_3.Value = app.avgPower(3);
            app.AveragePowerOutputEditField_4.Value = app.avgPower(4);
            app.AveragePowerOutputEditField_5.Value = app.avgPower(5);
            app.AveragePowerOutputEditField_6.Value = app.avgPower(6);
            app.AveragePowerOutputEditField_7.Value = app.avgPower(7);
            app.AveragePowerOutputEditField_8.Value = app.avgPower(8);
        end
        
        function SOC_windows(app)
            %Called whenever the SOC sliders change. Reflects their value in the
            %corresponding Edit Fields
            app.InitialSOC_EditField.Value = app.InitialSOCSlider.Value;
            app.MinSOC_EditField.Value = app.MinimumSOCLimitSlider.Value;
        end
        
        function determine_Param(app)
            % Determines the model parameters needed for the EMTAT battery block to
            % fuction representatively of imported battery discharge data provided by a user:
            
            % Equations from Pg 4 of NREL/CP-5D00-67809:
            % Raszmann, Emma, Baker, Kyri, Shi, Ying, and Christensen, Dane.
            % Modeling Stationary Lithium-Ion Batteries for Optimization and Predictive Control: Preprint.
            % United States: N. p., 2017. Web. doi:10.1109/PECI.2017.7935755.
            
            if ~isempty(app.v) && ~isempty(app.q)
                
                %Use user discharge curve to calculate battery characteristics:
                vfull = max(app.v);
                %findit() is a user defined function that must be included with this app
                %package and must be on the MATLAB path:
                vexp = app.v(findit_singleoutput(vfull-app.V_exp_percent.Value/100*vfull,app.v));
                vnom = app.v(findit_singleoutput(vfull-app.V_nom_percent.Value/100*vfull,app.v));
                
                qfull = max(app.q);
                %Find index of qexp and qnom:
                qexp_idx = findit_singleoutput(vexp,app.v);
                qnom_idx = findit_singleoutput(vnom,app.v);
                %Assign qexp and qnom:
                qexp = app.q(qexp_idx);
                qnom = app.q(qnom_idx);
                
                %Assign values to the battery characteristics edit fields:
                app.V_fullEditField.Value = vfull;
                app.V_expEditField.Value = vexp;
                app.V_nomEditField.Value = vnom;
                app.Q_fullEditField.Value = qfull;
                app.Q_expEditField.Value = qexp;
                app.Q_nomEditField.Value = qnom;
                
                Vf = app.V_fullEditField.Value;
                Ve = app.V_expEditField.Value;
                Vn = app.V_nomEditField.Value;
                Qf = app.Q_fullEditField.Value;
                Qe = app.Q_expEditField.Value;
                Qn = app.Q_nomEditField.Value;
                eff = (app.EfficiencyEditField.Value)/100;
            else
                %Take battery characteristics directly from edit fields:
                Vf = app.V_fullEditField.Value;
                Ve = app.V_expEditField.Value;
                Vn = app.V_nomEditField.Value;
                Qf = app.Q_fullEditField.Value;
                Qe = app.Q_expEditField.Value;
                Qn = app.Q_nomEditField.Value;
                eff = (app.EfficiencyEditField.Value)/100;
            end
            if isempty(app.currentBWS.Value)
                % If there is no current data from the user's base
                % workspace set dischare current for the following calculations
                % equal to the capacity rating (ie. a C-Rate of 1):
                i_c = app.Q_fullEditField.Value;
            else
                % If there is current data use that:
                i_c = app.i;
            end
            
            % Equations from Pg 4 of NREL/CP-5D00-67809:
            app.AvgCurrentEditField.Value = i_c;
            A = Vf-Ve;
            B = 2.3/Qe;
            K = 0.065*(Vf-Vn+A*(exp(-B*Qn)-1))*(Qf-Qn)/Qn;
            R = Vn*((1-eff)/(0.2*Qn));
            E0 = Vf+K+R*i_c-A;
            
            %Tab 1 Edit Fields
            app.A_MEditField.Value = A;
            app.B_MEditField.Value = B;
            app.K_MEditField.Value = K;
            app.R_MEditField.Value = R;
            app.E0_MEditField.Value = E0;
            app.Q_MEditField.Value = Qf;
            
            %Tab 4 Edit Fields
            app.A_MEditField_2.Value = A;
            app.B_MEditField_2.Value = B;
            app.K_MEditField_2.Value = K;
            app.R_MEditField_2.Value = R;
            app.E0_MEditField_2.Value = E0;
            app.Q_MEditField_2.Value = Qf;
            
            %Array of all the values calculated above. Need this to
            %determine if the knob limits have to be increased to
            %accomodate:
            vals = [A,B,K,R,E0];
            limitedVals = [app.ExponentialZoneAmplitudeA_MKnob,app.ExponentialZoneTimeConstantInverseB_MKnob...
                app.PolarizationResistanceConstantK_MKnob,app.BatteryInternalResistanceR_MKnob,...
                app.BatteryConstantVoltageE0_MKnob];
            for n = 1:length(vals)
                temp = limitedVals(n).Limits;
                if vals(n) > temp(2)
                    %Increase the knob's upper limit to vals(n):
                    limitedVals(n).Limits = [temp(1),vals(n)];
                elseif vals(n) < temp(1) && vals(n) > 0
                    %Decrease the knob's lower limit to vals(n
                    limitedVals(n).Limits = [vals(n),temp(2)];
                end
            end
            %Enable toggle on tab 4 that controls the x-axis:
            app.D3AxSw.Enable = 'on';
            
        end
        
        function retrieveBWS(app)
            % Gets user's discharge data from the base workspace.
            
            %Get user's voltage data from base workspace:
            if ~isempty(app.voltageBWS.Value)
                app.v = evalin('base',app.voltageBWS.Value);
            end
            
            %Get user's capacity discharged data from base workspace:
            if ~isempty(app.capacityBWS.Value)
                app.q = evalin('base',app.capacityBWS.Value);
            end
            
            %Get user's current data from base workspace:
            if ~isempty(app.currentBWS.Value)
                cur = evalin('base',app.currentBWS.Value);
                app.i = abs(mean(cur));
            end
            
            % Get user's time data from base workspace and adjust for
            % comparisons to the app time data used in calculations.
            % The adjusted time will start at t=0 and have the same number of datapoints
            % as the original time with the same step size between points:
            if ~isempty(app.timeBWS.Value)
                t_1 = evalin('base',app.timeBWS.Value);
                stepSizes = diff(t_1);
                app.t(1) = 0;
                for idx = 2:length(t_1)
                    app.t(idx) = app.t(idx-1) + stepSizes(idx-1);
                end
            end
            
            %Calculate the C-Rate from the user's data
            if ~isempty(app.capacityBWS.Value) && ~isempty(app.currentBWS.Value)
                user_c_rate = app.i/max(app.q);
            else
                user_c_rate = 1;
            end
            
            app.CRateEditField.Value = user_c_rate;
            app.C1EditField.Value = user_c_rate;
            
        end
        
        
        
        function updatePlot3(app)
            %Control plots generated by data in the get-data-from-workspace tab
            %(tab 4)
            app.PolarizationResistanceConstantK_MKnob.Value = app.K_MEditField_2.Value;
            app.BatteryInternalResistanceR_MKnob.Value = app.R_MEditField_2.Value;
            app.BatteryCapacityQ_MKnob.Value = app.Q_MEditField_2.Value;
            app.ExponentialZoneAmplitudeA_MKnob.Value = app.A_MEditField_2.Value;
            app.ExponentialZoneTimeConstantInverseB_MKnob.Value = app.B_MEditField_2.Value;
            app.BatteryConstantVoltageE0_MKnob.Value = app.E0_MEditField_2.Value;
            updateCurve(app)
        end
        
        
        function Minimize_RMSE(app)
            
            if app.numRates ~= 1
                app.RMSE_ErrorMessage.Value = 'ERROR: Only 1 C Rate allowed for RMSE minimization';
            else
                RMSEDomainTruncate(app)
                percDecr1 = app.PercDecr1EditField.Value;
                app.RMSE_ErrorMessage.Value = '';
                [params,majorPts,minRMSE,vFit,itReturn] = sweep(app.v,app.q,app.i,percDecr1,app.RMSE_Truncate_Min_Idx,app.RMSE_Truncate_Max_Idx);
                Q_Fit = params(1);
                A_Fit = params(2);
                B_Fit = params(3);
                K_Fit = params(4);
                R_Fit = params(5);
                E0_Fit = params(6);
                
                %This should be greater than percDecr1 as it will take much longer to run:
                percDecr2 = app.PercDecr2EditField.Value;
                [vFinal,itFinal,minRMSE,Q,A,B,K,R,E0] = sweepParams(...
                    Q_Fit,A_Fit,B_Fit,K_Fit,R_Fit,E0_Fit,app.v,app.q,app.i,percDecr2,app.RMSE_Truncate_Min_Idx,app.RMSE_Truncate_Max_Idx);
                
                app.Q_MEditField.Value = Q;
                app.A_MEditField.Value = A;
                app.B_MEditField.Value = B;
                app.K_MEditField.Value = K;
                app.R_MEditField.Value = R;
                app.E0_MEditField.Value = E0;
                
                updateLimits(app,app.BatteryCapacityQ_MKnob,app.Q_MEditField);
                updateLimits(app,app.ExponentialZoneAmplitudeA_MKnob,app.A_MEditField);
                updateLimits(app,app.ExponentialZoneTimeConstantInverseB_MKnob,app.B_MEditField);
                updateLimits(app,app.PolarizationResistanceConstantK_MKnob,app.K_MEditField);
                updateLimits(app,app.BatteryInternalResistanceR_MKnob,app.R_MEditField);
                updateLimits(app,app.BatteryConstantVoltageE0_MKnob,app.E0_MEditField);
                
                RMSE = num2str(minRMSE);
                
                setfields(app);
                updatePlot3(app);
                cRate_display(app);
                app.RMSE_ErrorMessage.Value = ["RMSE = " + RMSE];
            end
        end
        
        
        
        
        function setfields(app)
            app.BatteryCapacityQ_MKnob.Value = app.Q_MEditField.Value;
            app.ExponentialZoneAmplitudeA_MKnob.Value = app.A_MEditField.Value;
            app.ExponentialZoneTimeConstantInverseB_MKnob.Value = app.B_MEditField.Value;
            app.BatteryInternalResistanceR_MKnob.Value = app.R_MEditField.Value;
            app.PolarizationResistanceConstantK_MKnob.Value = app.K_MEditField.Value;
            app.BatteryConstantVoltageE0_MKnob.Value = app.E0_MEditField.Value;
            
            app.Q_MEditField_2.Value = app.Q_MEditField.Value;
            app.A_MEditField_2.Value = app.A_MEditField.Value;
            app.B_MEditField_2.Value = app.B_MEditField.Value;
            app.R_MEditField_2.Value = app.R_MEditField.Value;
            app.K_MEditField_2.Value = app.K_MEditField.Value;
            app.E0_MEditField_2.Value = app.E0_MEditField.Value;
            
            
        end
        
        function updateLimits(app,updateThis,comparetoThis)
            lim = updateThis.Limits;
            %Adjust knob limits to include the value in the edit field:
            if lim(2) < comparetoThis.Value
                updateThis.Limits = [lim(1),comparetoThis.Value];
            end
            
        end
        
        function Regressor(app)
            updateCurve(app);
            %             updatePlot(app);
            %IMPORT VDIT
            v1=app.v;
            d1=app.q;
            i1=app.i;
            for k=1:length(d1)
                i1(k)=app.i;
            end
            t1=app.t;
            
            Q_M = app.BatteryCapacityQ_MKnob.Value;
            %Initial state of charge (%):
            SOC_init = app.InitialSOCSlider.Value;
            %Exponential zone amplitude (V):
            A_M = app.ExponentialZoneAmplitudeA_MKnob.Value;
            %Exponential zone time constant inverse (Ah^-1):
            B_M = app.ExponentialZoneTimeConstantInverseB_MKnob.Value;
            %Polarization Constant (Ah^-1):
            K_M = app.PolarizationResistanceConstantK_MKnob.Value;
            %Battery Constant Voltage (V):
            E0_M = app.BatteryConstantVoltageE0_MKnob.Value;
            %Battery Internal Resistance (Ohms):
            R_M = app.BatteryInternalResistanceR_MKnob.Value;
            %Minimum SOC (%) to display. Going too low results in discontinuities in
            %results:
            SOC_min = app.MinimumSOCLimitSlider.Value;
            C = zeros(1,app.numRates);
            C(1) = app.C1EditField.Value;
            Rates = {app.C1EditField.Enable,app.C2EditField.Enable,app.C3EditField.Enable,app.C4EditField.Enable...
                app.C5EditField.Enable,app.C6EditField.Enable,app.C7EditField.Enable,app.C8EditField.Enable};
            
            
            %Time for discharge (hrs):
            tmax = [1./C];
            
            %Battery Current (A):
            if isempty(app.currentBWS.Value)
                iBatt(1) = Q_M * C(1);
            else
                iBatt(1) = app.i;
            end
            iBatt(2:length(C)) = Q_M .* C(2:length(C));
            
            
            %Initialize:
            app.t_sec = zeros(app.numRates,10000);
            
            
            for n = 1:length(C)
                %Time array (sec) 150 ms time step initially:
                app.t_sec(n,:) = linspace(0,(tmax(n).*(60^2)),10000);
                
                %Battery charge consumed by a load (Ah):
                it_base = linspace(0,Q_M,length(app.t_sec(n,:)));
                %Actual charge consumed, taking into account initial SOC and it_base (Ah):
                it = it_base + (100-SOC_init)./100.*Q_M;
                %State of Charge (%):
                SOC = 100-((it./Q_M).*100);
                %Dimensions of SOC:
                d_SOC = size(SOC);
                %Find where SOC_min occurs in SOC array:
                
                
                for minIdx = 1:d_SOC(2)
                    if SOC(minIdx) <= SOC_min
                        break
                    end
                end
            end
            
            
            it_trim = [it([1:minIdx])];
            %dimensions of it:
            dim_it = length(it_trim);
            %Recompute time array to match size of it:
            t_sec_trim = linspace(0,tmax*60^2,dim_it);
            
            i_Batt=abs(mean(i1));
            
            % v_Batt = E0_M+...
            % %v_Exp
            % (A_M .* exp(-1.*B_M.*(it_trim)))  -...
            % %subtract v_Pol
            % (K_M .* Q_M./(Q_M-it_trim))  -...
            % %iBatt*r_Pol
            % i_Batt*(K_M .* Q_M./(Q_M-it_trim)) -...
            % %iBatt*R_M
            % (i_Batt*R_M);
            
            %             v_Batt = E0_M  +  (A_M .* exp(-1.*B_M.*(it_trim)))  -  (K_M .* Q_M./(Q_M-it_trim))  -  i_Batt*(K_M .* Q_M./(Q_M-it_trim)) - (i_Batt*R_M);
            
            NReg=0;
            
            for m = 1:length(d1);
                
                NReg=NReg+1;
                
                fullindices(NReg)=findit(d1(m),it_trim);
                
                
                %Finds the indices of the it_trim values that correspond most closely
                %to the equivalent d1 table
            end
            
            nReg=0;
            for m = 1:length(d1);
                
                nReg=nReg+1;
                
                indices(nReg)=findit(d1(m),it_trim);
                
                if d1(m) >= max(it_trim)
                    break
                end
                
                %Finds the indices of the it_trim values that correspond most closely
                %to the equivalent d1 table
            end
            
            
            trim_dim=length(indices);
            v1_old=v1;
            d1_old=d1;
            i1_old=i1;
            t1_old=t1;
            v1=v1(1:trim_dim);
            d1=d1(1:trim_dim);
            i1=i1(1:trim_dim);
            if exist('t1')
                t1=t1(1:trim_dim);
            end
            
            
            %ABKR are the params
            %OLDDD VoltageCurve = @(X)  X(1)  +  (X(2) .* exp(-1.*X(3).*(it_trim)))  -  (X(4) .* Q_M./(Q_M-it_trim))  -  i_Batt*(X(4) .* Q_M./(Q_M-it_trim)) - (i_Batt*X(5));
            %E0 is now fixed
            
            E0 = median(v1);
            v_Exp = @(X) X(1) .* exp(-1.*X(2).*(it_trim));
            r_Pol = @(X) X(3) .* Q_M./(Q_M-it_trim);
            v_Pol = @(X) X(3) .* it_trim .* Q_M./(Q_M-it_trim);
            
%           v_Pol_old = @(X) X(3) * Q_M./(Q_M-it_trim);
%           This was the erroneous formula that was used at one point, but
%           was corrected.
            
            VoltageCurve = @(X) E0 + v_Exp(X) - v_Pol(X) - (i_Batt .* r_Pol(X)) - (i_Batt .* X(4));
            
            v_Exp_SHORT = @(X) X(1) .* exp(-1.*X(2).*(it_trim(indices)));
            r_Pol_SHORT = @(X) X(3) .* Q_M./(Q_M-it_trim(indices));
            v_Pol_SHORT = @(X) X(3) .* it_trim(indices) .* Q_M./(Q_M-it_trim(indices));
            % VoltageCurveSHORT = @(X) X(1) + v_Exp_SHORT(X) - v_Pol_SHORT(X) - (i_Batt .* r_Pol_SHORT(X)) - (i_Batt .* X(5));
            
            
            
            x0 = [app.A_MEditField_Opt.Value,app.B_MEditField_Opt.Value,app.K_MEditField_Opt.Value,app.R_MEditField_Opt.Value];
            
            nReg=0;
            
            VoltageCurve_SHORT = @(X) E0 + v_Exp_SHORT(X) - v_Pol_SHORT(X) - (i_Batt .* r_Pol_SHORT(X)) - (i_Batt .* X(4));
            
            % VC=VoltageCurve(x0);
            % VC=VC(indices);
            % EvVals=it_trim(indices);
            
            
            %             Pen1 = @(X) exp(-10e6*(X(1)+1/10e5))
            %             Pen2 = @(X) exp(-10e6*(X(2)+1/10e5))
            %             Pen3 = @(X) exp(-10e6*(X(3)+1/10e5))
            %             Pen4 = @(X) exp(-10e6*(X(4)+1/10e5))
            %             Pen5 = @(X) exp(-10e6*(X(5)+1/10e5))
            %             Pen = @(X) Pen1(X)+Pen2(X)+Pen3(X)+Pen4(X)+Pen5(X)
            
            
            %Keeps negative values from messing stuff up
            
            SumSquareError = @(X) sum((VoltageCurve_SHORT(X) - v1).^2);
            
            %             +Pen1(X);
            
            %             options = optimset('MaxFunEvals',1e12,'MaxIter',1e12,'TolFun',1e-9,'TolX',1e-9);
            options = optimset('MaxFunEvals',1e12,'MaxIter',1e12,'TolFun',1e-9,'TolX',1e-9);
            
            parameters=fminsearch(SumSquareError,x0,options);
            
            %             hold on
            %             scatter(d1,v1);
            %             plot(d1,VoltageCurve_SHORT(parameters));
            %             SumSquareError(parameters)
            
            if strcmp(app.x_ax,'C')
                app.xax = it_trim;
                app.xstr = 'Discharged Capacity, Ah';
            else
                app.xax = t_sec_trim;
                app.xstr = 'Time, s';
            end
            
            %plot(it_trim,VoltageCurve(parameters))
            %scatter(d1old,v1old)
            hold(app.OptPlot,'on');
            
            
            %             if app.applyPlots == 1
            %                     if strcmp(app.x_ax,'C')
            %                         %more?
            %                         scatter(app.OptPlot,app.q,app.v)
            %                         legend(app.OptPlot,'User Data')
            %                     else
            %                         scatter(app.OptPlot,app.t,app.v)
            %                         legend(app.OptPlot,'User Data')
            %                     end
            %                     hold(app.OptPlot,'on')
            %             end
            
            
            %       plot(app.OptPlot,d1,VoltageCurve_SHORT(parameters),'DisplayName',app.legends(nReg));
            
            legendsReg='Fitted Curve';
            FittedCurve=plot(app.OptPlot,d1,VoltageCurve_SHORT(parameters),'DisplayName',legendsReg)
            xlabel(app.OptPlot,app.xstr);
            ylabel(app.OptPlot, 'Battery Voltage, V')
            %           legend(app.Opt);
            %           hold(app.Opt,'on')
            %
            
            % app.Q_MEditField_Opt
            app.A_MEditField_Opt.Value=parameters(1);
            app.B_MEditField_Opt.Value=parameters(2);
            app.R_MEditField_Opt.Value=parameters(4);
            app.K_MEditField_Opt.Value=parameters(3);
            app.E0_MEditField_Opt.Value=E0;
            
            app.SSE_EditField.Value=SumSquareError(parameters);
            
            %R^2 = 1-SS_res/SS_total
            %SS_res is the same as SSE
            SSE=SumSquareError(parameters);
            SST=sum((VoltageCurve_SHORT(parameters)-mean(v1)).^2);
            R2=1-SSE/SST;
            app.R2_EditField.Value=R2;
            
            
        end
        
        
        function batteryMass = batteryMass(app,q,v)
            %Uses a statistical relationship/linear regression
            %Q is in Ah
            %V is in volts
            %       OLD FORMULA batt_mass = 0.0106*(q*v)+1.1924;
            %       OLD FORMUlA batteryMass=0.0109*(q*v)+1.1466;
            batteryMass = 0.0118*(q*v);
            
        end
        
        
        function Truncate(app)
        
        lowSOC=app.MinSOCEditField.Value;
        highSOC=app.MaxSOCEditField.Value;
        SOCs = 100*(app.q ./ max(app.q));
        k=0;
        Ind=[]
        for I = 1:length(SOCs)
            if SOCs(I)>=lowSOC && SOCs(I)<=highSOC
                k=k+1;
                Ind(k)=k;
                newSOCs(k)=SOCs(I);        
            end
        end
        
        app.q=app.q(Ind);
        app.v=app.v(Ind);
%         app.i=app.i
        app.t=app.t(Ind);
        
%         app.voltageBWS.Value=app.v
%         app.capacityBWS.Value=app.q
%         app.currentBWS.Value=app.i
%         app.timeBWS.Value=app.t
        
        
        
        
        end
        
        function RMSEDomainTruncate(app)
        RMSESocMin=app.RMSEMinDomainEditField.Value;
        RMSESocMax=app.RMSEMaxDomainEditField.Value;
        SOCs = 100*(app.q ./ max(app.q));
        k=0
        Ind=[]
        for I = 1:length(SOCs)
            if SOCs(I)>=RMSESocMin && SOCs(I)<=RMSESocMax
                k=k+1;
                Ind(k)=k;
                newSOCs(k)=SOCs(I);        
            end
        end
        
        app.RMSE_Truncate_Min_Idx=Ind(1);
        app.RMSE_Truncate_Max_Idx=Ind(length(Ind));

        end
        
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            retrieveBWS(app)
            SOC_windows(app)
            updateCurve(app)
            cRate_display(app)
        end

        % Value changed function: InitialSOCSlider
        function InitialSOCSliderValueChanged(app, event)
            app.InitialSOC_EditField.Value = app.InitialSOCSlider.Value;
            updateCurve(app)
            cRate_display(app)
        end

        % Value changed function: BatteryCapacityQ_MKnob
        function BatteryCapacityQ_MKnobValueChanged(app, event)
            updateCurve(app);
            cRate_display(app)
            app.Q_MEditField.Value = app.BatteryCapacityQ_MKnob.Value;
        end

        % Value changed function: ExponentialZoneAmplitudeA_MKnob
        function ExponentialZoneAmplitudeA_MKnobValueChanged(app, event)
            updateCurve(app);
            cRate_display(app)
            app.A_MEditField.Value = app.ExponentialZoneAmplitudeA_MKnob.Value;
        end

        % Value changed function: 
        % PolarizationResistanceConstantK_MKnob
        function PolarizationResistanceConstantK_MKnobValueChanged(app, event)
            updateCurve(app);
            cRate_display(app)
            app.K_MEditField.Value = app.PolarizationResistanceConstantK_MKnob.Value;
        end

        % Value changed function: BatteryConstantVoltageE0_MKnob
        function BatteryConstantVoltageE0_MKnobValueChanged(app, event)
            updateCurve(app);
            cRate_display(app)
            app.E0_MEditField.Value = app.BatteryConstantVoltageE0_MKnob.Value;
        end

        % Value changed function: 
        % ExponentialZoneTimeConstantInverseB_MKnob
        function ExponentialZoneTimeConstantInverseB_MKnobValueChanged(app, event)
            updateCurve(app);
            cRate_display(app)
            app.B_MEditField.Value = app.ExponentialZoneTimeConstantInverseB_MKnob.Value;
        end

        % Value changed function: BatteryInternalResistanceR_MKnob
        function BatteryInternalResistanceR_MKnobValueChanged(app, event)
            updateCurve(app);
            cRate_display(app)
            app.R_MEditField.Value = app.BatteryInternalResistanceR_MKnob.Value;
        end

        % Value changed function: Q_MEditField
        function Q_MEditFieldValueChanged(app, event)
            lim = app.BatteryCapacityQ_MKnob.Limits;
            %Adjust knob limits to include the value in the edit field:
            if lim(2) < app.Q_MEditField.Value
                app.BatteryCapacityQ_MKnob.Limits = [lim(1),app.Q_MEditField.Value];
            end
            app.BatteryCapacityQ_MKnob.Value = app.Q_MEditField.Value;
            updateCurve(app);
            cRate_display(app)
        end

        % Value changed function: A_MEditField
        function A_MEditFieldValueChanged(app, event)
            lim = app.ExponentialZoneAmplitudeA_MKnob.Limits;
            %Adjust knob limits to include the value in the edit field:
            if lim(2) < app.A_MEditField.Value
                app.ExponentialZoneAmplitudeA_MKnob.Limits = [lim(1),app.A_MEditField.Value];
            end
            app.ExponentialZoneAmplitudeA_MKnob.Value = app.A_MEditField.Value;
            updateCurve(app);
            cRate_display(app)
        end

        % Value changed function: B_MEditField
        function B_MEditFieldValueChanged(app, event)
            lim = app.ExponentialZoneTimeConstantInverseB_MKnob.Limits;
            %Adjust knob limits to include the value in the edit field:
            if lim(2) < app.B_MEditField.Value
                app.ExponentialZoneTimeConstantInverseB_MKnob.Limits = [lim(1),app.B_MEditField.Value];
            end
            app.ExponentialZoneTimeConstantInverseB_MKnob.Value = app.B_MEditField.Value;
            updateCurve(app);
            cRate_display(app)
        end

        % Value changed function: R_MEditField
        function R_MEditFieldValueChanged(app, event)
            lim = app.BatteryInternalResistanceR_MKnob.Limits;
            %Adjust knob limits to include the value in the edit field:
            if lim(2) < app.R_MEditField.Value
                app.BatteryInternalResistanceR_MKnob.Limits = [lim(1),app.R_MEditField.Value];
            end
            app.BatteryInternalResistanceR_MKnob.Value = app.R_MEditField.Value;
            updateCurve(app);
            cRate_display(app)
        end

        % Value changed function: K_MEditField
        function K_MEditFieldValueChanged(app, event)
            lim = app.PolarizationResistanceConstantK_MKnob.Limits;
            %Adjust knob limits to include the value in the edit field:
            if lim(2) < app.K_MEditField.Value
               app.PolarizationResistanceConstantK_MKnob.Limits = [lim(1),app.K_MEditField.Value];
            end
            app.PolarizationResistanceConstantK_MKnob.Value = app.K_MEditField.Value;
            updateCurve(app);
            cRate_display(app)
        end

        % Value changed function: E0_MEditField
        function E0_MEditFieldValueChanged(app, event)
            lim = app.BatteryConstantVoltageE0_MKnob.Limits;
            %Adjust knob limits to include the value in the edit field:
            if lim(2) < app.E0_MEditField.Value
                app.BatteryConstantVoltageE0_MKnob.Limits = [lim(1),app.E0_MEditField.Value];
            end
            app.BatteryConstantVoltageE0_MKnob.Value = app.E0_MEditField.Value;
            updateCurve(app);
            cRate_display(app)
        end

        % Button pushed function: AddRateButton
        function AddRateButtonPushed(app, event)
        % Enable parameters of each C-Rate Edit Field:
        Rates = {app.C1EditField.Enable,app.C2EditField.Enable,app.C3EditField.Enable,app.C4EditField.Enable...
                app.C5EditField.Enable,app.C6EditField.Enable,app.C7EditField.Enable,app.C8EditField.Enable};
        % Objects pertaining to add rate or remove rate options under the C-Rate tab:
        rateOBJ = [app.C1EditField,app.C2EditField,app.C3EditField,app.C4EditField...
        app.C5EditField,app.C6EditField,app.C7EditField,app.C8EditField;app.ConstantDischargeCurrentEditField_1,...
        app.ConstantDischargeCurrentEditField_2,app.ConstantDischargeCurrentEditField_3,app.ConstantDischargeCurrentEditField_4,...
        app.ConstantDischargeCurrentEditField_5,app.ConstantDischargeCurrentEditField_6,app.ConstantDischargeCurrentEditField_7,...
        app.ConstantDischargeCurrentEditField_8;app.AveragePowerOutputEditField_1,app.AveragePowerOutputEditField_2,...
        app.AveragePowerOutputEditField_3,app.AveragePowerOutputEditField_4,app.AveragePowerOutputEditField_5,...
        app.AveragePowerOutputEditField_6,app.AveragePowerOutputEditField_7,app.AveragePowerOutputEditField_8];

            for idx = 2 : 8
                if strcmp(Rates(idx),'off')
                    x = rateOBJ(:,idx);
                    %Enable C-Rate Edit Field:
                    x(1).Enable = 'on';
                    %Enable Discharge Current Edit Field:
                    x(2).Enable = 'on';
                    %Enable Average power Edit Field:
                    x(3).Enable = 'on';
                    %Track how many C-Rates are enabled:
                    app.numRates = app.numRates + 1;
                    break
                end
            end
            updateCurve(app);
            cRate_display(app)
        end

        % Button pushed function: RemoveRateButton
        function RemoveRateButtonPushed(app, event)
            % Enable parameters of each C-Rate Edit Field:
            Rates = {app.C1EditField.Enable,app.C2EditField.Enable,app.C3EditField.Enable,app.C4EditField.Enable...
                app.C5EditField.Enable,app.C6EditField.Enable,app.C7EditField.Enable,app.C8EditField.Enable};
            %Objects pertaining to add rate or remove rate options under the C-Rate tab:
            rateOBJ = [app.C1EditField,app.C2EditField,app.C3EditField,app.C4EditField...
            app.C5EditField,app.C6EditField,app.C7EditField,app.C8EditField;app.ConstantDischargeCurrentEditField_1,...
            app.ConstantDischargeCurrentEditField_2,app.ConstantDischargeCurrentEditField_3,app.ConstantDischargeCurrentEditField_4,...
            app.ConstantDischargeCurrentEditField_5,app.ConstantDischargeCurrentEditField_6,app.ConstantDischargeCurrentEditField_7,...
            app.ConstantDischargeCurrentEditField_8;app.AveragePowerOutputEditField_1,app.AveragePowerOutputEditField_2,...
            app.AveragePowerOutputEditField_3,app.AveragePowerOutputEditField_4,app.AveragePowerOutputEditField_5,...
            app.AveragePowerOutputEditField_6,app.AveragePowerOutputEditField_7,app.AveragePowerOutputEditField_8];

            for idx = [8,7,6,5,4,3,2]
                if strcmp(Rates(idx),'on')
                    y = rateOBJ(:,idx);
                    %Disnable C-Rate Edit Field:
                    y(1).Enable = 'off';
                    %Disable Discharge Current Edit Field:
                    y(2).Enable = 'off';
                    %Disable Average power Edit Field:
                    y(3).Enable = 'off';
                    %Track how many C-Rates are enabled:
                    app.numRates = app.numRates - 1;
                    break
                end
            end
            updateCurve(app);
            cRate_display(app)
        end

        % Value changed function: InitialSOC_EditField
        function InitialSOC_EditFieldValueChanged(app, event)
            app.InitialSOCSlider.Value = app.InitialSOC_EditField.Value;
            updateCurve(app);
            cRate_display(app)
        end

        % Value changed function: MinSOC_EditField
        function MinSOC_EditFieldValueChanged(app, event)
            app.MinimumSOCLimitSlider.Value = app.MinSOC_EditField.Value;
            updateCurve(app);
            cRate_display(app)
        end

        % Value changed function: MinimumSOCLimitSlider
        function MinimumSOCLimitSliderValueChanged(app, event)
            app.MinSOC_EditField.Value = app.MinimumSOCLimitSlider.Value;
            updateCurve(app);
            cRate_display(app)
        end

        % Value changed function: C1EditField, C2EditField, 
        % C3EditField, C4EditField, C5EditField, C6EditField, 
        % C7EditField, C8EditField
        function C1EditFieldValueChanged(app, event)
            updateCurve(app);
            cRate_display(app)
        end

        % Button pushed function: SimulateandPlotButton
        function SimulateandPlotButtonPushed(app, event)
            % Simulates a single discharge in a Simulink model containing an
            % EMTAT battery block and EMTAT thermal block.
            
            %---------------------------------------------------------------------------------------------
            % The model is Battery_iDesign_TempSim.slx and it must be included
            % with the app package and saved on the MATLAB path!
            %---------------------------------------------------------------------------------------------
            %Turn off the hold on the 4 axes in tab 3
            hold(app.Temp_v_Time,'off');
            hold(app.Temp_v_Voltage,'off');
            hold(app.R_mod,'off');
            hold(app.Q_Mod,'off')
            
            % Load the model and create variables for important components for
            % later use:
            load_system('Battery_iDesign_TempSim');
            batt = ('Battery_iDesign_TempSim/Electrothermal_Battery_Model');
            thermal = ('Battery_iDesign_TempSim/Thermal_Model');
            current = ('Battery_iDesign_TempSim/current');
            tAmb = ('Battery_iDesign_TempSim/T_ambient');
            
            
            %Convert numeric values to string to use with set-param:
            tj = num2str(app.Tj_0_M.Value);
            ts = num2str(app.Ts_0_M.Value);
            cj = num2str(app.Cj_M.Value);
            rj = num2str(app.Rj_M.Value);
            cs = num2str(app.Cs_M.Value);
            ru = num2str(app.Ru_M.Value);
            ta = num2str(app.AmbTemp.Value);
            
            voltage = num2str(app.BatteryConstantVoltageE0_MKnob.Value);
            capacity = num2str(app.BatteryCapacityQ_MKnob.Value);
            res = num2str(app.BatteryInternalResistanceR_MKnob.Value);
            pol_res = num2str(app.PolarizationResistanceConstantK_MKnob.Value);
            exp_amp = num2str(app.ExponentialZoneAmplitudeA_MKnob.Value);
            exp_t = num2str(app.ExponentialZoneTimeConstantInverseB_MKnob.Value);
            soc_init = num2str(app.InitialSOCSlider.Value);
            
            set_param(batt,'E0_M',voltage,'Q_M',capacity,'R_M',res,'K_M',pol_res,...
                'B_M',exp_t,'SOC_Init_M',soc_init,'A_M',exp_amp);
            set_param(thermal,'Tj_0_M',tj,'Ts_0_M',ts,'Cj_M',cj,'Rj_M',rj,'Cs_M',cs,'Ru_M',ru);
            set_param(tAmb,'Value',ta);
            
            for n = 1:app.numRates
                
                %Discharge current constant value:
                iStr = num2str(app.constCurrent(n));
                set_param(current,'Value',iStr);
                
                %Simulation time:
                fixedStep = num2str(max(app.t_sec(n,:))/1e4);
                stopTime = num2str(max(app.t_sec(n,:)));
                set_param('Battery_iDesign_TempSim',"FixedStep",fixedStep);
                set_param('Battery_iDesign_TempSim',"StopTime", stopTime);
                t_axis_plots = [0:str2double(fixedStep):max(app.t_sec(n,:))];
                
                %Simulate:
                simout = sim('Battery_iDesign_TempSim');
                
                %Results:
                T_Average = simout.TAvg;
                %cap_consumed = simout.IT;
                Batt_Voltage = simout.BV;
                SOC = simout.SOC;
                R_Mod = simout.R_Mod;
                CapMod = simout.Q_Mod;
                
                
                %Trim to cut out the weird stuff that happens below SOC_min
                for minIdx = 1:length(SOC)
                    if SOC(minIdx) <= app.MinimumSOCLimitSlider.Value
                        break
                    end
                end
                T_Average = T_Average(1:minIdx);
                %cap_consumed = cap_consumed(1:minIdx);
                Batt_Voltage = Batt_Voltage(1:minIdx);
                t_axis_plots = t_axis_plots(1:minIdx);
                CapMod = CapMod(1:minIdx);
                R_Mod = R_Mod(1:minIdx);
                
                %Plots:
                plot(app.Temp_v_Time,t_axis_plots,T_Average,'DisplayName',app.legends(n))
                legend(app.Temp_v_Time);
                hold(app.Temp_v_Time,'on')
                
                set(app.Temp_v_Voltage,'xdir','reverse')
                plot(app.Temp_v_Voltage,Batt_Voltage,T_Average,'DisplayName',app.legends(n))
                legend(app.Temp_v_Voltage);
                hold(app.Temp_v_Voltage,'on')
                
                plot(app.R_mod,t_axis_plots,R_Mod,'DisplayName',app.legends(n))
                legend(app.R_mod);
                hold(app.R_mod,'on')
                
                plot(app.Q_Mod,t_axis_plots,CapMod,'DisplayName',app.legends(n))
                legend(app.Q_Mod);
                hold(app.Q_Mod,'on')
            end
        end

        % Value changed function: XAxisSwitch
        function XAxisSwitchValueChanged(app, event)
            app.x_ax = app.XAxisSwitch.Value(1);
            app.XAxisSwitch_2.Value = app.XAxisSwitch.Value;
            app.D3AxSw.Value = app.XAxisSwitch.Value;
            updateCurve(app);
        end

        % Value changed function: XAxisSwitch_2
        function XAxisSwitch_2ValueChanged(app, event)
            app.x_ax = app.XAxisSwitch_2.Value(1);
            app.XAxisSwitch.Value = app.XAxisSwitch_2.Value;
            app.D3AxSw.Value = app.XAxisSwitch_2.Value;
            updateCurve(app);
        end

        % Button pushed function: ApplytoPlotsButton
        function ApplytoPlotsButtonPushed(app, event)
            if isempty(app.v) && isempty(app.q)
                app.applyPlots = false;
            else
                app.applyPlots = true;
            end
            determine_Param(app);
            updatePlot3(app);
            cRate_display(app);
        end

        % Button pushed function: RetrieveButton
        function RetrieveButtonPushed(app, event)
            retrieveBWS(app)
            determine_Param(app)
        end

        % Button pushed function: OpenReferenceImageButton
        function OpenReferenceImageButtonPushed(app, event)
            im = imread("Ideal_Discharge.PNG");
            image(im);
        end

        % Value changed function: D3AxSw
        function D3AxSwValueChanged(app, event)
            app.x_ax = app.D3AxSw.Value(1);
            app.XAxisSwitch_2.Value = app.D3AxSw.Value;
            app.XAxisSwitch.Value = app.D3AxSw.Value;

            updatePlot3(app);
        end

        % Value changed function: V_expKnob
        function V_expKnobValueChanged(app, event)
            app.V_exp_percent.Value = app.V_expKnob.Value;
            app.V_nom_percent.Limits = [app.V_expKnob.Value, 100];
            app.V_nomKnob.Limits = [app.V_expKnob.Value, 100];
            determine_Param(app)
            updatePlot3(app)
        end

        % Value changed function: V_nomKnob
        function V_nomKnobValueChanged(app, event)
            app.V_nom_percent.Value = app.V_nomKnob.Value;
            app.V_exp_percent.Limits = [0, app.V_nomKnob.Value];
            app.V_expKnob.Limits = [0, app.V_nomKnob.Value];
            determine_Param(app)
            updatePlot3(app)
        end

        % Button pushed function: SavetoFileButton
        function SavetoFileButtonPushed(app, event)

            Q_M = app.Q_MEditField.Value;
            A_M = app.A_MEditField.Value;
            B_M = app.B_MEditField.Value;
            R_M = app.R_MEditField.Value;
            K_M = app.K_MEditField.Value;
            E0_M = app.E0_MEditField.Value;
            SOC_Init_M = app.InitialSOCSlider.Value;
            Cs_M = app.Cs_M.Value;
            Ru_M = app.Ru_M.Value;
            Ts_0_M = app.Ts_0_M.Value;
            Cj_M = app.Cj_M.Value;
            Rj_M = app.Rj_M.Value;
            Tj_0_M = app.Tj_0_M.Value;
            %             if app.batt_mass ~= 0
            %
            
            batt_mass = app.batt_mass;
            uisave({'Q_M','A_M','B_M','R_M','K_M','E0_M','SOC_Init_M','Cs_M'...
                'Ru_M','Ts_0_M','Cj_M','Rj_M','Tj_0_M','batt_mass'},'battery_parameters');
            %             else uisave({'Q_M','A_M','B_M','R_M','K_M','E0_M','SOC_Init_M','Cs_M'...
            %                 'Ru_M','Ts_0_M','Cj_M','Rj_M','Tj_0_M'},'battery_parameters');
            %             end
            
           
            
        end

        % Button pushed function: MinimizeRMSEButton
        function MinimizeRMSEButtonPushed(app, event)
            Minimize_RMSE(app)
        end

        % Button pushed function: 
        % ExportParameterstoElectricalCharacteristicsButton
        function ExportParameterstoElectricalCharacteristicsButtonPushed(app, event)
            app.Q_MEditField.Value = app.Q_MEditField_Opt.Value;
            app.A_MEditField.Value = app.A_MEditField_Opt.Value;
            app.B_MEditField.Value = app.B_MEditField_Opt.Value;
            app.R_MEditField.Value = app.R_MEditField_Opt.Value;
            app.K_MEditField.Value = app.K_MEditField_Opt.Value;
            app.E0_MEditField.Value = app.E0_MEditField_Opt.Value;
            app.InitialSOC_EditField.Value = app.InitialSOC_EditField_Opt.Value;
            app.MinSOC_EditField.Value = app.MinSOC_EditField_Opt.Value;
            
            
           app.BatteryCapacityQ_MKnob.Value = app.Q_MEditField_Opt.Value;
           app.ExponentialZoneAmplitudeA_MKnob.Value = app.A_MEditField_Opt.Value;
           app.ExponentialZoneTimeConstantInverseB_MKnob.Value = app.B_MEditField_Opt.Value;
           app.BatteryInternalResistanceR_MKnob.Value = app.R_MEditField_Opt.Value;
           app.PolarizationResistanceConstantK_MKnob.Value = app.K_MEditField_Opt.Value;
           app.BatteryConstantVoltageE0_MKnob.Value = app.E0_MEditField_Opt.Value;
           app.InitialSOCSlider.Value = app.InitialSOC_EditField_Opt.Value;
           app.MinimumSOCLimitSlider.Value = app.MinSOC_EditField_Opt.Value;
           
           
           updateCurve(app);
        end

        % Button pushed function: ClearAxesButton
        function ClearAxesButtonPushed(app, event)
            cla(app.OptPlot)
        end

        % Button pushed function: FindRegressionButton
        function FindRegressionButtonPushed(app, event)
            Regressor(app)
        end

        % Button pushed function: PlotUserDataButton
        function PlotUserDataButtonPushed(app, event)
            
            hold(app.DischargePlot,'off');
            hold(app.DischargePlot_2,'off');
            hold(app.D3Ax,'off');
            
            
            %Battery capacity (Ah):
            Q_M = app.BatteryCapacityQ_MKnob.Value;
            %Discharge Rate (1/h):
            C = zeros(1,app.numRates);
            C(1) = app.C1EditField.Value;
            Rates = {app.C1EditField.Enable,app.C2EditField.Enable,app.C3EditField.Enable,app.C4EditField.Enable...
                app.C5EditField.Enable,app.C6EditField.Enable,app.C7EditField.Enable,app.C8EditField.Enable};
            % Objects pertaining to add rate or remove rate options under the C
            %-Rate tab:
            rateOBJ = [app.C1EditField,app.C2EditField,app.C3EditField,app.C4EditField...
                app.C5EditField,app.C6EditField,app.C7EditField,app.C8EditField];
            
            for y = 2:app.numRates
                if strcmp(Rates(y),'on')
                    C(y) = rateOBJ(y).Value;
                elseif strcmp(Rates(y),'off')
                    break
                end
            end
            
            %Initial state of charge (%):
            SOC_init = app.InitialSOCSlider.Value;
            %Exponential zone amplitude (V):
            A_M = app.ExponentialZoneAmplitudeA_MKnob.Value;
            %Exponential zone time constant inverse (Ah^-1):
            B_M = app.ExponentialZoneTimeConstantInverseB_MKnob.Value;
            %Polarization Resistance (Ohm):
            K_M = app.PolarizationResistanceConstantK_MKnob.Value;
            %Battery Constant Voltage (V):
            E0_M = app.BatteryConstantVoltageE0_MKnob.Value;
            %Battery Internal Resistance (Ohms):
            R_M = app.BatteryInternalResistanceR_MKnob.Value;
            %Minimum SOC (%) to display. Going too low results in discontinuities in
            %results:
            SOC_min = app.MinimumSOCLimitSlider.Value;
            
            %Time for discharge (hrs):
            tmax = [1./C];
            
            %Battery Current (A):
            if isempty(app.currentBWS.Value)
                iBatt(1) = Q_M * C(1);
            else
                iBatt(1) = app.i;
            end
            iBatt(2:length(C)) = Q_M .* C(2:length(C));
            
            
            %Initialize:
            app.t_sec = zeros(app.numRates,10000);
            
            
            for n = 1:length(C)
                %Time array (sec) 150 ms time step initially:
                app.t_sec(n,:) = linspace(0,(tmax(n).*(60^2)),10000);
                
                %Battery charge consumed by a load (Ah):
                it_base = linspace(0,Q_M,length(app.t_sec(n,:)));
                %Actual charge consumed, taking into account initial SOC and it_base (Ah):
                it = it_base + (100-SOC_init)./100.*Q_M;
                %State of Charge (%):
                SOC = 100-((it./Q_M).*100);
                %Dimensions of SOC:
                d_SOC = size(SOC);
                %Find where SOC_min occurs in SOC array:
                for minIdx = 1:d_SOC(2)
                    if SOC(minIdx) <= SOC_min
                        break
                    end
                end
                %Cut off all elements in it beyond the minIdx above so that no data from
                %battery discharge below SOC_min is considered:
                it_trim = [it([1:minIdx])];
                %dimensions of it:
                dim_it = length(it_trim);
                %Recompute time array to match size of it:
                t_sec_trim = linspace(0,tmax(n)*60^2,dim_it);
                
                %Exponential Zone Voltage of Li_Ion (V):
                v_Exp = A_M .* exp(-1 .* B_M .* (it_trim));
                %Polarization Resistance Discharging (Ohms):
                r_Pol = K_M .*  Q_M./(Q_M-it_trim);
                %Polarization Voltage:
                v_Pol = K_M .* it_trim .* Q_M./(Q_M-it_trim);
                
                
                %Battery Voltage Over One Complete Discharge:
                app.v_Batt = E0_M + v_Exp - v_Pol - (iBatt(n) .* r_Pol) - (R_M .* iBatt(n));
                
                %For C Rate tab displays:
                app.constCurrent(n) = iBatt(n);
                app.avgPower(n) = sum([app.v_Batt .* iBatt(n)])/(length(t_sec_trim));
                
                if strcmp(app.x_ax,'C')
                    app.xax = it_trim;
                    app.xstr = 'Discharged Capacity (Ah)';
                else
                    app.xax = t_sec_trim;
                    app.xstr = 'Time (Sec)';
                end
                
                %Scatter plot color scheme:
                colorq = "red";
                colort = "red";
                %                 colormap(app.DischargePlot,jet);
                %                 colormap(app.DischargePlot_2,jet);
                %                 colormap(app.D3Ax,jet);
                scatSize = 10;
                
                %****************************************************************************************
                %*********************************** Plottification *************************************
                %****************************************************************************************
                %Fill legends as needed:
                app.legends(n) = strcat('C',num2str(n));
                
                
                if app.applyPlots && n == 1
                    if strcmp(app.x_ax,'C')
                        scatter(app.OptPlot,app.q,app.v,scatSize,colorq)
                        legend(app.OptPlot,'User Data')
                    else
                        scatter(app.OptPlot,app.t,app.v,scatSize,colort)
                        legend(app.OptPlot,'User Data')
                    end
                    hold(app.OptPlot,'on')
                end
            end
        end

        % Button pushed function: 
        % ImportDatafromElectricalCharacteristicsButton
        function ImportDatafromElectricalCharacteristicsButtonPushed(app, event)
            app.Q_MEditField_Opt.Value=app.Q_MEditField.Value;
            app.A_MEditField_Opt.Value=app.A_MEditField.Value;
            app.B_MEditField_Opt.Value=app.B_MEditField.Value;
            app.R_MEditField_Opt.Value=app.R_MEditField.Value;
            app.K_MEditField_Opt.Value=app.K_MEditField.Value;
            app.E0_MEditField_Opt.Value=app.E0_MEditField.Value;
            app.InitialSOC_EditField_Opt.Value=app.InitialSOC_EditField.Value;
            app.MinSOC_EditField_Opt.Value=app.MinSOC_EditField.Value;
        end

        % Button pushed function: CalculateapproxmassButton
        function CalculateapproxmassButtonPushed(app, event)
            
        %Perhaps make it so it can take from the edit fields?
        
        app.MasskgEditField.Value=batteryMass(app,app.Q_fullEditField.Value,app.V_fullEditField.Value);
%           app.MasskgEditField.Value=batteryMass(app,max(app.q),max(app.v));
            app.batt_mass=app.MasskgEditField.Value;
        end

        % Button pushed function: ZeroCancelMassButton
        function ZeroCancelMassButtonPushed(app, event)
            app.MasskgEditField.Value=0;
            app.batt_mass=app.MasskgEditField.Value;
        end

        % Button pushed function: CalculateapproxmassButton_2
        function CalculateapproxmassButton_2Pushed(app, event)
            app.MasskgEditField.Value=batteryMass(app,max(app.q),max(app.v));
            app.batt_mass=app.MasskgEditField.Value;
        end

        % Callback function
        function MinimizeSSEButtonPushed(app, event)
            Minimize_SSE(app);
        end

        % Button pushed function: TruncateButton
        function TruncateButtonPushed(app, event)
            Truncate(app)
            
            
            
           
        end

        % Button pushed function: Q_MButton
        function Q_MButtonPushed(app, event)
            
            assignin('base','Q_M_App',app.Q_MEditField.Value);
        end

        % Button pushed function: A_MButton
        function A_MButtonPushed(app, event)
            
            assignin('base','A_M_App',app.A_MEditField.Value);
        end

        % Button pushed function: B_MButton
        function B_MButtonPushed(app, event)
                        
            assignin('base','B_M_App',app.B_MEditField.Value);
        end

        % Button pushed function: R_MButton
        function R_MButtonPushed(app, event)
                        
            assignin('base','R_M_App',app.R_MEditField.Value);
        end

        % Button pushed function: K_MButton
        function K_MButtonPushed(app, event)
                        
            assignin('base','K_M_App',app.K_MEditField.Value);
        end

        % Button pushed function: E0_MButton
        function E0_MButtonPushed(app, event)
                        
            assignin('base','E0_M_App',app.E0_MEditField.Value);
        end

        % Button pushed function: V_fullButton
        function V_fullButtonPushed(app, event)
                        
            assignin('base','V_full_App',app.V_fullEditField.Value);
        end

        % Button pushed function: V_expButton
        function V_expButtonPushed(app, event)
                        
            assignin('base','V_exp_App',app.V_expEditField.Value);
        end

        % Button pushed function: V_nomButton
        function V_nomButtonPushed(app, event)
                        
            assignin('base','V_nom_App',app.V_nomEditField.Value);
        end

        % Button pushed function: Q_fullButton
        function Q_fullButtonPushed(app, event)
                        
            assignin('base','Q_full_App',app.Q_fullEditField.Value);
        end

        % Button pushed function: Q_expButton
        function Q_expButtonPushed(app, event)
                        
            assignin('base','Q_exp_App',app.Q_fullEditField.Value);
        end

        % Button pushed function: Q_nomButton
        function Q_nomButtonPushed(app, event)
                        
            assignin('base','Q_nom_App',app.Q_fullEditField.Value);
        end

        % Button pushed function: SSEButton
        function SSEButtonPushed(app, event)
                        
            assignin('base','SSE_App',app.SSE_EditField.Value);
        end

        % Button pushed function: R2Button
        function R2ButtonPushed(app, event)
                        
            assignin('base','R2_App',app.R2_EditField.Value);
        end

        % Button pushed function: ApproxMassButton
        function ApproxMassButtonPushed(app, event)
                        
            assignin('base','Batt_mass_App',app.MasskgEditField.Value);
        end

        % Button pushed function: EfficiencyButton
        function EfficiencyButtonPushed(app, event)
            assignin('base','Efficiency_App',app.EfficiencyEditField.Value);
        end

        % Button pushed function: ExportAllButton
        function ExportAllButtonPushed(app, event)
            Q_MButtonPushed(app);
            A_MButtonPushed(app);
            B_MButtonPushed(app);
            R_MButtonPushed(app);
            K_MButtonPushed(app);
            E0_MButtonPushed(app);
            V_fullButtonPushed(app);V_expButtonPushed(app);
            V_nomButtonPushed(app);
            Q_fullButtonPushed(app);
            Q_expButtonPushed(app);
            Q_nomButtonPushed(app);
            SSEButtonPushed(app);
            R2ButtonPushed(app);
            ApproxMassButtonPushed(app);
            EfficiencyButtonPushed(app);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 841 844];
            app.UIFigure.Name = 'UI Figure';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [1 18 841 817];

            % Create CalculateParametersfromDischargeCurveTab
            app.CalculateParametersfromDischargeCurveTab = uitab(app.TabGroup);
            app.CalculateParametersfromDischargeCurveTab.Title = 'Calculate Parameters from Discharge Curve';

            % Create TextArea
            app.TextArea = uitextarea(app.CalculateParametersfromDischargeCurveTab);
            app.TextArea.Editable = 'off';
            app.TextArea.BackgroundColor = [0.9412 0.9412 0.9412];
            app.TextArea.Position = [601 146 130 142];
            app.TextArea.Value = {'Ref Photo:'; ''; 'Raszmann, Emma & Baker, Kyri & Shi, Ying & Christensen, Dane. (2017). Modeling stationary lithium-ion batteries for optimization and predictive control. 1-7. 10.1109/PECI.2017.7935755.'};

            % Create UserBatteryCharacteristicsPanel
            app.UserBatteryCharacteristicsPanel = uipanel(app.CalculateParametersfromDischargeCurveTab);
            app.UserBatteryCharacteristicsPanel.TitlePosition = 'centertop';
            app.UserBatteryCharacteristicsPanel.Title = 'User Battery Characteristics';
            app.UserBatteryCharacteristicsPanel.Position = [16 398 231 382];

            % Create V_fullEditFieldLabel
            app.V_fullEditFieldLabel = uilabel(app.UserBatteryCharacteristicsPanel);
            app.V_fullEditFieldLabel.HorizontalAlignment = 'right';
            app.V_fullEditFieldLabel.Position = [51 319 35 22];
            app.V_fullEditFieldLabel.Text = 'V_full';

            % Create V_fullEditField
            app.V_fullEditField = uieditfield(app.UserBatteryCharacteristicsPanel, 'numeric');
            app.V_fullEditField.Position = [101 319 100 22];
            app.V_fullEditField.Value = 4.18;

            % Create V_expEditFieldLabel
            app.V_expEditFieldLabel = uilabel(app.UserBatteryCharacteristicsPanel);
            app.V_expEditFieldLabel.HorizontalAlignment = 'right';
            app.V_expEditFieldLabel.Position = [47 298 39 22];
            app.V_expEditFieldLabel.Text = 'V_exp';

            % Create V_expEditField
            app.V_expEditField = uieditfield(app.UserBatteryCharacteristicsPanel, 'numeric');
            app.V_expEditField.Position = [101 298 100 22];
            app.V_expEditField.Value = 3.515;

            % Create V_nomEditFieldLabel
            app.V_nomEditFieldLabel = uilabel(app.UserBatteryCharacteristicsPanel);
            app.V_nomEditFieldLabel.HorizontalAlignment = 'right';
            app.V_nomEditFieldLabel.Position = [43 277 43 22];
            app.V_nomEditFieldLabel.Text = 'V_nom';

            % Create V_nomEditField
            app.V_nomEditField = uieditfield(app.UserBatteryCharacteristicsPanel, 'numeric');
            app.V_nomEditField.Position = [101 277 100 22];
            app.V_nomEditField.Value = 3.35;

            % Create Q_fullEditFieldLabel
            app.Q_fullEditFieldLabel = uilabel(app.UserBatteryCharacteristicsPanel);
            app.Q_fullEditFieldLabel.HorizontalAlignment = 'right';
            app.Q_fullEditFieldLabel.Position = [49 256 37 22];
            app.Q_fullEditFieldLabel.Text = 'Q_full';

            % Create Q_fullEditField
            app.Q_fullEditField = uieditfield(app.UserBatteryCharacteristicsPanel, 'numeric');
            app.Q_fullEditField.Position = [101 256 100 22];
            app.Q_fullEditField.Value = 31;

            % Create Q_expEditField_2Label
            app.Q_expEditField_2Label = uilabel(app.UserBatteryCharacteristicsPanel);
            app.Q_expEditField_2Label.HorizontalAlignment = 'right';
            app.Q_expEditField_2Label.Position = [45 235 41 22];
            app.Q_expEditField_2Label.Text = 'Q_exp';

            % Create Q_expEditField
            app.Q_expEditField = uieditfield(app.UserBatteryCharacteristicsPanel, 'numeric');
            app.Q_expEditField.Position = [101 235 100 22];
            app.Q_expEditField.Value = 22.5;

            % Create Q_nomEditField_2Label
            app.Q_nomEditField_2Label = uilabel(app.UserBatteryCharacteristicsPanel);
            app.Q_nomEditField_2Label.HorizontalAlignment = 'right';
            app.Q_nomEditField_2Label.Position = [41 214 45 22];
            app.Q_nomEditField_2Label.Text = 'Q_nom';

            % Create Q_nomEditField
            app.Q_nomEditField = uieditfield(app.UserBatteryCharacteristicsPanel, 'numeric');
            app.Q_nomEditField.Position = [101 214 100 22];
            app.Q_nomEditField.Value = 29.2;

            % Create EfficiencyEditFieldLabel
            app.EfficiencyEditFieldLabel = uilabel(app.UserBatteryCharacteristicsPanel);
            app.EfficiencyEditFieldLabel.HorizontalAlignment = 'right';
            app.EfficiencyEditFieldLabel.Position = [30 193 56 22];
            app.EfficiencyEditFieldLabel.Text = 'Efficiency';

            % Create EfficiencyEditField
            app.EfficiencyEditField = uieditfield(app.UserBatteryCharacteristicsPanel, 'numeric');
            app.EfficiencyEditField.Position = [101 193 100 22];
            app.EfficiencyEditField.Value = 99.99;

            % Create OpenReferenceImageButton
            app.OpenReferenceImageButton = uibutton(app.UserBatteryCharacteristicsPanel, 'push');
            app.OpenReferenceImageButton.ButtonPushedFcn = createCallbackFcn(app, @OpenReferenceImageButtonPushed, true);
            app.OpenReferenceImageButton.BackgroundColor = [0.8 0.8 0.8];
            app.OpenReferenceImageButton.Position = [46 158 140 22];
            app.OpenReferenceImageButton.Text = 'Open Reference Image';

            % Create ApplytoPlotsButton
            app.ApplytoPlotsButton = uibutton(app.UserBatteryCharacteristicsPanel, 'push');
            app.ApplytoPlotsButton.ButtonPushedFcn = createCallbackFcn(app, @ApplytoPlotsButtonPushed, true);
            app.ApplytoPlotsButton.BackgroundColor = [0.9412 0.5922 0.5922];
            app.ApplytoPlotsButton.Position = [46 129 140 22];
            app.ApplytoPlotsButton.Text = 'Apply to Plots';

            % Create MinimizeRMSEButton
            app.MinimizeRMSEButton = uibutton(app.UserBatteryCharacteristicsPanel, 'push');
            app.MinimizeRMSEButton.ButtonPushedFcn = createCallbackFcn(app, @MinimizeRMSEButtonPushed, true);
            app.MinimizeRMSEButton.BackgroundColor = [0.302 0.7451 0.9333];
            app.MinimizeRMSEButton.Position = [31 99 170 23];
            app.MinimizeRMSEButton.Text = 'Minimize RMSE';

            % Create RMSE_ErrorMessage
            app.RMSE_ErrorMessage = uitextarea(app.UserBatteryCharacteristicsPanel);
            app.RMSE_ErrorMessage.Editable = 'off';
            app.RMSE_ErrorMessage.BackgroundColor = [0.9412 0.9412 0.9412];
            app.RMSE_ErrorMessage.Position = [24 46 184 46];

            % Create UseOptimizetabratherthanRMSEIfOptimizefailstryRMSELabel
            app.UseOptimizetabratherthanRMSEIfOptimizefailstryRMSELabel = uilabel(app.UserBatteryCharacteristicsPanel);
            app.UseOptimizetabratherthanRMSEIfOptimizefailstryRMSELabel.HorizontalAlignment = 'center';
            app.UseOptimizetabratherthanRMSEIfOptimizefailstryRMSELabel.Position = [10 10 206 27];
            app.UseOptimizetabratherthanRMSEIfOptimizefailstryRMSELabel.Text = {'(Use Optimize tab rather than RMSE)'; 'If Optimize fails, try RMSE'};

            % Create ModelParametersPanel
            app.ModelParametersPanel = uipanel(app.CalculateParametersfromDischargeCurveTab);
            app.ModelParametersPanel.TitlePosition = 'centertop';
            app.ModelParametersPanel.Title = 'Model Parameters';
            app.ModelParametersPanel.Position = [16 218 230 181];

            % Create Q_MEditField_2Label
            app.Q_MEditField_2Label = uilabel(app.ModelParametersPanel);
            app.Q_MEditField_2Label.HorizontalAlignment = 'right';
            app.Q_MEditField_2Label.Position = [59 128 31 22];
            app.Q_MEditField_2Label.Text = 'Q_M';

            % Create Q_MEditField_2
            app.Q_MEditField_2 = uieditfield(app.ModelParametersPanel, 'numeric');
            app.Q_MEditField_2.Editable = 'off';
            app.Q_MEditField_2.BackgroundColor = [0.902 0.902 0.902];
            app.Q_MEditField_2.Position = [105 128 100 22];

            % Create K_MEditField_2Label
            app.K_MEditField_2Label = uilabel(app.ModelParametersPanel);
            app.K_MEditField_2Label.HorizontalAlignment = 'right';
            app.K_MEditField_2Label.Position = [60 44 30 22];
            app.K_MEditField_2Label.Text = 'K_M';

            % Create K_MEditField_2
            app.K_MEditField_2 = uieditfield(app.ModelParametersPanel, 'numeric');
            app.K_MEditField_2.Editable = 'off';
            app.K_MEditField_2.BackgroundColor = [0.902 0.902 0.902];
            app.K_MEditField_2.Position = [105 44 100 22];

            % Create A_MEditField_2Label
            app.A_MEditField_2Label = uilabel(app.ModelParametersPanel);
            app.A_MEditField_2Label.HorizontalAlignment = 'right';
            app.A_MEditField_2Label.Position = [60 107 30 22];
            app.A_MEditField_2Label.Text = 'A_M';

            % Create A_MEditField_2
            app.A_MEditField_2 = uieditfield(app.ModelParametersPanel, 'numeric');
            app.A_MEditField_2.Editable = 'off';
            app.A_MEditField_2.BackgroundColor = [0.902 0.902 0.902];
            app.A_MEditField_2.Position = [105 107 100 22];

            % Create B_MEditField_2Label
            app.B_MEditField_2Label = uilabel(app.ModelParametersPanel);
            app.B_MEditField_2Label.HorizontalAlignment = 'right';
            app.B_MEditField_2Label.Position = [60 86 30 22];
            app.B_MEditField_2Label.Text = 'B_M';

            % Create B_MEditField_2
            app.B_MEditField_2 = uieditfield(app.ModelParametersPanel, 'numeric');
            app.B_MEditField_2.Editable = 'off';
            app.B_MEditField_2.BackgroundColor = [0.902 0.902 0.902];
            app.B_MEditField_2.Position = [105 86 100 22];

            % Create R_MEditField_2Label
            app.R_MEditField_2Label = uilabel(app.ModelParametersPanel);
            app.R_MEditField_2Label.HorizontalAlignment = 'right';
            app.R_MEditField_2Label.Position = [59 65 31 22];
            app.R_MEditField_2Label.Text = 'R_M';

            % Create R_MEditField_2
            app.R_MEditField_2 = uieditfield(app.ModelParametersPanel, 'numeric');
            app.R_MEditField_2.Editable = 'off';
            app.R_MEditField_2.BackgroundColor = [0.902 0.902 0.902];
            app.R_MEditField_2.Position = [105 65 100 22];

            % Create E0_MEditField_2Label
            app.E0_MEditField_2Label = uilabel(app.ModelParametersPanel);
            app.E0_MEditField_2Label.HorizontalAlignment = 'right';
            app.E0_MEditField_2Label.Position = [53 23 37 22];
            app.E0_MEditField_2Label.Text = 'E0_M';

            % Create E0_MEditField_2
            app.E0_MEditField_2 = uieditfield(app.ModelParametersPanel, 'numeric');
            app.E0_MEditField_2.Editable = 'off';
            app.E0_MEditField_2.BackgroundColor = [0.902 0.902 0.902];
            app.E0_MEditField_2.Position = [105 23 100 22];

            % Create DischargeDataPanel
            app.DischargeDataPanel = uipanel(app.CalculateParametersfromDischargeCurveTab);
            app.DischargeDataPanel.TitlePosition = 'centertop';
            app.DischargeDataPanel.Title = 'Discharge Data:';
            app.DischargeDataPanel.Position = [16 146 231 73];

            % Create AvgCurrentEditFieldLabel
            app.AvgCurrentEditFieldLabel = uilabel(app.DischargeDataPanel);
            app.AvgCurrentEditFieldLabel.HorizontalAlignment = 'right';
            app.AvgCurrentEditFieldLabel.Position = [21 28 69 22];
            app.AvgCurrentEditFieldLabel.Text = 'Avg Current';

            % Create AvgCurrentEditField
            app.AvgCurrentEditField = uieditfield(app.DischargeDataPanel, 'numeric');
            app.AvgCurrentEditField.Editable = 'off';
            app.AvgCurrentEditField.BackgroundColor = [0.902 0.902 0.902];
            app.AvgCurrentEditField.Position = [105 28 100 22];

            % Create CRateEditFieldLabel
            app.CRateEditFieldLabel = uilabel(app.DischargeDataPanel);
            app.CRateEditFieldLabel.HorizontalAlignment = 'right';
            app.CRateEditFieldLabel.Position = [47 7 43 22];
            app.CRateEditFieldLabel.Text = 'C Rate';

            % Create CRateEditField
            app.CRateEditField = uieditfield(app.DischargeDataPanel, 'numeric');
            app.CRateEditField.Editable = 'off';
            app.CRateEditField.BackgroundColor = [0.902 0.902 0.902];
            app.CRateEditField.Position = [105 7 100 22];
            app.CRateEditField.Value = 1;

            % Create BaseWorkspaceVariablesPanel
            app.BaseWorkspaceVariablesPanel = uipanel(app.CalculateParametersfromDischargeCurveTab);
            app.BaseWorkspaceVariablesPanel.Title = 'Base Workspace Variables:';
            app.BaseWorkspaceVariablesPanel.Position = [245 146 357 276];

            % Create VoltagevoltsLabel
            app.VoltagevoltsLabel = uilabel(app.BaseWorkspaceVariablesPanel);
            app.VoltagevoltsLabel.HorizontalAlignment = 'right';
            app.VoltagevoltsLabel.Position = [50 222 82 22];
            app.VoltagevoltsLabel.Text = 'Voltage (volts)';

            % Create voltageBWS
            app.voltageBWS = uieditfield(app.BaseWorkspaceVariablesPanel, 'text');
            app.voltageBWS.Position = [147 222 180 22];

            % Create CapacityAhLabel
            app.CapacityAhLabel = uilabel(app.BaseWorkspaceVariablesPanel);
            app.CapacityAhLabel.HorizontalAlignment = 'right';
            app.CapacityAhLabel.Position = [54 201 78 22];
            app.CapacityAhLabel.Text = 'Capacity (Ah)';

            % Create capacityBWS
            app.capacityBWS = uieditfield(app.BaseWorkspaceVariablesPanel, 'text');
            app.capacityBWS.Position = [147 201 180 22];

            % Create RetrieveButton
            app.RetrieveButton = uibutton(app.BaseWorkspaceVariablesPanel, 'push');
            app.RetrieveButton.ButtonPushedFcn = createCallbackFcn(app, @RetrieveButtonPushed, true);
            app.RetrieveButton.BackgroundColor = [0.302 0.7451 0.9333];
            app.RetrieveButton.Position = [187 134 100 22];
            app.RetrieveButton.Text = {'Retrieve '; ''};

            % Create V_expLabel
            app.V_expLabel = uilabel(app.BaseWorkspaceVariablesPanel);
            app.V_expLabel.HorizontalAlignment = 'right';
            app.V_expLabel.Position = [122 92 50 22];
            app.V_expLabel.Text = 'V_exp%';

            % Create V_exp_percent
            app.V_exp_percent = uieditfield(app.BaseWorkspaceVariablesPanel, 'numeric');
            app.V_exp_percent.Limits = [0 100];
            app.V_exp_percent.Position = [187 92 100 22];
            app.V_exp_percent.Value = 15;

            % Create V_nomLabel
            app.V_nomLabel = uilabel(app.BaseWorkspaceVariablesPanel);
            app.V_nomLabel.HorizontalAlignment = 'right';
            app.V_nomLabel.Position = [118 71 54 22];
            app.V_nomLabel.Text = 'V_nom%';

            % Create V_nom_percent
            app.V_nom_percent = uieditfield(app.BaseWorkspaceVariablesPanel, 'numeric');
            app.V_nom_percent.Limits = [0 100];
            app.V_nom_percent.Position = [187 71 100 22];
            app.V_nom_percent.Value = 25;

            % Create TimesecLabel
            app.TimesecLabel = uilabel(app.BaseWorkspaceVariablesPanel);
            app.TimesecLabel.HorizontalAlignment = 'right';
            app.TimesecLabel.Position = [70 180 62 22];
            app.TimesecLabel.Text = 'Time (sec)';

            % Create timeBWS
            app.timeBWS = uieditfield(app.BaseWorkspaceVariablesPanel, 'text');
            app.timeBWS.Position = [147 180 180 22];

            % Create DischargeCurrentALabel
            app.DischargeCurrentALabel = uilabel(app.BaseWorkspaceVariablesPanel);
            app.DischargeCurrentALabel.HorizontalAlignment = 'right';
            app.DischargeCurrentALabel.Position = [10 159 122 22];
            app.DischargeCurrentALabel.Text = 'Discharge Current (A)';

            % Create currentBWS
            app.currentBWS = uieditfield(app.BaseWorkspaceVariablesPanel, 'text');
            app.currentBWS.Position = [147 159 180 22];

            % Create TextArea_2
            app.TextArea_2 = uitextarea(app.BaseWorkspaceVariablesPanel);
            app.TextArea_2.Editable = 'off';
            app.TextArea_2.BackgroundColor = [0.902 0.902 0.902];
            app.TextArea_2.Position = [105 12 222 37];
            app.TextArea_2.Value = {'V_exp = V_full - (V_exp%*V_full)/100'; 'V_nom = V_full - (V_nom%*V_full)/100'};

            % Create D3Ax
            app.D3Ax = uiaxes(app.CalculateParametersfromDischargeCurveTab);
            title(app.D3Ax, 'Discharge')
            xlabel(app.D3Ax, 'X')
            ylabel(app.D3Ax, 'Voltage (volts)')
            app.D3Ax.PlotBoxAspectRatio = [1.80222841225627 1 1];
            app.D3Ax.Position = [247 434 565 350];

            % Create ControlsPanel_3
            app.ControlsPanel_3 = uipanel(app.CalculateParametersfromDischargeCurveTab);
            app.ControlsPanel_3.TitlePosition = 'centertop';
            app.ControlsPanel_3.Title = 'Controls';
            app.ControlsPanel_3.Position = [601 287 229 135];

            % Create V_expKnobLabel
            app.V_expKnobLabel = uilabel(app.ControlsPanel_3);
            app.V_expKnobLabel.HorizontalAlignment = 'center';
            app.V_expKnobLabel.Position = [23 14 54 22];
            app.V_expKnobLabel.Text = 'V_exp %';

            % Create V_expKnob
            app.V_expKnob = uiknob(app.ControlsPanel_3, 'continuous');
            app.V_expKnob.ValueChangedFcn = createCallbackFcn(app, @V_expKnobValueChanged, true);
            app.V_expKnob.Position = [27 51 46 46];
            app.V_expKnob.Value = 15;

            % Create V_nomKnobLabel
            app.V_nomKnobLabel = uilabel(app.ControlsPanel_3);
            app.V_nomKnobLabel.HorizontalAlignment = 'center';
            app.V_nomKnobLabel.Position = [131 14 58 22];
            app.V_nomKnobLabel.Text = 'V_nom %';

            % Create V_nomKnob
            app.V_nomKnob = uiknob(app.ControlsPanel_3, 'continuous');
            app.V_nomKnob.ValueChangedFcn = createCallbackFcn(app, @V_nomKnobValueChanged, true);
            app.V_nomKnob.Position = [143 51 46 46];
            app.V_nomKnob.Value = 25;

            % Create XAxisPanel_2
            app.XAxisPanel_2 = uipanel(app.CalculateParametersfromDischargeCurveTab);
            app.XAxisPanel_2.TitlePosition = 'centertop';
            app.XAxisPanel_2.Title = 'X-Axis';
            app.XAxisPanel_2.Position = [730 145 100 143];

            % Create D3AxSw
            app.D3AxSw = uiswitch(app.XAxisPanel_2, 'rocker');
            app.D3AxSw.Items = {'Capacity', 'Time'};
            app.D3AxSw.ValueChangedFcn = createCallbackFcn(app, @D3AxSwValueChanged, true);
            app.D3AxSw.Enable = 'off';
            app.D3AxSw.Position = [43 49 20 45];
            app.D3AxSw.Value = 'Capacity';

            % Create TruncateDataPointsPanel
            app.TruncateDataPointsPanel = uipanel(app.CalculateParametersfromDischargeCurveTab);
            app.TruncateDataPointsPanel.Title = 'Truncate Data Points';
            app.TruncateDataPointsPanel.Position = [494 0 336 146];

            % Create MinSOCEditFieldLabel
            app.MinSOCEditFieldLabel = uilabel(app.TruncateDataPointsPanel);
            app.MinSOCEditFieldLabel.HorizontalAlignment = 'right';
            app.MinSOCEditFieldLabel.Position = [16 90 54 22];
            app.MinSOCEditFieldLabel.Text = 'Min SOC';

            % Create MinSOCEditField
            app.MinSOCEditField = uieditfield(app.TruncateDataPointsPanel, 'numeric');
            app.MinSOCEditField.Position = [85 90 100 22];

            % Create MaxSOCEditFieldLabel
            app.MaxSOCEditFieldLabel = uilabel(app.TruncateDataPointsPanel);
            app.MaxSOCEditFieldLabel.HorizontalAlignment = 'right';
            app.MaxSOCEditFieldLabel.Position = [13 51 58 22];
            app.MaxSOCEditFieldLabel.Text = 'Max SOC';

            % Create MaxSOCEditField
            app.MaxSOCEditField = uieditfield(app.TruncateDataPointsPanel, 'numeric');
            app.MaxSOCEditField.Position = [86 51 100 22];
            app.MaxSOCEditField.Value = 100;

            % Create TruncateButton
            app.TruncateButton = uibutton(app.TruncateDataPointsPanel, 'push');
            app.TruncateButton.ButtonPushedFcn = createCallbackFcn(app, @TruncateButtonPushed, true);
            app.TruncateButton.Position = [226 50 100 62];
            app.TruncateButton.Text = 'Truncate';

            % Create PercDecrSettingsPanel
            app.PercDecrSettingsPanel = uipanel(app.CalculateParametersfromDischargeCurveTab);
            app.PercDecrSettingsPanel.Title = 'PercDecr Settings ';
            app.PercDecrSettingsPanel.Position = [16 0 262 146];

            % Create NOTEPercDecr2shouldbegreaterthanPercDecr1Label_3
            app.NOTEPercDecr2shouldbegreaterthanPercDecr1Label_3 = uilabel(app.PercDecrSettingsPanel);
            app.NOTEPercDecr2shouldbegreaterthanPercDecr1Label_3.HorizontalAlignment = 'center';
            app.NOTEPercDecr2shouldbegreaterthanPercDecr1Label_3.FontSize = 8;
            app.NOTEPercDecr2shouldbegreaterthanPercDecr1Label_3.Position = [7 -7 244 90];
            app.NOTEPercDecr2shouldbegreaterthanPercDecr1Label_3.Text = {'NOTE: these are parameters for the RMSE minimizer. '; 'PercDecr2 should be greater than PercDecr1. Small values will '; 'cause problems due to large arrays being created, especially with '; 'PercDecr2. MATLAB will have to create at least two'; 'arrays with (1/PercDecr1)^2 elements and at'; 'least one with (1/PercDecr2)^5 elements.'; 'Range is between 0 and 1.'};

            % Create PercDecr1EditFieldLabel
            app.PercDecr1EditFieldLabel = uilabel(app.PercDecrSettingsPanel);
            app.PercDecr1EditFieldLabel.HorizontalAlignment = 'right';
            app.PercDecr1EditFieldLabel.Position = [68 103 62 22];
            app.PercDecr1EditFieldLabel.Text = 'PercDecr1';

            % Create PercDecr1EditField
            app.PercDecr1EditField = uieditfield(app.PercDecrSettingsPanel, 'numeric');
            app.PercDecr1EditField.Limits = [0 1];
            app.PercDecr1EditField.HorizontalAlignment = 'center';
            app.PercDecr1EditField.Position = [75 82 48 22];
            app.PercDecr1EditField.Value = 0.01;

            % Create PercDecr2EditFieldLabel
            app.PercDecr2EditFieldLabel = uilabel(app.PercDecrSettingsPanel);
            app.PercDecr2EditFieldLabel.HorizontalAlignment = 'right';
            app.PercDecr2EditFieldLabel.Position = [137 103 62 22];
            app.PercDecr2EditFieldLabel.Text = 'PercDecr2';

            % Create PercDecr2EditField
            app.PercDecr2EditField = uieditfield(app.PercDecrSettingsPanel, 'numeric');
            app.PercDecr2EditField.Limits = [0 1];
            app.PercDecr2EditField.HorizontalAlignment = 'center';
            app.PercDecr2EditField.Position = [143 82 51 22];
            app.PercDecr2EditField.Value = 0.1;

            % Create RMSEDomainsettingsPanel
            app.RMSEDomainsettingsPanel = uipanel(app.CalculateParametersfromDischargeCurveTab);
            app.RMSEDomainsettingsPanel.Title = 'RMSE Domain settings';
            app.RMSEDomainsettingsPanel.Position = [277 0 218 147];

            % Create NOTEPercDecr2shouldbegreaterthanPercDecr1Label_4
            app.NOTEPercDecr2shouldbegreaterthanPercDecr1Label_4 = uilabel(app.RMSEDomainsettingsPanel);
            app.NOTEPercDecr2shouldbegreaterthanPercDecr1Label_4.HorizontalAlignment = 'center';
            app.NOTEPercDecr2shouldbegreaterthanPercDecr1Label_4.FontSize = 8;
            app.NOTEPercDecr2shouldbegreaterthanPercDecr1Label_4.Position = [18 23 194 40];
            app.NOTEPercDecr2shouldbegreaterthanPercDecr1Label_4.Text = {'The RMSE and only the RMSE will be calculated'; 'between these two SOCs for minimization'; 'purposes. This reduces the influence of the "cliff."'};

            % Create RMSEMinDomainEditFieldLabel
            app.RMSEMinDomainEditFieldLabel = uilabel(app.RMSEDomainsettingsPanel);
            app.RMSEMinDomainEditFieldLabel.HorizontalAlignment = 'center';
            app.RMSEMinDomainEditFieldLabel.Position = [40 96 63 27];
            app.RMSEMinDomainEditFieldLabel.Text = {'RMSE Min'; 'Domain'};

            % Create RMSEMinDomainEditField
            app.RMSEMinDomainEditField = uieditfield(app.RMSEDomainsettingsPanel, 'numeric');
            app.RMSEMinDomainEditField.Limits = [0 100];
            app.RMSEMinDomainEditField.HorizontalAlignment = 'center';
            app.RMSEMinDomainEditField.Position = [48 62 48 22];

            % Create RMSEMaxDomainEditFieldLabel
            app.RMSEMaxDomainEditFieldLabel = uilabel(app.RMSEDomainsettingsPanel);
            app.RMSEMaxDomainEditFieldLabel.HorizontalAlignment = 'center';
            app.RMSEMaxDomainEditFieldLabel.Position = [134 96 66 27];
            app.RMSEMaxDomainEditFieldLabel.Text = {'RMSE Max'; 'Domain'};

            % Create RMSEMaxDomainEditField
            app.RMSEMaxDomainEditField = uieditfield(app.RMSEDomainsettingsPanel, 'numeric');
            app.RMSEMaxDomainEditField.Limits = [0 100];
            app.RMSEMaxDomainEditField.HorizontalAlignment = 'center';
            app.RMSEMaxDomainEditField.Position = [141 62 51 22];
            app.RMSEMaxDomainEditField.Value = 100;

            % Create ElectricalCharacteristicsTab
            app.ElectricalCharacteristicsTab = uitab(app.TabGroup);
            app.ElectricalCharacteristicsTab.Title = 'Electrical Characteristics';

            % Create ParameterValuesPanel
            app.ParameterValuesPanel = uipanel(app.ElectricalCharacteristicsTab);
            app.ParameterValuesPanel.Title = '          Parameter Values';
            app.ParameterValuesPanel.BackgroundColor = [0.9412 0.9412 0.9412];
            app.ParameterValuesPanel.Position = [650 618 150 172];

            % Create Q_MEditFieldLabel
            app.Q_MEditFieldLabel = uilabel(app.ParameterValuesPanel);
            app.Q_MEditFieldLabel.HorizontalAlignment = 'right';
            app.Q_MEditFieldLabel.Position = [14 117 31 22];
            app.Q_MEditFieldLabel.Text = 'Q_M';

            % Create Q_MEditField
            app.Q_MEditField = uieditfield(app.ParameterValuesPanel, 'numeric');
            app.Q_MEditField.Limits = [0 Inf];
            app.Q_MEditField.ValueChangedFcn = createCallbackFcn(app, @Q_MEditFieldValueChanged, true);
            app.Q_MEditField.Position = [60 117 77 22];
            app.Q_MEditField.Value = 35;

            % Create A_MEditFieldLabel
            app.A_MEditFieldLabel = uilabel(app.ParameterValuesPanel);
            app.A_MEditFieldLabel.HorizontalAlignment = 'right';
            app.A_MEditFieldLabel.Position = [15 96 30 22];
            app.A_MEditFieldLabel.Text = 'A_M';

            % Create A_MEditField
            app.A_MEditField = uieditfield(app.ParameterValuesPanel, 'numeric');
            app.A_MEditField.Limits = [0 Inf];
            app.A_MEditField.ValueChangedFcn = createCallbackFcn(app, @A_MEditFieldValueChanged, true);
            app.A_MEditField.Position = [60 96 77 22];
            app.A_MEditField.Value = 2;

            % Create B_MEditFieldLabel
            app.B_MEditFieldLabel = uilabel(app.ParameterValuesPanel);
            app.B_MEditFieldLabel.HorizontalAlignment = 'right';
            app.B_MEditFieldLabel.Position = [15 75 30 22];
            app.B_MEditFieldLabel.Text = 'B_M';

            % Create B_MEditField
            app.B_MEditField = uieditfield(app.ParameterValuesPanel, 'numeric');
            app.B_MEditField.Limits = [0 Inf];
            app.B_MEditField.ValueChangedFcn = createCallbackFcn(app, @B_MEditFieldValueChanged, true);
            app.B_MEditField.Position = [60 75 77 22];
            app.B_MEditField.Value = 0.21;

            % Create R_MEditFieldLabel
            app.R_MEditFieldLabel = uilabel(app.ParameterValuesPanel);
            app.R_MEditFieldLabel.HorizontalAlignment = 'right';
            app.R_MEditFieldLabel.Position = [14 56 31 22];
            app.R_MEditFieldLabel.Text = 'R_M';

            % Create R_MEditField
            app.R_MEditField = uieditfield(app.ParameterValuesPanel, 'numeric');
            app.R_MEditField.Limits = [0 Inf];
            app.R_MEditField.ValueChangedFcn = createCallbackFcn(app, @R_MEditFieldValueChanged, true);
            app.R_MEditField.Position = [60 56 77 22];
            app.R_MEditField.Value = 0.001;

            % Create K_MEditFieldLabel
            app.K_MEditFieldLabel = uilabel(app.ParameterValuesPanel);
            app.K_MEditFieldLabel.HorizontalAlignment = 'right';
            app.K_MEditFieldLabel.Position = [15 35 30 22];
            app.K_MEditFieldLabel.Text = 'K_M';

            % Create K_MEditField
            app.K_MEditField = uieditfield(app.ParameterValuesPanel, 'numeric');
            app.K_MEditField.Limits = [0 Inf];
            app.K_MEditField.ValueChangedFcn = createCallbackFcn(app, @K_MEditFieldValueChanged, true);
            app.K_MEditField.Position = [60 35 77 22];
            app.K_MEditField.Value = 0.0002;

            % Create E0_MEditFieldLabel
            app.E0_MEditFieldLabel = uilabel(app.ParameterValuesPanel);
            app.E0_MEditFieldLabel.HorizontalAlignment = 'right';
            app.E0_MEditFieldLabel.Position = [8 14 37 22];
            app.E0_MEditFieldLabel.Text = 'E0_M';

            % Create E0_MEditField
            app.E0_MEditField = uieditfield(app.ParameterValuesPanel, 'numeric');
            app.E0_MEditField.Limits = [0 Inf];
            app.E0_MEditField.ValueChangedFcn = createCallbackFcn(app, @E0_MEditFieldValueChanged, true);
            app.E0_MEditField.Position = [60 14 77 22];
            app.E0_MEditField.Value = 24;

            % Create DischargePlot
            app.DischargePlot = uiaxes(app.ElectricalCharacteristicsTab);
            title(app.DischargePlot, 'Battery Discharge')
            xlabel(app.DischargePlot, 'X')
            ylabel(app.DischargePlot, 'Battery Voltage (Volts)')
            app.DischargePlot.PlotBoxAspectRatio = [2.10492505353319 1 1];
            app.DischargePlot.GridColor = [0 0 1];
            app.DischargePlot.GridAlpha = 0.15;
            app.DischargePlot.XGrid = 'on';
            app.DischargePlot.XMinorGrid = 'on';
            app.DischargePlot.YGrid = 'on';
            app.DischargePlot.Position = [4 34 834 429];

            % Create ControlsPanel
            app.ControlsPanel = uipanel(app.ElectricalCharacteristicsTab);
            app.ControlsPanel.TitlePosition = 'centertop';
            app.ControlsPanel.Title = 'Controls';
            app.ControlsPanel.Position = [1 618 650 172];

            % Create PolarizationResistanceConstantK_MKnobLabel
            app.PolarizationResistanceConstantK_MKnobLabel = uilabel(app.ControlsPanel);
            app.PolarizationResistanceConstantK_MKnobLabel.HorizontalAlignment = 'center';
            app.PolarizationResistanceConstantK_MKnobLabel.FontSize = 10;
            app.PolarizationResistanceConstantK_MKnobLabel.Position = [9 42 98 34];
            app.PolarizationResistanceConstantK_MKnobLabel.Text = {'Polarization'; 'Resistance Constant'; 'K_M'};

            % Create PolarizationResistanceConstantK_MKnob
            app.PolarizationResistanceConstantK_MKnob = uiknob(app.ControlsPanel, 'continuous');
            app.PolarizationResistanceConstantK_MKnob.Limits = [0 0.1];
            app.PolarizationResistanceConstantK_MKnob.ValueChangedFcn = createCallbackFcn(app, @PolarizationResistanceConstantK_MKnobValueChanged, true);
            app.PolarizationResistanceConstantK_MKnob.Position = [38 95 39 39];
            app.PolarizationResistanceConstantK_MKnob.Value = 0.0002;

            % Create BatteryInternalResistanceR_MKnob
            app.BatteryInternalResistanceR_MKnob = uiknob(app.ControlsPanel, 'continuous');
            app.BatteryInternalResistanceR_MKnob.Limits = [0 1];
            app.BatteryInternalResistanceR_MKnob.ValueChangedFcn = createCallbackFcn(app, @BatteryInternalResistanceR_MKnobValueChanged, true);
            app.BatteryInternalResistanceR_MKnob.Position = [145 95 39 39];
            app.BatteryInternalResistanceR_MKnob.Value = 0.001;

            % Create BatteryInternalResistanceR_MKnobLabel
            app.BatteryInternalResistanceR_MKnobLabel = uilabel(app.ControlsPanel);
            app.BatteryInternalResistanceR_MKnobLabel.HorizontalAlignment = 'center';
            app.BatteryInternalResistanceR_MKnobLabel.FontSize = 10;
            app.BatteryInternalResistanceR_MKnobLabel.Position = [127 47 73 34];
            app.BatteryInternalResistanceR_MKnobLabel.Text = {'Battery Internal'; 'Resistance'; 'R_M'};

            % Create BatteryCapacityQ_MKnobLabel
            app.BatteryCapacityQ_MKnobLabel = uilabel(app.ControlsPanel);
            app.BatteryCapacityQ_MKnobLabel.HorizontalAlignment = 'center';
            app.BatteryCapacityQ_MKnobLabel.FontSize = 10;
            app.BatteryCapacityQ_MKnobLabel.Position = [566 42 44 34];
            app.BatteryCapacityQ_MKnobLabel.Text = {'Battery '; 'Capacity'; 'Q_M'};

            % Create BatteryCapacityQ_MKnob
            app.BatteryCapacityQ_MKnob = uiknob(app.ControlsPanel, 'continuous');
            app.BatteryCapacityQ_MKnob.Limits = [0.01 300];
            app.BatteryCapacityQ_MKnob.ValueChangedFcn = createCallbackFcn(app, @BatteryCapacityQ_MKnobValueChanged, true);
            app.BatteryCapacityQ_MKnob.Position = [568 91 39 39];
            app.BatteryCapacityQ_MKnob.Value = 35;

            % Create ExponentialZoneAmplitudeA_MKnobLabel
            app.ExponentialZoneAmplitudeA_MKnobLabel = uilabel(app.ControlsPanel);
            app.ExponentialZoneAmplitudeA_MKnobLabel.HorizontalAlignment = 'center';
            app.ExponentialZoneAmplitudeA_MKnobLabel.FontSize = 10;
            app.ExponentialZoneAmplitudeA_MKnobLabel.Position = [226 39 89 41];
            app.ExponentialZoneAmplitudeA_MKnobLabel.Text = {'Exponential'; 'Zone Amplitude'; 'A_M'};

            % Create ExponentialZoneAmplitudeA_MKnob
            app.ExponentialZoneAmplitudeA_MKnob = uiknob(app.ControlsPanel, 'continuous');
            app.ExponentialZoneAmplitudeA_MKnob.Limits = [0 10];
            app.ExponentialZoneAmplitudeA_MKnob.ValueChangedFcn = createCallbackFcn(app, @ExponentialZoneAmplitudeA_MKnobValueChanged, true);
            app.ExponentialZoneAmplitudeA_MKnob.Position = [251 95 39 39];
            app.ExponentialZoneAmplitudeA_MKnob.Value = 2;

            % Create ExponentialZoneTimeConstantInverseB_MKnobLabel
            app.ExponentialZoneTimeConstantInverseB_MKnobLabel = uilabel(app.ControlsPanel);
            app.ExponentialZoneTimeConstantInverseB_MKnobLabel.HorizontalAlignment = 'center';
            app.ExponentialZoneTimeConstantInverseB_MKnobLabel.FontSize = 10;
            app.ExponentialZoneTimeConstantInverseB_MKnobLabel.Position = [331 31 83 45];
            app.ExponentialZoneTimeConstantInverseB_MKnobLabel.Text = {'Exponential Zone'; 'Time Constant'; 'Inverse '; 'B_M'};

            % Create ExponentialZoneTimeConstantInverseB_MKnob
            app.ExponentialZoneTimeConstantInverseB_MKnob = uiknob(app.ControlsPanel, 'continuous');
            app.ExponentialZoneTimeConstantInverseB_MKnob.Limits = [0 10];
            app.ExponentialZoneTimeConstantInverseB_MKnob.ValueChangedFcn = createCallbackFcn(app, @ExponentialZoneTimeConstantInverseB_MKnobValueChanged, true);
            app.ExponentialZoneTimeConstantInverseB_MKnob.Position = [355 92 39 39];
            app.ExponentialZoneTimeConstantInverseB_MKnob.Value = 0.21;

            % Create BatteryConstantVoltageE0_MLabel
            app.BatteryConstantVoltageE0_MLabel = uilabel(app.ControlsPanel);
            app.BatteryConstantVoltageE0_MLabel.HorizontalAlignment = 'center';
            app.BatteryConstantVoltageE0_MLabel.FontSize = 10;
            app.BatteryConstantVoltageE0_MLabel.Position = [431 55 83 22];
            app.BatteryConstantVoltageE0_MLabel.Text = {'Battery Constant '; 'Voltage E0_M'};

            % Create BatteryConstantVoltageE0_MKnob
            app.BatteryConstantVoltageE0_MKnob = uiknob(app.ControlsPanel, 'continuous');
            app.BatteryConstantVoltageE0_MKnob.ValueChangedFcn = createCallbackFcn(app, @BatteryConstantVoltageE0_MKnobValueChanged, true);
            app.BatteryConstantVoltageE0_MKnob.Position = [453 92 39 39];
            app.BatteryConstantVoltageE0_MKnob.Value = 24;

            % Create Panel
            app.Panel = uipanel(app.ElectricalCharacteristicsTab);
            app.Panel.Position = [2 462 227 157];

            % Create InitialSOCLabel
            app.InitialSOCLabel = uilabel(app.Panel);
            app.InitialSOCLabel.HorizontalAlignment = 'right';
            app.InitialSOCLabel.FontSize = 10;
            app.InitialSOCLabel.Position = [88 110 71 22];
            app.InitialSOCLabel.Text = 'Initial SOC (%)';

            % Create InitialSOCSlider
            app.InitialSOCSlider = uislider(app.Panel);
            app.InitialSOCSlider.ValueChangedFcn = createCallbackFcn(app, @InitialSOCSliderValueChanged, true);
            app.InitialSOCSlider.Position = [46 97 150 3];
            app.InitialSOCSlider.Value = 100;

            % Create InitialSOC_EditField
            app.InitialSOC_EditField = uieditfield(app.Panel, 'numeric');
            app.InitialSOC_EditField.Limits = [0 100];
            app.InitialSOC_EditField.ValueChangedFcn = createCallbackFcn(app, @InitialSOC_EditFieldValueChanged, true);
            app.InitialSOC_EditField.Position = [91 31 77 22];
            app.InitialSOC_EditField.Value = 100;

            % Create Panel_2
            app.Panel_2 = uipanel(app.ElectricalCharacteristicsTab);
            app.Panel_2.Position = [228 462 227 157];

            % Create MinimumSOCLimitSliderLabel
            app.MinimumSOCLimitSliderLabel = uilabel(app.Panel_2);
            app.MinimumSOCLimitSliderLabel.HorizontalAlignment = 'right';
            app.MinimumSOCLimitSliderLabel.FontSize = 10;
            app.MinimumSOCLimitSliderLabel.Position = [63 110 113 22];
            app.MinimumSOCLimitSliderLabel.Text = 'Minimum SOC (%) Limit';

            % Create MinimumSOCLimitSlider
            app.MinimumSOCLimitSlider = uislider(app.Panel_2);
            app.MinimumSOCLimitSlider.Limits = [0.01 30];
            app.MinimumSOCLimitSlider.ValueChangedFcn = createCallbackFcn(app, @MinimumSOCLimitSliderValueChanged, true);
            app.MinimumSOCLimitSlider.Position = [41 98 150 3];
            app.MinimumSOCLimitSlider.Value = 0.5;

            % Create MinSOC_EditField
            app.MinSOC_EditField = uieditfield(app.Panel_2, 'numeric');
            app.MinSOC_EditField.Limits = [0.01 30];
            app.MinSOC_EditField.ValueChangedFcn = createCallbackFcn(app, @MinSOC_EditFieldValueChanged, true);
            app.MinSOC_EditField.Position = [75 31 77 22];
            app.MinSOC_EditField.Value = 0.5;

            % Create XAxisPanel
            app.XAxisPanel = uipanel(app.ElectricalCharacteristicsTab);
            app.XAxisPanel.TitlePosition = 'centertop';
            app.XAxisPanel.Title = 'X-Axis';
            app.XAxisPanel.Position = [454 462 100 157];

            % Create XAxisSwitch
            app.XAxisSwitch = uiswitch(app.XAxisPanel, 'rocker');
            app.XAxisSwitch.Items = {'Capacity', 'Time'};
            app.XAxisSwitch.ValueChangedFcn = createCallbackFcn(app, @XAxisSwitchValueChanged, true);
            app.XAxisSwitch.Position = [40 51 20 45];
            app.XAxisSwitch.Value = 'Capacity';

            % Create SaveElectricalandThermalParametersPanel
            app.SaveElectricalandThermalParametersPanel = uipanel(app.ElectricalCharacteristicsTab);
            app.SaveElectricalandThermalParametersPanel.TitlePosition = 'centertop';
            app.SaveElectricalandThermalParametersPanel.Title = 'Save Electrical and Thermal Parameters';
            app.SaveElectricalandThermalParametersPanel.Position = [552 462 248 157];

            % Create SavetoFileButton
            app.SavetoFileButton = uibutton(app.SaveElectricalandThermalParametersPanel, 'push');
            app.SavetoFileButton.ButtonPushedFcn = createCallbackFcn(app, @SavetoFileButtonPushed, true);
            app.SavetoFileButton.Position = [74 67 100 22];
            app.SavetoFileButton.Text = 'Save to File';

            % Create OptimizationTab
            app.OptimizationTab = uitab(app.TabGroup);
            app.OptimizationTab.Title = 'Optimization';
            app.OptimizationTab.Scrollable = 'on';

            % Create ImportDatafromElectricalCharacteristicsButton
            app.ImportDatafromElectricalCharacteristicsButton = uibutton(app.OptimizationTab, 'push');
            app.ImportDatafromElectricalCharacteristicsButton.ButtonPushedFcn = createCallbackFcn(app, @ImportDatafromElectricalCharacteristicsButtonPushed, true);
            app.ImportDatafromElectricalCharacteristicsButton.Position = [35 666 242 74];
            app.ImportDatafromElectricalCharacteristicsButton.Text = 'Import Data from Electrical Characteristics';

            % Create OptPlot
            app.OptPlot = uiaxes(app.OptimizationTab);
            title(app.OptPlot, 'Battery Optimization Regression')
            xlabel(app.OptPlot, '')
            ylabel(app.OptPlot, '')
            app.OptPlot.PlotBoxAspectRatio = [1.97156398104265 1 1];
            app.OptPlot.Position = [65 84 713 393];

            % Create ParameterValuesPanel_Opt
            app.ParameterValuesPanel_Opt = uipanel(app.OptimizationTab);
            app.ParameterValuesPanel_Opt.TitlePosition = 'centertop';
            app.ParameterValuesPanel_Opt.Title = '          Parameter Values';
            app.ParameterValuesPanel_Opt.BackgroundColor = [0.9412 0.9412 0.9412];
            app.ParameterValuesPanel_Opt.Position = [616 538 199 227];

            % Create Q_MEditField_3Label
            app.Q_MEditField_3Label = uilabel(app.ParameterValuesPanel_Opt);
            app.Q_MEditField_3Label.HorizontalAlignment = 'right';
            app.Q_MEditField_3Label.Position = [75 173 31 22];
            app.Q_MEditField_3Label.Text = 'Q_M';

            % Create Q_MEditField_Opt
            app.Q_MEditField_Opt = uieditfield(app.ParameterValuesPanel_Opt, 'numeric');
            app.Q_MEditField_Opt.Limits = [0 Inf];
            app.Q_MEditField_Opt.Editable = 'off';
            app.Q_MEditField_Opt.BackgroundColor = [0.902 0.902 0.902];
            app.Q_MEditField_Opt.Position = [121 173 77 22];

            % Create A_MEditField_3Label
            app.A_MEditField_3Label = uilabel(app.ParameterValuesPanel_Opt);
            app.A_MEditField_3Label.HorizontalAlignment = 'right';
            app.A_MEditField_3Label.Position = [76 152 30 22];
            app.A_MEditField_3Label.Text = 'A_M';

            % Create A_MEditField_Opt
            app.A_MEditField_Opt = uieditfield(app.ParameterValuesPanel_Opt, 'numeric');
            app.A_MEditField_Opt.Limits = [0 Inf];
            app.A_MEditField_Opt.Editable = 'off';
            app.A_MEditField_Opt.BackgroundColor = [0.902 0.902 0.902];
            app.A_MEditField_Opt.Position = [121 152 77 22];

            % Create B_MEditField_3Label
            app.B_MEditField_3Label = uilabel(app.ParameterValuesPanel_Opt);
            app.B_MEditField_3Label.HorizontalAlignment = 'right';
            app.B_MEditField_3Label.Position = [76 131 30 22];
            app.B_MEditField_3Label.Text = 'B_M';

            % Create B_MEditField_Opt
            app.B_MEditField_Opt = uieditfield(app.ParameterValuesPanel_Opt, 'numeric');
            app.B_MEditField_Opt.Limits = [0 Inf];
            app.B_MEditField_Opt.Editable = 'off';
            app.B_MEditField_Opt.BackgroundColor = [0.902 0.902 0.902];
            app.B_MEditField_Opt.Position = [121 131 77 22];

            % Create R_MEditField_3Label
            app.R_MEditField_3Label = uilabel(app.ParameterValuesPanel_Opt);
            app.R_MEditField_3Label.HorizontalAlignment = 'right';
            app.R_MEditField_3Label.Position = [75 112 31 22];
            app.R_MEditField_3Label.Text = 'R_M';

            % Create R_MEditField_Opt
            app.R_MEditField_Opt = uieditfield(app.ParameterValuesPanel_Opt, 'numeric');
            app.R_MEditField_Opt.Limits = [0 Inf];
            app.R_MEditField_Opt.Editable = 'off';
            app.R_MEditField_Opt.BackgroundColor = [0.902 0.902 0.902];
            app.R_MEditField_Opt.Position = [121 112 77 22];

            % Create K_MEditField_3Label
            app.K_MEditField_3Label = uilabel(app.ParameterValuesPanel_Opt);
            app.K_MEditField_3Label.HorizontalAlignment = 'right';
            app.K_MEditField_3Label.Position = [76 91 30 22];
            app.K_MEditField_3Label.Text = 'K_M';

            % Create K_MEditField_Opt
            app.K_MEditField_Opt = uieditfield(app.ParameterValuesPanel_Opt, 'numeric');
            app.K_MEditField_Opt.Limits = [0 Inf];
            app.K_MEditField_Opt.Editable = 'off';
            app.K_MEditField_Opt.BackgroundColor = [0.902 0.902 0.902];
            app.K_MEditField_Opt.Position = [121 91 77 22];

            % Create E0_MEditField_3Label
            app.E0_MEditField_3Label = uilabel(app.ParameterValuesPanel_Opt);
            app.E0_MEditField_3Label.HorizontalAlignment = 'right';
            app.E0_MEditField_3Label.Position = [69 70 37 22];
            app.E0_MEditField_3Label.Text = 'E0_M';

            % Create E0_MEditField_Opt
            app.E0_MEditField_Opt = uieditfield(app.ParameterValuesPanel_Opt, 'numeric');
            app.E0_MEditField_Opt.Limits = [0 Inf];
            app.E0_MEditField_Opt.Editable = 'off';
            app.E0_MEditField_Opt.BackgroundColor = [0.902 0.902 0.902];
            app.E0_MEditField_Opt.Position = [121 70 77 22];

            % Create InitialSOC_EditField_Opt
            app.InitialSOC_EditField_Opt = uieditfield(app.ParameterValuesPanel_Opt, 'numeric');
            app.InitialSOC_EditField_Opt.Limits = [0 100];
            app.InitialSOC_EditField_Opt.Editable = 'off';
            app.InitialSOC_EditField_Opt.BackgroundColor = [0.902 0.902 0.902];
            app.InitialSOC_EditField_Opt.Position = [1 8 77 22];
            app.InitialSOC_EditField_Opt.Value = 100;

            % Create StartingSOCLabel
            app.StartingSOCLabel = uilabel(app.ParameterValuesPanel_Opt);
            app.StartingSOCLabel.HorizontalAlignment = 'center';
            app.StartingSOCLabel.Position = [1 31 77 22];
            app.StartingSOCLabel.Text = 'Starting SOC';

            % Create MinSOC_EditField_Opt
            app.MinSOC_EditField_Opt = uieditfield(app.ParameterValuesPanel_Opt, 'numeric');
            app.MinSOC_EditField_Opt.Limits = [0.01 30];
            app.MinSOC_EditField_Opt.Editable = 'off';
            app.MinSOC_EditField_Opt.BackgroundColor = [0.902 0.902 0.902];
            app.MinSOC_EditField_Opt.Position = [121 10 77 22];
            app.MinSOC_EditField_Opt.Value = 0.5;

            % Create MinSOCLimitLabel
            app.MinSOCLimitLabel = uilabel(app.ParameterValuesPanel_Opt);
            app.MinSOCLimitLabel.HorizontalAlignment = 'center';
            app.MinSOCLimitLabel.Position = [116 33 86 22];
            app.MinSOCLimitLabel.Text = 'Min. SOC Limit';

            % Create PlotUserDataButton
            app.PlotUserDataButton = uibutton(app.OptimizationTab, 'push');
            app.PlotUserDataButton.ButtonPushedFcn = createCallbackFcn(app, @PlotUserDataButtonPushed, true);
            app.PlotUserDataButton.Position = [287 666 94 74];
            app.PlotUserDataButton.Text = 'Plot User Data';

            % Create ToedituseElectricalCharacteristicstabthenimportLabel
            app.ToedituseElectricalCharacteristicstabthenimportLabel = uilabel(app.OptimizationTab);
            app.ToedituseElectricalCharacteristicstabthenimportLabel.HorizontalAlignment = 'center';
            app.ToedituseElectricalCharacteristicstabthenimportLabel.FontSize = 16;
            app.ToedituseElectricalCharacteristicstabthenimportLabel.FontColor = [1 0 0];
            app.ToedituseElectricalCharacteristicstabthenimportLabel.Position = [588 470 253 55];
            app.ToedituseElectricalCharacteristicstabthenimportLabel.Text = {'To edit the above values, use'; 'Electrical Characteristics tab,'; 'then import'};

            % Create FindRegressionButton
            app.FindRegressionButton = uibutton(app.OptimizationTab, 'push');
            app.FindRegressionButton.ButtonPushedFcn = createCallbackFcn(app, @FindRegressionButtonPushed, true);
            app.FindRegressionButton.FontSize = 24;
            app.FindRegressionButton.FontWeight = 'bold';
            app.FindRegressionButton.Position = [35 583 346 64];
            app.FindRegressionButton.Text = 'Find Regression';

            % Create PleaseeditonlyintheElectricalCharacteristicstabLabel
            app.PleaseeditonlyintheElectricalCharacteristicstabLabel = uilabel(app.OptimizationTab);
            app.PleaseeditonlyintheElectricalCharacteristicstabLabel.FontWeight = 'bold';
            app.PleaseeditonlyintheElectricalCharacteristicstabLabel.FontColor = [0.149 0.149 0.149];
            app.PleaseeditonlyintheElectricalCharacteristicstabLabel.Position = [392 553 176 225];
            app.PleaseeditonlyintheElectricalCharacteristicstabLabel.Text = {'Directions:'; '-Make sure you have '; '"applied to plot" in Calculate'; 'Parameters from'; 'Discharge Curve.'; '-Then click both '; 'the import and plot '; 'buttons in this tab.'; ''; 'Warnings:'; '-Have only one C value'; '-Make sure x-axis '; 'is set to capacity!'; '-Very low values of'; 'SOC_min may cause '; 'problems.'};

            % Create StatisticalDisplayPanel
            app.StatisticalDisplayPanel = uipanel(app.OptimizationTab);
            app.StatisticalDisplayPanel.TitlePosition = 'centertop';
            app.StatisticalDisplayPanel.Title = 'Statistical Display';
            app.StatisticalDisplayPanel.Position = [105 486 207 83];

            % Create SSE_EditField
            app.SSE_EditField = uieditfield(app.StatisticalDisplayPanel, 'numeric');
            app.SSE_EditField.Limits = [0 100];
            app.SSE_EditField.Editable = 'off';
            app.SSE_EditField.HorizontalAlignment = 'center';
            app.SSE_EditField.BackgroundColor = [0.902 0.902 0.902];
            app.SSE_EditField.Position = [13 7 77 22];

            % Create SSELabel
            app.SSELabel = uilabel(app.StatisticalDisplayPanel);
            app.SSELabel.HorizontalAlignment = 'center';
            app.SSELabel.Position = [13 32 77 22];
            app.SSELabel.Text = 'SSE';

            % Create R2_EditField
            app.R2_EditField = uieditfield(app.StatisticalDisplayPanel, 'numeric');
            app.R2_EditField.Limits = [0.01 30];
            app.R2_EditField.Editable = 'off';
            app.R2_EditField.BackgroundColor = [0.902 0.902 0.902];
            app.R2_EditField.Position = [118 7 77 22];
            app.R2_EditField.Value = 0.01;

            % Create R2Label
            app.R2Label = uilabel(app.StatisticalDisplayPanel);
            app.R2Label.HorizontalAlignment = 'center';
            app.R2Label.Position = [143 32 27 22];
            app.R2Label.Text = 'R^2';

            % Create ClearAxesButton
            app.ClearAxesButton = uibutton(app.OptimizationTab, 'push');
            app.ClearAxesButton.ButtonPushedFcn = createCallbackFcn(app, @ClearAxesButtonPushed, true);
            app.ClearAxesButton.FontWeight = 'bold';
            app.ClearAxesButton.Position = [325 28 188 34];
            app.ClearAxesButton.Text = 'Clear Axes';

            % Create ExportParameterstoElectricalCharacteristicsButton
            app.ExportParameterstoElectricalCharacteristicsButton = uibutton(app.OptimizationTab, 'push');
            app.ExportParameterstoElectricalCharacteristicsButton.ButtonPushedFcn = createCallbackFcn(app, @ExportParameterstoElectricalCharacteristicsButtonPushed, true);
            app.ExportParameterstoElectricalCharacteristicsButton.FontSize = 14;
            app.ExportParameterstoElectricalCharacteristicsButton.FontWeight = 'bold';
            app.ExportParameterstoElectricalCharacteristicsButton.Position = [380 493 188 56];
            app.ExportParameterstoElectricalCharacteristicsButton.Text = {'Export Parameters to'; 'Electrical Characteristics'};

            % Create MassTab
            app.MassTab = uitab(app.TabGroup);
            app.MassTab.Title = 'Mass';

            % Create CalculateapproxmassButton
            app.CalculateapproxmassButton = uibutton(app.MassTab, 'push');
            app.CalculateapproxmassButton.ButtonPushedFcn = createCallbackFcn(app, @CalculateapproxmassButtonPushed, true);
            app.CalculateapproxmassButton.Position = [318 696 203 68];
            app.CalculateapproxmassButton.Text = {'Calculate approx. mass'; '(using edit fields from Calculate'; 'Parameters from Discharge Curve)'};

            % Create MasskgEditFieldLabel
            app.MasskgEditFieldLabel = uilabel(app.MassTab);
            app.MasskgEditFieldLabel.HorizontalAlignment = 'right';
            app.MasskgEditFieldLabel.Position = [391 611 55 22];
            app.MasskgEditFieldLabel.Text = 'Mass(kg)';

            % Create MasskgEditField
            app.MasskgEditField = uieditfield(app.MassTab, 'numeric');
            app.MasskgEditField.Editable = 'off';
            app.MasskgEditField.BackgroundColor = [0.902 0.902 0.902];
            app.MasskgEditField.Position = [369 590 100 22];

            % Create ZeroCancelMassButton
            app.ZeroCancelMassButton = uibutton(app.MassTab, 'push');
            app.ZeroCancelMassButton.ButtonPushedFcn = createCallbackFcn(app, @ZeroCancelMassButtonPushed, true);
            app.ZeroCancelMassButton.Position = [348 525 142 31];
            app.ZeroCancelMassButton.Text = 'Zero/Cancel Mass';

            % Create PleaseeditonlyintheElectricalCharacteristicstabLabel_2
            app.PleaseeditonlyintheElectricalCharacteristicstabLabel_2 = uilabel(app.MassTab);
            app.PleaseeditonlyintheElectricalCharacteristicstabLabel_2.HorizontalAlignment = 'center';
            app.PleaseeditonlyintheElectricalCharacteristicstabLabel_2.FontWeight = 'bold';
            app.PleaseeditonlyintheElectricalCharacteristicstabLabel_2.FontColor = [0.149 0.149 0.149];
            app.PleaseeditonlyintheElectricalCharacteristicstabLabel_2.Position = [246 291 352 225];
            app.PleaseeditonlyintheElectricalCharacteristicstabLabel_2.Text = {'Mass is a function of full voltage and'; 'full capacity, calculcated using a linear'; 'regression of a selection of real batteries.'; 'This tab calculates using the Q_full and V_full values'; 'in Calculate Parameters from Discharge Curve, or using'; 'the maximums of the user''s discharge curves.'; ''; 'Zeroing the mass will keep the app from exporting the mass'; 'to the file along with other parameters.'; ''; ''};

            % Create CalculateapproxmassButton_2
            app.CalculateapproxmassButton_2 = uibutton(app.MassTab, 'push');
            app.CalculateapproxmassButton_2.ButtonPushedFcn = createCallbackFcn(app, @CalculateapproxmassButton_2Pushed, true);
            app.CalculateapproxmassButton_2.Position = [314 643 211 36];
            app.CalculateapproxmassButton_2.Text = {'Calculate approx. mass'; '(using maximums of imported curve)'};

            % Create CRateTab
            app.CRateTab = uitab(app.TabGroup);
            app.CRateTab.Title = 'C Rate';

            % Create CRateTextArea
            app.CRateTextArea = uitextarea(app.CRateTab);
            app.CRateTextArea.Editable = 'off';
            app.CRateTextArea.BackgroundColor = [0.9412 0.9412 0.9412];
            app.CRateTextArea.Position = [72 553 150 227];
            app.CRateTextArea.Value = {'Battery Capacities are typically rated per Amp-hour at a discharge rate of 1C. For example, a battery rated at 20 Ah will be completely discharged in one hour by a current of 20 Amps. This is a discharge rate of 1C.'; ''; 'Select different C rates to the right to compare their effects on your discharge curve.'};

            % Create DischargePlot_2
            app.DischargePlot_2 = uiaxes(app.CRateTab);
            title(app.DischargePlot_2, 'Battery Discharge')
            xlabel(app.DischargePlot_2, 'X')
            ylabel(app.DischargePlot_2, 'Battery Voltage (Volts)')
            app.DischargePlot_2.PlotBoxAspectRatio = [2.2027972027972 1 1];
            app.DischargePlot_2.GridColor = [0 0 1];
            app.DischargePlot_2.GridAlpha = 0.15;
            app.DischargePlot_2.XGrid = 'on';
            app.DischargePlot_2.XMinorGrid = 'on';
            app.DischargePlot_2.YGrid = 'on';
            app.DischargePlot_2.Position = [19 103 804 399];

            % Create CRatePanel
            app.CRatePanel = uipanel(app.CRateTab);
            app.CRatePanel.TitlePosition = 'centertop';
            app.CRatePanel.Title = 'C Rate';
            app.CRatePanel.Position = [222 553 447 227];

            % Create ConstantDischargeCurrentEditField_2
            app.ConstantDischargeCurrentEditField_2 = uieditfield(app.CRatePanel, 'numeric');
            app.ConstantDischargeCurrentEditField_2.Editable = 'off';
            app.ConstantDischargeCurrentEditField_2.Enable = 'off';
            app.ConstantDischargeCurrentEditField_2.Position = [132 142 100 22];

            % Create ConstantDischargeCurrentEditField_3
            app.ConstantDischargeCurrentEditField_3 = uieditfield(app.CRatePanel, 'numeric');
            app.ConstantDischargeCurrentEditField_3.Editable = 'off';
            app.ConstantDischargeCurrentEditField_3.Enable = 'off';
            app.ConstantDischargeCurrentEditField_3.Position = [132 121 100 22];

            % Create ConstantDischargeCurrentEditField_4
            app.ConstantDischargeCurrentEditField_4 = uieditfield(app.CRatePanel, 'numeric');
            app.ConstantDischargeCurrentEditField_4.Editable = 'off';
            app.ConstantDischargeCurrentEditField_4.Enable = 'off';
            app.ConstantDischargeCurrentEditField_4.Position = [132 100 100 22];

            % Create ConstantDischargeCurrentEditField_5
            app.ConstantDischargeCurrentEditField_5 = uieditfield(app.CRatePanel, 'numeric');
            app.ConstantDischargeCurrentEditField_5.Editable = 'off';
            app.ConstantDischargeCurrentEditField_5.Enable = 'off';
            app.ConstantDischargeCurrentEditField_5.Position = [132 79 100 22];

            % Create ConstantDischargeCurrentEditField_6
            app.ConstantDischargeCurrentEditField_6 = uieditfield(app.CRatePanel, 'numeric');
            app.ConstantDischargeCurrentEditField_6.Editable = 'off';
            app.ConstantDischargeCurrentEditField_6.Enable = 'off';
            app.ConstantDischargeCurrentEditField_6.Position = [132 58 100 22];

            % Create ConstantDischargeCurrentEditField_7
            app.ConstantDischargeCurrentEditField_7 = uieditfield(app.CRatePanel, 'numeric');
            app.ConstantDischargeCurrentEditField_7.Editable = 'off';
            app.ConstantDischargeCurrentEditField_7.Enable = 'off';
            app.ConstantDischargeCurrentEditField_7.Position = [132 37 100 22];

            % Create ConstantDischargeCurrentEditField_8
            app.ConstantDischargeCurrentEditField_8 = uieditfield(app.CRatePanel, 'numeric');
            app.ConstantDischargeCurrentEditField_8.Editable = 'off';
            app.ConstantDischargeCurrentEditField_8.Enable = 'off';
            app.ConstantDischargeCurrentEditField_8.Position = [132 16 100 22];

            % Create AveragePowerOutputEditField_2
            app.AveragePowerOutputEditField_2 = uieditfield(app.CRatePanel, 'numeric');
            app.AveragePowerOutputEditField_2.Editable = 'off';
            app.AveragePowerOutputEditField_2.Enable = 'off';
            app.AveragePowerOutputEditField_2.Position = [280 142 100 22];

            % Create AveragePowerOutputEditField_3
            app.AveragePowerOutputEditField_3 = uieditfield(app.CRatePanel, 'numeric');
            app.AveragePowerOutputEditField_3.Editable = 'off';
            app.AveragePowerOutputEditField_3.Enable = 'off';
            app.AveragePowerOutputEditField_3.Position = [280 121 100 22];

            % Create AveragePowerOutputEditField_4
            app.AveragePowerOutputEditField_4 = uieditfield(app.CRatePanel, 'numeric');
            app.AveragePowerOutputEditField_4.Editable = 'off';
            app.AveragePowerOutputEditField_4.Enable = 'off';
            app.AveragePowerOutputEditField_4.Position = [280 100 100 22];

            % Create AveragePowerOutputEditField_5
            app.AveragePowerOutputEditField_5 = uieditfield(app.CRatePanel, 'numeric');
            app.AveragePowerOutputEditField_5.Editable = 'off';
            app.AveragePowerOutputEditField_5.Enable = 'off';
            app.AveragePowerOutputEditField_5.Position = [280 79 100 22];

            % Create AveragePowerOutputEditField_6
            app.AveragePowerOutputEditField_6 = uieditfield(app.CRatePanel, 'numeric');
            app.AveragePowerOutputEditField_6.Editable = 'off';
            app.AveragePowerOutputEditField_6.Enable = 'off';
            app.AveragePowerOutputEditField_6.Position = [280 58 100 22];

            % Create AveragePowerOutputEditField_7
            app.AveragePowerOutputEditField_7 = uieditfield(app.CRatePanel, 'numeric');
            app.AveragePowerOutputEditField_7.Editable = 'off';
            app.AveragePowerOutputEditField_7.Enable = 'off';
            app.AveragePowerOutputEditField_7.Position = [280 37 100 22];

            % Create AveragePowerOutputEditField_8
            app.AveragePowerOutputEditField_8 = uieditfield(app.CRatePanel, 'numeric');
            app.AveragePowerOutputEditField_8.Editable = 'off';
            app.AveragePowerOutputEditField_8.Enable = 'off';
            app.AveragePowerOutputEditField_8.Position = [280 16 100 22];

            % Create C1EditFieldLabel
            app.C1EditFieldLabel = uilabel(app.CRatePanel);
            app.C1EditFieldLabel.HorizontalAlignment = 'right';
            app.C1EditFieldLabel.Position = [16 163 25 22];
            app.C1EditFieldLabel.Text = 'C1';

            % Create C1EditField
            app.C1EditField = uieditfield(app.CRatePanel, 'numeric');
            app.C1EditField.Limits = [0 Inf];
            app.C1EditField.ValueChangedFcn = createCallbackFcn(app, @C1EditFieldValueChanged, true);
            app.C1EditField.Position = [56 163 38 22];
            app.C1EditField.Value = 0.5;

            % Create C2EditFieldLabel
            app.C2EditFieldLabel = uilabel(app.CRatePanel);
            app.C2EditFieldLabel.HorizontalAlignment = 'right';
            app.C2EditFieldLabel.Position = [16 142 25 22];
            app.C2EditFieldLabel.Text = 'C2';

            % Create C2EditField
            app.C2EditField = uieditfield(app.CRatePanel, 'numeric');
            app.C2EditField.Limits = [0 Inf];
            app.C2EditField.ValueChangedFcn = createCallbackFcn(app, @C1EditFieldValueChanged, true);
            app.C2EditField.Enable = 'off';
            app.C2EditField.Position = [56 142 38 22];
            app.C2EditField.Value = 0.6;

            % Create C3EditFieldLabel
            app.C3EditFieldLabel = uilabel(app.CRatePanel);
            app.C3EditFieldLabel.HorizontalAlignment = 'right';
            app.C3EditFieldLabel.Position = [16 121 25 22];
            app.C3EditFieldLabel.Text = 'C3';

            % Create C3EditField
            app.C3EditField = uieditfield(app.CRatePanel, 'numeric');
            app.C3EditField.Limits = [0 Inf];
            app.C3EditField.ValueChangedFcn = createCallbackFcn(app, @C1EditFieldValueChanged, true);
            app.C3EditField.Enable = 'off';
            app.C3EditField.Position = [56 121 38 22];
            app.C3EditField.Value = 0.7;

            % Create C4EditFieldLabel
            app.C4EditFieldLabel = uilabel(app.CRatePanel);
            app.C4EditFieldLabel.HorizontalAlignment = 'right';
            app.C4EditFieldLabel.Position = [16 100 25 22];
            app.C4EditFieldLabel.Text = 'C4';

            % Create C4EditField
            app.C4EditField = uieditfield(app.CRatePanel, 'numeric');
            app.C4EditField.Limits = [0 Inf];
            app.C4EditField.ValueChangedFcn = createCallbackFcn(app, @C1EditFieldValueChanged, true);
            app.C4EditField.Enable = 'off';
            app.C4EditField.Position = [56 100 38 22];
            app.C4EditField.Value = 0.8;

            % Create C5EditFieldLabel
            app.C5EditFieldLabel = uilabel(app.CRatePanel);
            app.C5EditFieldLabel.HorizontalAlignment = 'right';
            app.C5EditFieldLabel.Position = [16 79 25 22];
            app.C5EditFieldLabel.Text = 'C5';

            % Create C5EditField
            app.C5EditField = uieditfield(app.CRatePanel, 'numeric');
            app.C5EditField.Limits = [0 Inf];
            app.C5EditField.ValueChangedFcn = createCallbackFcn(app, @C1EditFieldValueChanged, true);
            app.C5EditField.Enable = 'off';
            app.C5EditField.Position = [56 79 38 22];
            app.C5EditField.Value = 0.9;

            % Create C6EditFieldLabel
            app.C6EditFieldLabel = uilabel(app.CRatePanel);
            app.C6EditFieldLabel.HorizontalAlignment = 'right';
            app.C6EditFieldLabel.Position = [16 58 25 22];
            app.C6EditFieldLabel.Text = 'C6';

            % Create C6EditField
            app.C6EditField = uieditfield(app.CRatePanel, 'numeric');
            app.C6EditField.Limits = [0 Inf];
            app.C6EditField.ValueChangedFcn = createCallbackFcn(app, @C1EditFieldValueChanged, true);
            app.C6EditField.Enable = 'off';
            app.C6EditField.Position = [56 58 38 22];
            app.C6EditField.Value = 1;

            % Create C7EditFieldLabel
            app.C7EditFieldLabel = uilabel(app.CRatePanel);
            app.C7EditFieldLabel.HorizontalAlignment = 'right';
            app.C7EditFieldLabel.Position = [16 37 25 22];
            app.C7EditFieldLabel.Text = 'C7';

            % Create C7EditField
            app.C7EditField = uieditfield(app.CRatePanel, 'numeric');
            app.C7EditField.Limits = [0 Inf];
            app.C7EditField.ValueChangedFcn = createCallbackFcn(app, @C1EditFieldValueChanged, true);
            app.C7EditField.Enable = 'off';
            app.C7EditField.Position = [56 37 38 22];
            app.C7EditField.Value = 1.1;

            % Create C8EditFieldLabel
            app.C8EditFieldLabel = uilabel(app.CRatePanel);
            app.C8EditFieldLabel.HorizontalAlignment = 'right';
            app.C8EditFieldLabel.Position = [16 16 25 22];
            app.C8EditFieldLabel.Text = 'C8';

            % Create C8EditField
            app.C8EditField = uieditfield(app.CRatePanel, 'numeric');
            app.C8EditField.Limits = [0 Inf];
            app.C8EditField.ValueChangedFcn = createCallbackFcn(app, @C1EditFieldValueChanged, true);
            app.C8EditField.Enable = 'off';
            app.C8EditField.Position = [56 16 38 22];
            app.C8EditField.Value = 1.2;

            % Create ConstantDischargeCurrentAEditFieldLabel
            app.ConstantDischargeCurrentAEditFieldLabel = uilabel(app.CRatePanel);
            app.ConstantDischargeCurrentAEditFieldLabel.HorizontalAlignment = 'right';
            app.ConstantDischargeCurrentAEditFieldLabel.Position = [85 184 174 22];
            app.ConstantDischargeCurrentAEditFieldLabel.Text = 'Constant Discharge Current (A)';

            % Create ConstantDischargeCurrentEditField_1
            app.ConstantDischargeCurrentEditField_1 = uieditfield(app.CRatePanel, 'numeric');
            app.ConstantDischargeCurrentEditField_1.Editable = 'off';
            app.ConstantDischargeCurrentEditField_1.Position = [132 163 100 22];

            % Create AveragePowerOutputWEditFieldLabel
            app.AveragePowerOutputWEditFieldLabel = uilabel(app.CRatePanel);
            app.AveragePowerOutputWEditFieldLabel.HorizontalAlignment = 'right';
            app.AveragePowerOutputWEditFieldLabel.Position = [266 184 149 22];
            app.AveragePowerOutputWEditFieldLabel.Text = 'Average Power Output (W)';

            % Create AveragePowerOutputEditField_1
            app.AveragePowerOutputEditField_1 = uieditfield(app.CRatePanel, 'numeric');
            app.AveragePowerOutputEditField_1.Editable = 'off';
            app.AveragePowerOutputEditField_1.Position = [280 163 100 22];

            % Create ControlsPanel_2
            app.ControlsPanel_2 = uipanel(app.CRateTab);
            app.ControlsPanel_2.TitlePosition = 'centertop';
            app.ControlsPanel_2.Title = 'Controls';
            app.ControlsPanel_2.Position = [668 553 167 227];

            % Create XAxisSwitch_2Label
            app.XAxisSwitch_2Label = uilabel(app.ControlsPanel_2);
            app.XAxisSwitch_2Label.HorizontalAlignment = 'center';
            app.XAxisSwitch_2Label.Position = [66 1 40 22];
            app.XAxisSwitch_2Label.Text = 'X-Axis';

            % Create XAxisSwitch_2
            app.XAxisSwitch_2 = uiswitch(app.ControlsPanel_2, 'rocker');
            app.XAxisSwitch_2.Items = {'Capacity', 'Time'};
            app.XAxisSwitch_2.ValueChangedFcn = createCallbackFcn(app, @XAxisSwitch_2ValueChanged, true);
            app.XAxisSwitch_2.Position = [75 45 20 45];
            app.XAxisSwitch_2.Value = 'Capacity';

            % Create AddRateButton
            app.AddRateButton = uibutton(app.ControlsPanel_2, 'push');
            app.AddRateButton.ButtonPushedFcn = createCallbackFcn(app, @AddRateButtonPushed, true);
            app.AddRateButton.Position = [34 163 100 22];
            app.AddRateButton.Text = 'Add Rate';

            % Create RemoveRateButton
            app.RemoveRateButton = uibutton(app.ControlsPanel_2, 'push');
            app.RemoveRateButton.ButtonPushedFcn = createCallbackFcn(app, @RemoveRateButtonPushed, true);
            app.RemoveRateButton.Position = [34 142 100 22];
            app.RemoveRateButton.Text = 'Remove Rate';

            % Create ExporttoBaseWorkspaceTab
            app.ExporttoBaseWorkspaceTab = uitab(app.TabGroup);
            app.ExporttoBaseWorkspaceTab.Title = 'Export to Base Workspace';

            % Create ElectricalCharacteristicsPanel
            app.ElectricalCharacteristicsPanel = uipanel(app.ExporttoBaseWorkspaceTab);
            app.ElectricalCharacteristicsPanel.Title = 'Electrical Characteristics';
            app.ElectricalCharacteristicsPanel.Position = [43 72 260 655];

            % Create Q_MButton
            app.Q_MButton = uibutton(app.ElectricalCharacteristicsPanel, 'push');
            app.Q_MButton.ButtonPushedFcn = createCallbackFcn(app, @Q_MButtonPushed, true);
            app.Q_MButton.Position = [80 562 100 46];
            app.Q_MButton.Text = 'Q_M';

            % Create A_MButton
            app.A_MButton = uibutton(app.ElectricalCharacteristicsPanel, 'push');
            app.A_MButton.ButtonPushedFcn = createCallbackFcn(app, @A_MButtonPushed, true);
            app.A_MButton.Position = [80 479 100 46];
            app.A_MButton.Text = 'A_M';

            % Create B_MButton
            app.B_MButton = uibutton(app.ElectricalCharacteristicsPanel, 'push');
            app.B_MButton.ButtonPushedFcn = createCallbackFcn(app, @B_MButtonPushed, true);
            app.B_MButton.Position = [80 396 100 46];
            app.B_MButton.Text = 'B_M';

            % Create R_MButton
            app.R_MButton = uibutton(app.ElectricalCharacteristicsPanel, 'push');
            app.R_MButton.ButtonPushedFcn = createCallbackFcn(app, @R_MButtonPushed, true);
            app.R_MButton.Position = [80 313 100 46];
            app.R_MButton.Text = 'R_M';

            % Create K_MButton
            app.K_MButton = uibutton(app.ElectricalCharacteristicsPanel, 'push');
            app.K_MButton.ButtonPushedFcn = createCallbackFcn(app, @K_MButtonPushed, true);
            app.K_MButton.Position = [80 230 100 46];
            app.K_MButton.Text = 'K_M';

            % Create E0_MButton
            app.E0_MButton = uibutton(app.ElectricalCharacteristicsPanel, 'push');
            app.E0_MButton.ButtonPushedFcn = createCallbackFcn(app, @E0_MButtonPushed, true);
            app.E0_MButton.Position = [80 147 100 46];
            app.E0_MButton.Text = 'E0_M';

            % Create MassPanel
            app.MassPanel = uipanel(app.ExporttoBaseWorkspaceTab);
            app.MassPanel.Title = 'Mass';
            app.MassPanel.Position = [561 385 260 127];

            % Create ApproxMassButton
            app.ApproxMassButton = uibutton(app.MassPanel, 'push');
            app.ApproxMassButton.ButtonPushedFcn = createCallbackFcn(app, @ApproxMassButtonPushed, true);
            app.ApproxMassButton.Position = [80 34 100 46];
            app.ApproxMassButton.Text = 'Approx. Mass';

            % Create CalculateParametersfromDischargeCurvePanel
            app.CalculateParametersfromDischargeCurvePanel = uipanel(app.ExporttoBaseWorkspaceTab);
            app.CalculateParametersfromDischargeCurvePanel.Title = 'Calculate Parameters from Discharge Curve';
            app.CalculateParametersfromDischargeCurvePanel.Position = [302 72 260 655];

            % Create V_fullButton
            app.V_fullButton = uibutton(app.CalculateParametersfromDischargeCurvePanel, 'push');
            app.V_fullButton.ButtonPushedFcn = createCallbackFcn(app, @V_fullButtonPushed, true);
            app.V_fullButton.Position = [81 562 100 46];
            app.V_fullButton.Text = 'V_full';

            % Create V_expButton
            app.V_expButton = uibutton(app.CalculateParametersfromDischargeCurvePanel, 'push');
            app.V_expButton.ButtonPushedFcn = createCallbackFcn(app, @V_expButtonPushed, true);
            app.V_expButton.Position = [81 479 100 46];
            app.V_expButton.Text = 'V_exp';

            % Create V_nomButton
            app.V_nomButton = uibutton(app.CalculateParametersfromDischargeCurvePanel, 'push');
            app.V_nomButton.ButtonPushedFcn = createCallbackFcn(app, @V_nomButtonPushed, true);
            app.V_nomButton.Position = [81 396 100 46];
            app.V_nomButton.Text = 'V_nom';

            % Create Q_fullButton
            app.Q_fullButton = uibutton(app.CalculateParametersfromDischargeCurvePanel, 'push');
            app.Q_fullButton.ButtonPushedFcn = createCallbackFcn(app, @Q_fullButtonPushed, true);
            app.Q_fullButton.Position = [81 313 100 46];
            app.Q_fullButton.Text = 'Q_full';

            % Create Q_expButton
            app.Q_expButton = uibutton(app.CalculateParametersfromDischargeCurvePanel, 'push');
            app.Q_expButton.ButtonPushedFcn = createCallbackFcn(app, @Q_expButtonPushed, true);
            app.Q_expButton.Position = [81 230 100 46];
            app.Q_expButton.Text = 'Q_exp';

            % Create Q_nomButton
            app.Q_nomButton = uibutton(app.CalculateParametersfromDischargeCurvePanel, 'push');
            app.Q_nomButton.ButtonPushedFcn = createCallbackFcn(app, @Q_nomButtonPushed, true);
            app.Q_nomButton.Position = [81 147 100 46];
            app.Q_nomButton.Text = 'Q_nom';

            % Create EfficiencyButton
            app.EfficiencyButton = uibutton(app.CalculateParametersfromDischargeCurvePanel, 'push');
            app.EfficiencyButton.ButtonPushedFcn = createCallbackFcn(app, @EfficiencyButtonPushed, true);
            app.EfficiencyButton.Position = [81 64 100 46];
            app.EfficiencyButton.Text = 'Efficiency';

            % Create OptimizationPanel
            app.OptimizationPanel = uipanel(app.ExporttoBaseWorkspaceTab);
            app.OptimizationPanel.Title = 'Optimization';
            app.OptimizationPanel.Position = [561 513 260 214];

            % Create SSEButton
            app.SSEButton = uibutton(app.OptimizationPanel, 'push');
            app.SSEButton.ButtonPushedFcn = createCallbackFcn(app, @SSEButtonPushed, true);
            app.SSEButton.Position = [80 121 100 46];
            app.SSEButton.Text = 'SSE';

            % Create R2Button
            app.R2Button = uibutton(app.OptimizationPanel, 'push');
            app.R2Button.ButtonPushedFcn = createCallbackFcn(app, @R2ButtonPushed, true);
            app.R2Button.Position = [80 38 100 46];
            app.R2Button.Text = 'R^2';

            % Create ExportAllButton
            app.ExportAllButton = uibutton(app.ExporttoBaseWorkspaceTab, 'push');
            app.ExportAllButton.ButtonPushedFcn = createCallbackFcn(app, @ExportAllButtonPushed, true);
            app.ExportAllButton.Position = [641 302 100 46];
            app.ExportAllButton.Text = 'Export All';

            % Create ThermalCharacteristicsTab
            app.ThermalCharacteristicsTab = uitab(app.TabGroup);
            app.ThermalCharacteristicsTab.Title = 'Thermal Characteristics';

            % Create Temp_v_Time
            app.Temp_v_Time = uiaxes(app.ThermalCharacteristicsTab);
            title(app.Temp_v_Time, 'Temp vs.Time')
            xlabel(app.Temp_v_Time, 'Time (Sec)')
            ylabel(app.Temp_v_Time, 'Average Temperature (C)')
            app.Temp_v_Time.PlotBoxAspectRatio = [1.6048951048951 1 1];
            app.Temp_v_Time.GridColor = [0 0 1];
            app.Temp_v_Time.XGrid = 'on';
            app.Temp_v_Time.YGrid = 'on';
            app.Temp_v_Time.Position = [2 375 415 284];

            % Create Temp_v_Voltage
            app.Temp_v_Voltage = uiaxes(app.ThermalCharacteristicsTab);
            title(app.Temp_v_Voltage, 'Temp vs. Voltage')
            xlabel(app.Temp_v_Voltage, 'Battery Voltage (V)')
            ylabel(app.Temp_v_Voltage, 'Average Temperature (C)')
            app.Temp_v_Voltage.PlotBoxAspectRatio = [1.6048951048951 1 1];
            app.Temp_v_Voltage.GridColor = [0 0 1];
            app.Temp_v_Voltage.XGrid = 'on';
            app.Temp_v_Voltage.YGrid = 'on';
            app.Temp_v_Voltage.Position = [421 356 415 284];

            % Create R_mod
            app.R_mod = uiaxes(app.ThermalCharacteristicsTab);
            title(app.R_mod, 'R\_Mod')
            xlabel(app.R_mod, 'Time (Sec)')
            ylabel(app.R_mod, 'Internal Resistance (Ohms)')
            app.R_mod.PlotBoxAspectRatio = [1.61619718309859 1 1];
            app.R_mod.GridColor = [0 0 1];
            app.R_mod.XGrid = 'on';
            app.R_mod.YGrid = 'on';
            app.R_mod.Position = [1 20 415 284];

            % Create Q_Mod
            app.Q_Mod = uiaxes(app.ThermalCharacteristicsTab);
            title(app.Q_Mod, 'Q\_Mod')
            xlabel(app.Q_Mod, 'Time (Sec)')
            ylabel(app.Q_Mod, 'Capacity (Ah)')
            app.Q_Mod.PlotBoxAspectRatio = [1.61619718309859 1 1];
            app.Q_Mod.GridColor = [0 0 1];
            app.Q_Mod.XGrid = 'on';
            app.Q_Mod.YGrid = 'on';
            app.Q_Mod.Position = [420 20 415 284];

            % Create Panel_3
            app.Panel_3 = uipanel(app.ThermalCharacteristicsTab);
            app.Panel_3.Position = [435 671 348 113];

            % Create LumpedHeatCapacityatSurfaceJKCs_MEditFieldLabel
            app.LumpedHeatCapacityatSurfaceJKCs_MEditFieldLabel = uilabel(app.Panel_3);
            app.LumpedHeatCapacityatSurfaceJKCs_MEditFieldLabel.HorizontalAlignment = 'right';
            app.LumpedHeatCapacityatSurfaceJKCs_MEditFieldLabel.Position = [73 82 144 27];
            app.LumpedHeatCapacityatSurfaceJKCs_MEditFieldLabel.Text = {'Lumped Heat Capacity at '; 'Surface (J/K) Cs_M:'};

            % Create Cs_M
            app.Cs_M = uieditfield(app.Panel_3, 'numeric');
            app.Cs_M.Position = [232 84 100 22];
            app.Cs_M.Value = 1;

            % Create InitialSurfaceTemperatureTs_0_MEditField_3Label
            app.InitialSurfaceTemperatureTs_0_MEditField_3Label = uilabel(app.Panel_3);
            app.InitialSurfaceTemperatureTs_0_MEditField_3Label.HorizontalAlignment = 'right';
            app.InitialSurfaceTemperatureTs_0_MEditField_3Label.Position = [1 50 216 27];
            app.InitialSurfaceTemperatureTs_0_MEditField_3Label.Text = {'Convection Resistance Between'; 'Surface and Cooling Flow (K/W) Ru_M:'};

            % Create Ru_M
            app.Ru_M = uieditfield(app.Panel_3, 'numeric');
            app.Ru_M.Position = [232 50 100 22];
            app.Ru_M.Value = 1;

            % Create InitialSurfaceTemperatureCTs_0_MEditFieldLabel
            app.InitialSurfaceTemperatureCTs_0_MEditFieldLabel = uilabel(app.Panel_3);
            app.InitialSurfaceTemperatureCTs_0_MEditFieldLabel.HorizontalAlignment = 'right';
            app.InitialSurfaceTemperatureCTs_0_MEditFieldLabel.Position = [2 13 215 22];
            app.InitialSurfaceTemperatureCTs_0_MEditFieldLabel.Text = 'Initial Surface Temperature (C)Ts_0_M:';

            % Create Ts_0_M
            app.Ts_0_M = uieditfield(app.Panel_3, 'numeric');
            app.Ts_0_M.Position = [232 13 100 22];
            app.Ts_0_M.Value = 25;

            % Create Panel_4
            app.Panel_4 = uipanel(app.ThermalCharacteristicsTab);
            app.Panel_4.Position = [53 596 383 188];

            % Create Cj_M
            app.Cj_M = uieditfield(app.Panel_4, 'numeric');
            app.Cj_M.Position = [245 159 100 22];
            app.Cj_M.Value = 1;

            % Create LumpedHeatCapacityatJunctionJKCj_MLabel
            app.LumpedHeatCapacityatJunctionJKCj_MLabel = uilabel(app.Panel_4);
            app.LumpedHeatCapacityatJunctionJKCj_MLabel.HorizontalAlignment = 'right';
            app.LumpedHeatCapacityatJunctionJKCj_MLabel.Position = [86 157 144 27];
            app.LumpedHeatCapacityatJunctionJKCj_MLabel.Text = {'Lumped Heat Capacity at '; 'Junction (J/K) Cj_M:'};

            % Create Rj_M
            app.Rj_M = uieditfield(app.Panel_4, 'numeric');
            app.Rj_M.Position = [245 125 100 22];
            app.Rj_M.Value = 1;

            % Create ConductionResistanceBetweenJunctionandSurfaceRj_MLabel
            app.ConductionResistanceBetweenJunctionandSurfaceRj_MLabel = uilabel(app.Panel_4);
            app.ConductionResistanceBetweenJunctionandSurfaceRj_MLabel.BackgroundColor = [0.9412 0.9412 0.9412];
            app.ConductionResistanceBetweenJunctionandSurfaceRj_MLabel.HorizontalAlignment = 'right';
            app.ConductionResistanceBetweenJunctionandSurfaceRj_MLabel.Position = [43 125 187 27];
            app.ConductionResistanceBetweenJunctionandSurfaceRj_MLabel.Text = {'Conduction Resistance Between'; 'Junction and Surface (K/W) Rj_M:'};

            % Create InitialJunctionTemperatureCTj_0_MEditFieldLabel
            app.InitialJunctionTemperatureCTj_0_MEditFieldLabel = uilabel(app.Panel_4);
            app.InitialJunctionTemperatureCTj_0_MEditFieldLabel.HorizontalAlignment = 'right';
            app.InitialJunctionTemperatureCTj_0_MEditFieldLabel.Position = [10 88 220 22];
            app.InitialJunctionTemperatureCTj_0_MEditFieldLabel.Text = 'Initial Junction Temperature (C) Tj_0_M:';

            % Create Tj_0_M
            app.Tj_0_M = uieditfield(app.Panel_4, 'numeric');
            app.Tj_0_M.Position = [245 88 100 22];
            app.Tj_0_M.Value = 25;

            % Create AmbientTemperatureCEditFieldLabel
            app.AmbientTemperatureCEditFieldLabel = uilabel(app.Panel_4);
            app.AmbientTemperatureCEditFieldLabel.HorizontalAlignment = 'right';
            app.AmbientTemperatureCEditFieldLabel.Position = [90 54 140 22];
            app.AmbientTemperatureCEditFieldLabel.Text = 'Ambient Temperature (C)';

            % Create AmbTemp
            app.AmbTemp = uieditfield(app.Panel_4, 'numeric');
            app.AmbTemp.Position = [245 54 100 22];
            app.AmbTemp.Value = 25;

            % Create Panel_5
            app.Panel_5 = uipanel(app.ThermalCharacteristicsTab);
            app.Panel_5.Position = [435 596 348 76];

            % Create SimulateandPlotButton
            app.SimulateandPlotButton = uibutton(app.Panel_5, 'push');
            app.SimulateandPlotButton.ButtonPushedFcn = createCallbackFcn(app, @SimulateandPlotButtonPushed, true);
            app.SimulateandPlotButton.BackgroundColor = [0.302 0.7451 0.9333];
            app.SimulateandPlotButton.FontName = 'Cambria Math';
            app.SimulateandPlotButton.FontSize = 14;
            app.SimulateandPlotButton.FontWeight = 'bold';
            app.SimulateandPlotButton.Position = [124 6 100 59];
            app.SimulateandPlotButton.Text = {'Simulate '; 'and'; 'Plot'};

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Battery_Discharge_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end