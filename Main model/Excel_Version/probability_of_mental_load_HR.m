function pMWL = probability_of_mental_load_HR(HR_t)

HR_t=double(HR_t*1.0);

%Normaly we will take these values from baseline measurements
MeanHR=73.84;
SdHR=6.98;
% SdHR=5.341966052605496/sqrt(1000);
% 
% %Exponential smoothness for mean HR and mean HR^2
% smoothing_factor=0.9999;
% MeanHR_2=SdHR^2+MeanHR^2;
% MeanHR=MeanHR*smoothing_factor+(1-smoothing_factor)*HR_t;
% MeanHR_2=MeanHR_2*smoothing_factor+(1-smoothing_factor)*HR_t^2;
% 
% % standard deviation=(E(x^2)-E(x)^2)^0.5
% SdHR=(MeanHR_2-MeanHR^2)^0.5; 

%version 1
% pMWL=double(1.0/(1.0+exp(-(Ratio_t-Mean_Ratio+sd_Ratio)/sd_Ratio)));

%version 2
pMWL=double(1.0/(1.0+exp(-(HR_t-MeanHR)/SdHR)));


end
