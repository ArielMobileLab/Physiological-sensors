clear;
clc;
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
X = datetime('now','Format','MM.dd'); % Make date varible.
date = string(X);
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

load('Amp.mat', 'Ampdata')
 %------------------------------------------------------
Participant_ID='aa'; % Plugin the user ID.
 %------------------------------------------------------

Participant_ID=strtrim(Participant_ID); 
h = Ampdata(15,end);
m = Ampdata(16,end);
if(m<10)
    m = "0" + m;
end
stemp = Ampdata(17,end);
s = round(stemp,0);
endtime ="(" + h + ";" + m + ";" + s + ")";
                                                                                      
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
G1=zeros(size(Ampdata,1)+1,size(Ampdata,2)); % Make Cell in row #22 for date varible and put that in new B1 matrix that include the Data verible and Ampdata data.
G1(1:18,1:end)=Ampdata; % X 22
G1(19,1)=date; % X23
%G1([20,23],:) = G1([23,20],:);
%G1([22,23],:) = G1([23,22],:);
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


headersAmp=[
    "measurement time" %1
    "simulation time"  %2
    "ECG"
    "EEG_1"            %5
    "EEG_2"            %6
    "EEG_3"            %7 fp2
    "EEG_4"            %8 fp1
    "EEG_5"            %9 f8
    "EEG_6"            %10 f4
    "EEG_7"            %11 fz
    "EEG_8"            %12 f3
    "EEG_9"            %12 
    "EEG_10"            %12 
    "EEG_11"            %12 
    "EEG_12"            %12
    "Time-H"           %17 pz
    "Time-M"           %18 p7
    "Time-S"           %19
    "DATE"             %20
    ];

  AMP=[headersAmp';G1'];
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
 direc = [ 'C:\Users\LAB-OREN1\Desktop\CognataData\Data' Participant_ID '\Physiological\' foldername '\'];
 mkdir([ 'C:\Users\LAB-OREN1\Desktop\CognataData\Data' Participant_ID '\Physiological\' foldername '\']);

 filename2 = sprintf('g.techAmp Data of %s.xlsx',foldername);

 fullFileName2 = fullfile(direc,filename2);

 xlswrite(fullFileName2,AMP);
 
 fprintf('<strong>DATA SAVED!</strong>\n');
 
