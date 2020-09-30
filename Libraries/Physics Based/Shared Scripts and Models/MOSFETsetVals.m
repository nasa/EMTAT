
%MOSFETs are ordered by max drain to source current rating from low to
%high.
%Each entry correspondes to a specific MOSFET's datasheet:
%
%MOSFET.ParameterName = [
%DMN30H4D1S-1525004_(0.34), 
%PMH550UNE-1600069_(0.485),
%sihfl110-1504779_(0.96), 
%sihfr420-1534412_(1.5), 
%sihfr320-61854_(2), 
%sihd1k4n60e-1484147_(2.6),
%BUK6D385-100E-1598480_(3.7), 
%Infineon-IGT60R190D1S-DS-v03_01-EN-1500918_(8), 
%sish108dn-1509823_(11.2),
%sihb120n60e-1509846_(16), 
%sihh100n60e-1489521_(18),
%NTPF110N65S3HF-D-1522629_(19.5), 
%FDBL9406L-F085-D-1540067_(31),
%sihg039n60ef-1590140_(39), 
%sis862adn-1595693_(41.6),
%NVHL025N65S3-D-1532109_(65.8),
%Littelfuse_Discrete_MOSFETs_N-Channel_Ultra_Juncti-1595006_(76),
%Littelfuse_Discrete_MOSFETs_N-Channel_Ultra_Juncti-1595023_(86),
%NTHL033N65S3HF-D-1551501_(53),
%Littelfuse_Discrete_MOSFETs_N-Channel_Ultra_Juncti-1594970_(110),
%Littelfuse_Discrete_MOSFETs_N-Channel_Ultra_Juncti-1594959_(112),
%Littelfuse_Discrete_MOSFETs_N-Channel_Ultra_Juncti-1595030_(160)
%]

function [vals] = MOSFETsetVals(iMax,isBuck)
%Returns parameters of a real world power switching MOSFET based on
%component data sheets. The MOSFET is selected based on its required max
%current and whether the calling script is for the boost converter or buck
%converter. Parameters assigned to boost and buck converter MOSFETs are: On
%Resistance (Ron), Total Gate Charge (QgTotal), Rise Time (TRise), Fall
%Time TFall), Gate-to-Source Voltage (Vgate). 
%
%The Buck Converter MOSFET also is assigned Total Reverse Recovery Time (Trr).
%
%The Boost Converter MOSFET also is assigned Body Diode Voltage (Vdiode).

n_MOSFETs=1;
outOfIndex=0;

MOSFET.iMax = [0.34, 0.485, 0.96, 1.5, 2, 2.6, 3.7, 8, 11.2, 16, 18, 19.5, 31, 39, 41.6, 53, 65.8, 76, 86, 110, 112, 160];
MOSFET.Ron = [3.145, 0.99, 0.54, 3, 1.8, 0.13, 0.784, 0.26, 0.0041, 0.104, 0.085, 0.098, 0.0009, 0.036, 0.0057, 0.0199, 0.0092, 0.007, 0.028, 0.0062, 0.0069, 0.0024];
MOSFET.QgTotal = [4.8e-9, 0.38e-9, 8.3e-9, 19e-9, 20e-9, 5e-9, 4.5e-9, 3.2e-9, 20e-9, 30e-9, 35e-9, 62e-9, 58e-9, 84e-9, 19.8e-9, 236e-9, 74e-9, 87e-9, 188e-9, 105e-9, 105e-9, 430e-9];
MOSFET.TRise = [3.5e-9, 2e-9, 16e-9, 8.6e-9, 14e-9, 23e-9, 7e-9, 5e-9, 10e-9, 65e-9, 54e-9, 25e-9, 22e-9, 172e-9, 6e-9, 109e-9, 7e-9, 27e-9, 35e-9, 5e-9, 5e-9, 22e-9];
MOSFET.TFall = [13.8e-9, 2e-9, 9.4e-9, 16e-9, 13e-9, 22e-9, 2e-9, 12e-9, 10e-9, 33e-9, 41e-9, 25e-9, 44e-9, 78e-9, 6e-9, 107e-9, 10e-9, 10e-9, 28e-9, 6e-9, 6e-9, 8e-9];
MOSFET.Vgate = [2, 0.7, 3, 3, 3, 4, 1.7, 1, 1.5, 4, 4, 4, 1.9, 4, 1.75, 3.56, 3.5, 3.5, 4, 3.5, 3.5, 3.5];
if isBuck
    MOSFET.Trr = [43e-9, 1.8997e-07, 100e-9, 260e-9, 270e-9, 222e-9, 20e-9, 0, 30e-9, 322e-9, 345e-9, 95e-9, 77e-9, 169e-9, 9.5e-9, 714e-9, 1.8997e-07, 1.8997e-07, 173e-9, 1.8997e-07, 1.8997e-07, 1.8997e-07];
    MOSFET_vals = [MOSFET.iMax;MOSFET.Ron;MOSFET.QgTotal;MOSFET.TRise;MOSFET.TFall;MOSFET.Vgate;MOSFET.Trr];
else
    MOSFET.Vdiode = [0.95, 0.9, 2.5, 1.6, 1.6, 1.2, 0.8, 2.5, 0.75, 1.2, 1.2, 1.3, 0.81, 1.2, 0.76, 0.88, 1.4, 1.4, 1.3, 1.4, 1.4, 1.4];
    MOSFET_vals = [MOSFET.iMax;MOSFET.Ron;MOSFET.QgTotal;MOSFET.Vdiode;MOSFET.TRise;MOSFET.TFall;MOSFET.Vgate];
end
    idx = 1;
    %Finds a MOSFET with a high enough max current rating for the
    %application. Places multiple 160A MOSFETs in parallel if max current 
    %exceeds available options:
    while iMax >= MOSFET.iMax(idx)
        if idx == length(MOSFET.iMax)
            outOfIndex=1;

            %When two MOSFETS are put in parallel:
            %iMax doubles
            %Ron - Two resistors in parallel - halves
            %Qgtotal - Doubles as capactior in parallel
            %The rest don't change
            
            n_MOSFETs=ceil(iMax/MOSFET.iMax(idx));
            break
        else
            idx = idx + 1;
        end
    end
    
%     Ron = MOSFET_vals(2,idx);
%     QgTotal = MOSFET_vals(3,idx);
     if outOfIndex==0
        Ron = MOSFET_vals(2,idx);
        QgTotal = MOSFET_vals(3,idx);
    else 
        Ron = MOSFET_vals(2,idx)/n_MOSFETs;
        QgTotal = MOSFET_vals(3,idx) * n_MOSFETs;
     end
        

    if isBuck
        TRise = MOSFET_vals(4,idx);
        TFall = MOSFET_vals(5,idx);
        Vgate = MOSFET_vals(6,idx);
        Trr = MOSFET_vals(7,idx);
        vals = [Ron, QgTotal, TRise, TFall, Vgate, Trr,n_MOSFETs];
    else
        vDiode = MOSFET_vals(4,idx);
        TRise = MOSFET_vals(5,idx);
        TFall = MOSFET_vals(6,idx);
        Vgate = MOSFET_vals(7,idx);
        vals = [Ron, QgTotal, vDiode, TRise, TFall, Vgate,n_MOSFETs];
    end
end