clear;
clc;

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
X = datetime('now','Format','MM.dd'); % Make date varible.
date = string(X);
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

load('TobiTELE.mat', 'TobidataTELE')
load('AmpTELE.mat', 'AmpdataTELE')
Participant_ID='A1_3725164643'; % Plugin the user ID.

Participant_ID=strtrim(Participant_ID);
h = AmpdataTELE(39,end);
m = AmpdataTELE(40,end);
if(m<10)
    m = "0" + m;
end
stemp = AmpdataTELE(41,end);
s = round(stemp,0);
endtime ="(" + h + ";" + m + ";" + s + ")";

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
B1=zeros(size(TobidataTELE,1)+1,size(TobidataTELE,2)); % Make Cell in row #53 for date varible and put that in new B1 matrix that include the Data verible and TobidataTELE data.
B1(1:52,1:end)=TobidataTELE;
B1(53,1)=date;
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
G1=zeros(size(AmpdataTELE,1)+1,size(AmpdataTELE,2)); % Make Cell in row #42 for date varible and put that in new B1 matrix that include the Data verible and AmpdataTELE data.
G1(1:41,1:end)=AmpdataTELE;
G1(42,1)=date; 
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


headersTobi=[
    "measurement time"  
    "Steer"             
    "Gas"             
    "Brake"
    "Pose.Position.X"
    "Pose.Position.Y"
    "Pose.Position.Z"
    "Pose.Orientation.X"
    "Pose.Orientation.Y"
    "Pose.Orientation.Z"    %10
    "Pose.Orientation.W"
    "Velocity.Linear.X"
    "Velocity.Linear.Y"
    "Velocity.Linear.Z"
    "Velocity.Angular.X"
    "Velocity.Angular.Y"
    "Velocity.Angular.Z"
    "Accel.Linear.X"
    "Accel.Linear.Y"
    "Accel.Linear.Z"       %20
    "Accel.Angular.X"
    "Accel.Angular.Y"
    "Accel.Angular.Z"
    "GPS.Time"
    "Pupil center RIGHT eye_X"
    "Pupil center RIGHT eye_Y"
    "Pupil center RIGHT eye_Z"
    "Pupil center LEFT eye_X"
    "Pupil center LEFT eye_Y"
    "Pupil center LEFT eye_Z"    %30
    "Pupil diameter RIGHT"
    "Pupil diameter LEFT"
    "Gaze direction RIGHT eye_X"
    "Gaze direction RIGHT eye_Y"
    "Gaze direction RIGHT eye_Z"
    "Gaze direction LEFT eye_X"
    "Gaze direction LEFT eye_Y"
    "Gaze direction LEFT eye_Z"
    "Gaze position_X"
    "Gaze position_Y"         %40
    "Gaze position 3D_X"
    "Gaze position 3D_Y"
    "Gaze position 3D_Z"
    "Gyroscope_X"
    "Gyroscope_Y"
    "Gyroscope_Z"
    "Accelerometer_X"
    "Accelerometer_Y"
    "Accelerometer_Z"          
    "Time-H"            %50
    "Time-M"           
    "Time-S"            %52
    "DATE"
    ];

headersAmp=[
    "measurement time"
    "Steer"
    "Gas"
    "Brake"
    "Pose.Position.X"
    "Pose.Position.Y"
    "Pose.Position.Z"
    "Pose.Orientation.X"
    "Pose.Orientation.Y"
    "Pose.Orientation.Z"
    "Pose.Orientation.W"
    "Velocity.Linear.X"
    "Velocity.Linear.Y"
    "Velocity.Linear.Z"
    "Velocity.Angular.X"
    "Velocity.Angular.Y"
    "Velocity.Angular.Z"
    "Accel.Linear.X"
    "Accel.Linear.Y"
    "Accel.Linear.Z"
    "Accel.Angular.X"
    "Accel.Angular.Y"
    "Accel.Angular.Z"
    "GPS.Time"
    "GSR"              
    "ECG"              
    "EEG_1"            
    "EEG_2"            
    "EEG_3"            
    "EEG_4"            
    "EEG_5"            
    "EEG_6"            
    "EEG_7"            
    "EEG_8"            
    "EEG_9"           
    "EEG_10"          
    "EEG_11"           
    "EEG_12"           
    "Time-H"
    "Time-M"           
    "Time-S"
    "DATE"
    ];

TOBITELE=[headersTobi';B1'];
AMPTELE=[headersAmp';G1'];

fprintf('For Latency scenario:\n');
fprintf('                 %s_TELEOPERATION_1\n',Participant_ID);
fprintf('                 %s_TELEOPERATION_2\n',Participant_ID);
fprintf('                 %s_TELEOPERATION_3\n',Participant_ID);
fprintf('                 %s_TELEOPERATION_4\n',Participant_ID);
fprintf('                 %s_TRAIN\n',Participant_ID);

prompt = '<strong>Enter participant and scenario name (copy from above):</strong>';
foldername = sprintf('%s at %s',input(prompt,'s'),endtime);
foldername = strtrim(foldername);
direc = [ 'C:\Users\LAB-ORENMUZ\Desktop\CogantaDATA\Participants_DATA\' Participant_ID '\Teleoperation\' foldername '\'];
mkdir([ 'C:\Users\LAB-ORENMUZ\Desktop\CogantaDATA\Participants_DATA\' Participant_ID '\Teleoperation\' foldername '\']);
 
filename1 = sprintf('Tobii Data of %s.xlsx',foldername);
filename2 = sprintf('g.techAmp Data of %s.xlsx',foldername);
 
fullFileName1 = fullfile(direc,filename1);
fullFileName2 = fullfile(direc,filename2);

xlswrite(fullFileName1,TOBITELE)
xlswrite(fullFileName2,AMPTELE)


fprintf('<strong>DATA SAVED!</strong>\n');

