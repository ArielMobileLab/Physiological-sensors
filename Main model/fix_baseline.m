clear;
clc;


%Heart rate Mean and sd calculation
valHR = load('HeartRate.mat', 'heartRatedata');
sm = cell2mat(table2array(cell2table(struct2cell(valHR))));
sm_one_line =sm(2,:);
sm_one_line_without_zero = nonzeros(sm_one_line');
sm_one_line_reshape_without_zero = flipud(sm_one_line_without_zero);
sm_one_line_reshape_without_zero = sm_one_line_reshape_without_zero(sm_one_line_reshape_without_zero >= 40 );
sm_one_line_reshape_without_zero = sm_one_line_reshape_without_zero(sm_one_line_reshape_without_zero <= 150 );
% precentile90_Baseline = prctile(sm_one_line_reshape_without_zero(:,1), 90);
MEAN_HR_Baseline = mean(sm_one_line_reshape_without_zero(:,1));
meanHR_2_Baseline = mean(sm_one_line_reshape_without_zero(:,1).^2);
% median_Baseline = prctile(sm_one_line_reshape_without_zero(:,1), 50);
SD_HR_Baseline = std(sm_one_line_reshape_without_zero(:,1));
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


%EEG Alpha/Beta Mean and sd calculation
Va1Ratio = load('Ratio.mat','Ratio');
smRatio = cell2mat(table2array(cell2table(struct2cell(Va1Ratio))));
sm_one_line_Ratio =smRatio(2,10:end);
% sm_one_line_Ratio =smRatio(2,6:end);
sm_one_line_Ratio_without_zero = sm_one_line_Ratio';
sm_one_line_Ratio_reshape_without_zero = flipud(sm_one_line_Ratio_without_zero);
% precentile90_Ratio_Baseline = prctile(sm_one_line_Ratio_reshape_without_zero(:,1), 90);
MEAN_EEG_Baseline = mean(sm_one_line_Ratio_reshape_without_zero(:,1));
meanRatio_2_Baseline = mean(sm_one_line_Ratio_reshape_without_zero(:,1).^2);
% median_Ratio_Baseline = prctile(sm_one_line_Ratio_reshape_without_zero(:,1), 50);
SD_EEG_Baseline = std(sm_one_line_Ratio_reshape_without_zero(:,1));
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


%Pupil diameter Mean and sd calculation
Va1Diameter = load('Eye_Diameter.mat','Eye_Diameter');
smDiameter = cell2mat(table2array(cell2table(struct2cell(Va1Diameter))));
sm_one_line_Diameter =smDiameter(2,:);
sm_one_line_without_zero_Diameter = nonzeros(sm_one_line_Diameter');
sm_one_line_reshape_without_zero_Diameter = flipud(sm_one_line_without_zero_Diameter);
sm_one_line_reshape_without_zero_Diameter_Number = sm_one_line_reshape_without_zero_Diameter(sm_one_line_reshape_without_zero_Diameter >= 2.5);
MEAN_EYE_Baseline = mean(sm_one_line_reshape_without_zero_Diameter_Number(:,1));
meanDiameter_2_Baseline = mean(sm_one_line_reshape_without_zero_Diameter_Number(:,1).^2);
% median_Baseline = prctile(sm_one_line_reshape_without_zero(:,1), 50);
SD_EYE_Baseline = std(sm_one_line_reshape_without_zero_Diameter_Number(:,1));
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


% %GSR Mean and sd calculation
valGSR = load('GSR.mat', 'GSR');
smGSR = cell2mat(table2array(cell2table(struct2cell(valGSR))));
sm_one_line_GSR =smGSR(2,10:end); 
sm_one_line_without_zero_GSR = nonzeros(sm_one_line_GSR');
sm_one_line_reshape_without_zero_GRS = flipud(sm_one_line_without_zero_GSR);
% precentile90_Baseline = prctile(sm_one_line_reshape_without_zero(:,1), 90);
mean_GSR_Baseline = mean(sm_one_line_reshape_without_zero_GRS(:,1));
meanGSR_2_Baseline = mean(sm_one_line_reshape_without_zero_GRS(:,1).^2);
% median_Baseline = prctile(sm_one_line_reshape_without_zero(:,1), 50);
sd_GSR_Baseline = std(sm_one_line_reshape_without_zero_GRS(:,1));
% %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

wave.time = 3;
wave.signals.values = [MEAN_EYE_Baseline,SD_EYE_Baseline];


% Make date varible.
X = datetime('now','Format','MM.dd');
date = string(X);
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

load('Baseline.mat', 'Baselinedata')

% Make Cell in row #16 for date varible and put that in new B1 matrix that include the Data verible and Baseline data.
B1=zeros(size(Baselinedata,1)+1,size(Baselinedata,2));
B1(1:15,1:end)=Baselinedata;
B1(16,1)=date;
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% Plugin the user ID.
Participant_ID='x';

headersBaseline=[
    "measurement time" %1
    "GSR"              %2
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

 direc = [ 'C:\Users\LAB-OREN3\Desktop\CognataData\Participants_DATA\' Participant_ID '\Physiological\' foldername '\'];
 mkdir([ 'C:\Users\LAB-OREN3\Desktop\CognataData\Participants_DATA\' Participant_ID '\Physiological\']);
 mkdir([ 'C:\Users\LAB-OREN3\Desktop\CognataData\Participants_DATA\' Participant_ID '\Physiological\' foldername '\']);
 
 filename3 = sprintf('%s.xlsx',foldername);
 
 fullFileName3 = fullfile(direc,filename3);

 xlswrite(fullFileName3,BASE)
 
 fprintf('<strong>DATA SAVED!</strong>\n');
