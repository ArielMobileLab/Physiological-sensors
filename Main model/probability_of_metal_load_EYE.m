function pMWL = probability_of_metal_load_EYE(EYE_t)

EYE_t=double(EYE_t*1.0);

%Normaly we will take these values from baseline measurements
Mean_EYE=3;
sd_EYE=0.10080; 


% %Exponential smoothness for mean EYE and mean EYE^2
%  smoothing_factor=0.9; %
% % 
%  Mean_EYE_2=sd_EYE^2+Mean_EYE^2;
%  Mean_EYE=Mean_EYE*smoothing_factor+(1-smoothing_factor)*EYE_t;
%  disp(Mean_EYE);
%  Mean_EYE_2=Mean_EYE_2*smoothing_factor+(1-smoothing_factor)*EYE_t^2;
% % % 
% % % % standard deviation=(E(x^2)-E(x)^2)^0.5
%  sd_EYE=(Mean_EYE_2-Mean_EYE^2)^0.5; 

%version 1
% pMWL=double(1.0/(1.0+exp(-(EYE_t-Mean_EYE+sd_EYE)/sd_EYE)));

%version 2
pMWL=double(1.0/(1.0+exp(-(EYE_t-Mean_EYE)/sd_EYE)));


end

