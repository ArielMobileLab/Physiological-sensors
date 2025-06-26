clear;
clc;

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
X = datetime('now','Format','MM.dd'); % Make date varible.
date = string(X);
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

load('ParentGPS.mat', 'Parent')

Participant_ID='C2_133227'

Participant_ID=strtrim(Participant_ID);


h = Parent(22,end);
m = Parent(23,end);
if(m<10)
    m = "0" + m;
end
stemp = Parent(24,end);
s = round(stemp,0);
endtime ="(" + h + ";" + m + ";" + s + ")";



GPS=[
    "measurement time"  
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
    "GPS.Time"  % GPS Time of Week (TOW) in milliseconds
    "Time-H"           
    "Time-M"           
    "Time-S"          
    ];


GPS=[GPS';Parent'];


fprintf('For Senario:\n');
  fprintf('                 %s_Car_Accompanied_Close_Teleoperation\n',Participant_ID);
  fprintf('                 %s_Car_Accompanied_Far_Teleoperation\n',Participant_ID);

prompt = '<strong>Enter participant and scenario name (copy from above):</strong>';
%foldername = sprintf('%s',input(prompt,'s'));
foldername = sprintf('%s at %s',input(prompt,'s'),endtime);

foldername = strtrim(foldername);
 direc = [ 'C:\Users\LAB-OREN3\Desktop\Data\Participants_DATA\' Participant_ID '\Physiological\' foldername '\'];
 mkdir([ 'C:\Users\LAB-OREN3\Desktop\Data\Participants_DATA\' Participant_ID '\Physiological\' foldername '\']);
 
 filename1 = sprintf('GPS Data of %s.xlsx',foldername);
 
 fullFileName1 = fullfile(direc,filename1);



 xlswrite(fullFileName1,GPS)
 

fprintf('<strong>DATA SAVED!</strong>\n');

