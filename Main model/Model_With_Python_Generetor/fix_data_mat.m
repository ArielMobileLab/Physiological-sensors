clear;
clc;
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
X = datetime('now','Format','MM.dd'); % Make date varible.
date = string(X);
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
load('Tobi.mat', 'Tobidata')
load('Amp.mat', 'Ampdata')
 %------------------------------------------------------
Participant_ID='Demo_excel'; % Plugin the user ID.
 %------------------------------------------------------

Participant_ID=strtrim(Participant_ID); 
h = Ampdata(17,end);
m = Ampdata(18,end);
if(m<10)
    m = "0" + m;
end
stemp = Ampdata(19,end);
s = round(stemp,0);
endtime ="(" + h + ";" + m + ";" + s + ")";

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
B1=zeros(size(Tobidata,1)+1,size(Tobidata,2)); % Make Cell in row #31 for date varible and put that in new B1 matrix that include the Data verible and Tobidata data.
%B1(1:30,1:end)=Tobidata;
B1(31,1)=date;
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                                                                    
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
G1=zeros(size(Ampdata,1)+1,size(Ampdata,2)); % Make Cell in row #22 for date varible and put that in new B1 matrix that include the Data verible and Ampdata data.
G1(1:22,1:end)=Ampdata; % X 22
G1(23,1)=date; % X23
G1([20,23],:) = G1([23,20],:);
G1([22,23],:) = G1([23,22],:);
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

headersTobi=[
    "measurement time"
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
    "Latitude"         %21
    "Longitude"        %22
    "TTC"              %23
    ];

AMP=[headersAmp';G1'];
TOBI=[headersTobi';B1'];
  fprintf('Please use one of the following names for saving the data:\n');
  fprintf('--------------------------------------------------------\n');
  fprintf('For Training:\n');
  fprintf('                 %s_TRAINING \n',Participant_ID);
  fprintf('--------------------------------------------------------\n');
  fprintf('For COMBINED_Latency_TTC scenario:\n');
  fprintf('                 %s_COMBINED_CUBE_DELAY_50_TTC_ML\n',Participant_ID);
  fprintf('                 %s_COMBINED_CUBE_DELAY_50_TTC_15\n',Participant_ID);
  fprintf('                 %s_COMBINED_CUBE_DELAY_150_TTC_ML\n',Participant_ID);
  fprintf('                 %s_COMBINED_CUBE_DELAY_150_TTC_15\n',Participant_ID);
  fprintf('                 %s_COMBINED_CAR_DELAY_50_TTC_15\n',Participant_ID);
  fprintf('                 %s_COMBINED_CAR_DELAY_50_TTC_ML\n',Participant_ID);
  fprintf('                 %s_COMBINED_CAR_DELAY_150_TTC_15\n',Participant_ID);
  fprintf('                 %s_COMBINED_CAR_DELAY_150_TTC_ML\n',Participant_ID);
  fprintf('--------------------------------------------------------\n');
  fprintf('For Spatial scenario:\n');
  fprintf('                 %s_ALLOCENTRIC\n',Participant_ID);
  fprintf('                 %s_EGOCENTRIC\n',Participant_ID);
  fprintf('--------------------------------------------------------\n');

prompt = '<strong>Enter participant and scenario name (copy from above):</strong>';
foldername = sprintf('%s at %s',input(prompt,'s'),endtime);
foldername = strtrim(foldername);
 direc = [ 'C:\Users\LAB-OREN3\Desktop\CognataData\Participants_DATA\' Participant_ID '\Physiological\' foldername '\'];
 mkdir([ 'C:\Users\LAB-OREN3\Desktop\CognataData\Participants_DATA\' Participant_ID '\Physiological\' foldername '\']);
 
 filename1 = sprintf('Tobii Data of %s.xlsx',foldername);
 filename2 = sprintf('g.techAmp Data of %s.xlsx',foldername);
 
 fullFileName1 = fullfile(direc,filename1);
 fullFileName2 = fullfile(direc,filename2);

 xlswrite(fullFileName1,TOBI)
 xlswrite(fullFileName2,AMP)
 
 fprintf('<strong>DATA SAVED!</strong>\n');
 

