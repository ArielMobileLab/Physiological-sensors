function pMWL = probability_of_metal_load_EEG(EEG_t)

EEG_t=double(EEG_t*1.0);

%Normaly we will take these values from baseline measurements
Mean_EEG=0.2;
sd_EEG=0.0084; % must be positive 
% sd_Ratio=1; 



%Exponential smoothness for mean Ratio and mean Ratio^2
smoothing_factor=0.995; % 
Mean_EGG_2=sd_EEG^2+Mean_EEG^2;
Mean_EEG=Mean_EEG*smoothing_factor+(1-smoothing_factor)*EEG_t;
Mean_EEG_2=Mean_EGG_2*smoothing_factor+(1-smoothing_factor)*EEG_t^2;
% 
% % standard deviation=(E(x^2)-E(x)^2)^0.5
sd_EEG=(Mean_EEG_2-Mean_EEG^2)^0.5; 
%version 1
% pMWL=double(1.0/(1.0+exp(-(Ratio_t-Mean_Ratio+sd_Ratio)/sd_Ratio)));

%version 2
pMWL=double(1.0/(1.0+exp(-(EEG_t-Mean_EEG)/sd_EEG)));

end


