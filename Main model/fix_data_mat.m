% clear;
clearvars -except wave % clear all variables except for the one that responsible for EYE sd and Mean (for the model)
clc;

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
X = datetime('now','Format','MM.dd'); % Make date varible.
date = string(X);
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
load('Tobi.mat', 'Tobidata')
load('Amp.mat', 'Ampdata')
load('SenarioType.mat', 'SenarioType')
Senario_type = SenarioType(2, end);


load('untitled.mat', 'ans')
 %------------------------------------------------------
Participant_ID='C5_070529'; % Plugin the user ID.
 %------------------------------------------------------


Participant_ID=strtrim(Participant_ID); 
h = Ampdata(18,end);
m = Ampdata(19,end);
if(m<10)
    m = "0" + m;
end
stemp = Ampdata(20,end);
s = round(stemp,0);
endtime ="(" + h + ";" + m + ";" + s + ")";

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
B1=zeros(size(Tobidata,1)+1,size(Tobidata,2)); % Make Cell in row #31 for date varible and put that in new B1 matrix that include the Data verible and Tobidata data.
B1(1:31,1:end)=Tobidata;
B1(32,1)=date;
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                                                                    
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
G1=zeros(size(Ampdata,1)+1,size(Ampdata,2)); % Make Cell in row #22 for date varible and put that in new B1 matrix that include the Data verible and Ampdata data.
G1(1:20,1:end)=Ampdata; % X22
G1(21,1)=date; % X23
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

headersTobi=[
    "measurement time"
    "simulation time ros"
    "simulation time"
    "Pupil center RIGHT eye_X"
    "Pupil center RIGHT eye_Y"
    "Pupil center RIGHT eye_Z"
    "Pupil center LEFT eye_X"
    "Pupil center LEFT eye_Y"
    "Pupil center LEFT eye_Z"
    "Pupil diameter RIGHT"
    "Pupil diameter LEFT"
    "Gaze direction RIGHT eye_X"
    "Gaze direction RIGHT eye_Y"
    "Gaze direction RIGHT eye_Z"
    "Gaze direction LEFT eye_X"
    "Gaze direction LEFT eye_Y"
    "Gaze direction LEFT eye_Z"
    "Gaze position_X"
    "Gaze position_Y"
    "Gaze position 3D_X"
    "Gaze position 3D_Y"
    "Gaze position 3D_Z"
    "Gyroscope_X"
    "Gyroscope_Y"
    "Gyroscope_Z"
    "Accelerometer_X"
    "Accelerometer_Y"
    "Accelerometer_Z"
    "Time-H"
    "Time-M"
    "Time-S"
    "DATE"
    ];

headersAmp=[
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

AMP=[headersAmp';G1'];
TOBI=[headersTobi';B1'];


if Senario_type == 1
    scenario_name = 'Training';
elseif Senario_type == 3    
    scenario_name = 'Takeover_Teledriving_Latency_50ms';
elseif Senario_type == 4
    scenario_name = 'Takeover_Teleassist_Latency_50ms';
elseif Senario_type == 5
    scenario_name = 'FirstResponders_Teleassist_Latency_50ms_Gap_44m';
elseif Senario_type == 6    
    scenario_name = 'FirstResponders_Teleassist_Latency_150ms_Gap_27m';
elseif Senario_type == 7
    scenario_name = 'FirstResponders_Teleassist_Latency_50ms_Gap_27m';
elseif Senario_type == 8
    scenario_name = 'FirstResponders_Teleassist_Latency_150ms_Gap_44m';    
elseif Senario_type == 9    
    scenario_name = 'FirstResponders_Teledriving_Latency_50ms_Gap_44m';
elseif Senario_type == 10
    scenario_name = 'FirstResponders_Teledriving_Latency_150ms_Gap_27m';
elseif Senario_type == 11
    scenario_name = 'FirstResponders_Teledriving_Latency_50ms_Gap_27m'; 
elseif Senario_type == 12
    scenario_name = 'FirstResponders_Teledriving_Latency_150ms_Gap_44m';
elseif Senario_type == 13    
    scenario_name = 'PredictiveDisplay_Latency_50ms_PD_OFF_MapA';
elseif Senario_type == 14
    scenario_name = 'PredictiveDisplay_Latency_150ms_PD_OFF_MapA';
elseif Senario_type == 15
    scenario_name = 'PredictiveDisplay_Latency_50ms_PD_ON_MapA'; 
elseif Senario_type == 16
    scenario_name = 'PredictiveDisplay_Latency_150ms_PD_ON_MapA'; 
elseif Senario_type == 17    
    scenario_name = 'PredictiveDisplay_Latency_50ms_PD_OFF_MapB';
elseif Senario_type == 18
    scenario_name = 'PredictiveDisplay_Latency_150ms_PD_OFF_MapB';
elseif Senario_type == 19
    scenario_name = 'PredictiveDisplay_Latency_50ms_PD_ON_MapB'; 
elseif Senario_type == 20
    scenario_name = 'PredictiveDisplay_Latency_150ms_PD_ON_MapA';
elseif Senario_type == 21    
    scenario_name = 'PredictiveDisplay_Latency_50ms_PD_OFF_MapC';
elseif Senario_type == 22
    scenario_name = 'PredictiveDisplay_Latency_150ms_PD_OFF_MapC';
elseif Senario_type == 23
    scenario_name = 'PredictiveDisplay_Latency_50ms_PD_ON_MapC'; 
elseif Senario_type == 24
    scenario_name = 'PredictiveDisplay_Latency_150ms_PD_ON_MapC';  

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

xlswrite(fullFileName1, TOBI)
xlswrite(fullFileName2, AMP)

fprintf('<strong>DATA SAVED!</strong>\n');
