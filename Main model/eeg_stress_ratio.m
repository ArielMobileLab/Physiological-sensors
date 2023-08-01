function Mean_Ratio_multipul_ch = eeg_stress_ratio(u)
%  coder.extrinsic('pwelch');
%    coder.extrinsic('table2array');

%    psd = zeros(513,1);
%    frequencies = zeros(513,1);

   
   % On a 512 sampling rate we should have 129 freqwencies: to Obtain the Welch PSD estimate dividing the signal into segments 132 samples in length. The signal segments are multiplied by a Hamming window 132 samples in length. The number of overlapped samples is not specified, so it is set to 132/2 = 66. The DFT length is 256 points, yielding a frequency resolution of  rad/sample. Because the signal is real-valued, the PSD estimate is one-sided and there are 256/2+1 = 129 points. Plot the PSD as a function of normalized frequency.
   % 
%    number_of_frquencies = (size(u, 1)/4)+1;
%    disp(number_of_frquencies);
%    psd = zeros(number_of_frquencies,1);
%    frequencies = zeros(number_of_frquencies,1);
  
   %initialize an array to store the stress scores for each channel
   stress_scores = zeros(size(u, 2), 1);
 
   
   
       for i = 1:size(u, 2)
            
           %extract for current channel
           channel_data = u(:, i);
%            disp("channel_data " + i);
%            disp(channel_data);
            
          % Calculate the power spectral density (PSD) of the EEG data
           [psd, frequencies] = pwelch(channel_data, [], [], [], 512);
%            disp("psd from this channel" + i);
%            disp(psd);
%             psd = psd/1.0e+08;
             


           % Calculate the relative power in the alpha frequency band (8-12 Hz)
           alpha_power = sum(psd(frequencies >= 8 & frequencies <= 12));
%            disp("alpha_power");
%            disp(alpha_power);  
           
           % Calculate the relative power in the beta frequency band (12-30 Hz)
           beta_power = sum(psd(frequencies >= 12 & frequencies <= 30));
%            disp("beta_power");
%            disp(beta_power);  
           % Calculate the alpha/beta ratio for the current channel
%            alpha_beta_ratio = beta_power / alpha_power ;
             alpha_beta_ratio = log(beta_power/alpha_power) ;
%              alpha_beta_ratio = alpha_power / beta_power;


            stress_scores(i) = alpha_beta_ratio;
            
            
       end
  
 
     Mean_Ratio_multipul_ch = mean(stress_scores);
%       Mean_Ratio_multipul_ch = stress_scores(3);
end

