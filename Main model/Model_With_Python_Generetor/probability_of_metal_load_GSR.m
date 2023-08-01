function pMWL = probability_of_metal_load_GSR(GSR_t)

GSR_t=double(GSR_t*1.0);

%Normaly we will take these values from baseline measurements
Mean_GSR=7.946766389266995e+03;
sd_GSR=1.756584413446012e+02; 
% sd_Ratio=1; 



% % %Exponential smoothness for mean Ratio and mean Ratio^2
% smoothing_factor=0.5; % 
% Mean_GSR_2=sd_Ratio^2+Mean_Ratio^2;
% Mean_GSR=Mean_Ratio*smoothing_factor+(1-smoothing_factor)*GSR_t;
% Mean_GSR_2=Mean_GSR_2*smoothing_factor+(1-smoothing_factor)*GSR_t^2;
% % 
% % % standard deviation=(E(x^2)-E(x)^2)^0.5
% sd_GSR=(Mean_GSR_2-Mean_GSR^2)^0.5; 

%version 1
% pMWL=double(1.0/(1.0+exp(-(Ratio_t-Mean_Ratio+sd_Ratio)/sd_Ratio)));

%version 2
pMWL=double(1.0/(1.0+exp(-(GSR_t-Mean_GSR)/sd_GSR)));

end


