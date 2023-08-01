clear;
clc;

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%val = load('heartRate.mat', 'heartRatedata');
% val = load('Heartrate_Test.mat', 'heartRatedata');
% sm = cell2mat(table2array(cell2table(struct2cell(val))));
% precentile90_Baseline = prctile(sm(2,:), 90);
% meanHR_Baseline = mean(sm(2,:));
% meanHR_2_Baseline = mean(sm(2,:).^2);
% median_Baseline = prctile(sm(2,:), 50);
% sd_Baseline = std(sm(2,:));
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
X = datetime('now','Format','MM.dd'); % Make date varible.
date = string(X);
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

load('Baseline.mat', 'Baselinedata')

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
B1=zeros(size(Baselinedata,1)+1,size(Baselinedata,2)); % Make Cell in row #16 for date varible and put that in new B1 matrix that include the Data verible and Baseline data.
B1(1:14,1:end)=Baselinedata;
B1(15,1)=date;
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 %------------------------------------------------------
Participant_ID='ECG'; % Plugin the user ID.
 %------------------------------------------------------

headersBaseline=[
    "measurement time" %1
    "ECG"              %3
    "EEG_1"            %4
    "EEG_2"            %5
    "EEG_3"            %6
    "EEG_4"            %7
    "EEG_5"            %8
    "EEG_6"            %9
    "EEG_7"            %10
    "EEG_8"            %11
    "EEG_9"            %12
    "EEG_10"           %13
    "EEG_11"           %14
    "EEG_12"           %15
    "Date"             %16
    ];


BASE=[headersBaseline';B1'];

foldername = sprintf('Baseline Data of %s',Participant_ID);

 direc = [ 'C:\Users\LAB-OREN1\Desktop\CognataData\Data' Participant_ID '\Physiological\' foldername '\'];
 mkdir([ 'C:\Users\LAB-OREN1\Desktop\CognataData\Data' Participant_ID '\Physiological\']);
 mkdir([ 'C:\Users\LAB-OREN1\Desktop\CognataData\Data' Participant_ID '\Physiological\' foldername '\']);
 
 filename3 = sprintf('%s.xlsx',foldername);
 
 fullFileName3 = fullfile(direc,filename3);

 xlswrite(fullFileName3,BASE)
 
 fprintf('<strong>DATA SAVED!</strong>\n');