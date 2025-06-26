% clear;
clearvars -except wave % clear all variables except for the one that responsible for EYE sd and Mean (for the model)
clc;

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
X = datetime('now','Format','MM.dd'); % Make date variable.
date = string(X);
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
load('Tobi.mat', 'Tobidata')
load('Amp.mat', 'Ampdata')
load('SenarioType.mat', 'SenarioType')
Senario_type = SenarioType(2, end);

load('untitled.mat', 'ans')
%------------------------------------------------------
Participant_ID = 'C2_133227'; % Plugin the user ID.
%------------------------------------------------------

Participant_ID = strtrim(Participant_ID); 
h = Ampdata(18,end);
m = Ampdata(19,end);
if(m < 10)
    m = "0" + m;
end
stemp = Ampdata(20,end);
s = round(stemp, 0);
endtime = "(" + h + ";" + m + ";" + s + ")";

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
G1 = zeros(size(Ampdata,1)+1, size(Ampdata,2)); % Make Cell in row #22 for date variable and put that in new B1 matrix that includes the Date variable and Ampdata data.
G1(1:20,1:end) = Ampdata; % X22
G1(21,1) = date; % X23
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

headersAmp = [
    "measurement time" %1
    "simulation time ros"  %2
    "simulation time"  %2
    "GSR"              %3
    "ECG"              %4
    "EEG_1"            %5
    "EEG_2"            %6
    "EEG_3"            %7 fp2
    "EEG_4"            %8 fp1
    "EEG_5"            %9 f8
    "EEG_6"            %10 f4
    "EEG_7"            %11 fz
    "EEG_8"            %12 f3
    "EEG_9"            %13 f7
    "EEG_10"           %14 t8
    "EEG_11"           %15 t7
    "EEG_12"           %16 p8
    "Time-H"           %17 pz
    "Time-M"           %18 p7
    "Time-S"           %19
    "DATE"             %20
    ];

AMP = [headersAmp'; G1'];

if Senario_type == 1
    scenario_name = 'Simulation_Training_Physiological';
elseif Senario_type == 2    
    scenario_name = 'Simulation_Accompanied_Far_MapA_Physiological';
elseif Senario_type == 3
    scenario_name = 'Simulation_Accompanied_Far_MapB_Physiological';
elseif Senario_type == 4
    scenario_name = 'Simulation_Accompanied_Far_MapC_Physiological';
elseif Senario_type == 5    
    scenario_name = 'Simulation_Accompanied_Close_MapA_Physiological';
elseif Senario_type == 6
    scenario_name = 'Simulation_Accompanied_Close_MapB_Physiological';
elseif Senario_type == 7
    scenario_name = 'Simulation_Accompanied_Close_MapC_Physiological';    
elseif Senario_type == 8    
    scenario_name = 'Simulation_Accompanied_Avatar_MapA_Physiological';
elseif Senario_type == 9
    scenario_name = 'Simulation_Accompanied_Avatar_MapB_Physiological';
elseif Senario_type == 10
    scenario_name = 'Simulation_Accompanied_Avatar_MapC_Physiological';    
else
    error('Invalid Senario_type');
end

foldername = sprintf('%s_%s at %s', Participant_ID, scenario_name, endtime);

foldername = strtrim(foldername);
direc = ['C:\Users\LAB-OREN3\Desktop\Data\Participants_DATA\' Participant_ID '\Physiological\' foldername '\'];
mkdir(direc);

filename1 = sprintf('Tobii Data of %s.xlsx', foldername);
filename2 = sprintf('g.techAmp Data of %s.xlsx', foldername);

fullFileName1 = fullfile(direc, filename1);
fullFileName2 = fullfile(direc, filename2);

xlswrite(fullFileName2, AMP)

fprintf('<strong>DATA SAVED!</strong>\n');
