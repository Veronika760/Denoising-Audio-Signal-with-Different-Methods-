%read the file input sample (datain) and the data rate in Hertz (fs)
[datain,fs] = audioread("Audio1.m4a");

%define the output variable and apply bandpass filter 
output1 = filter(Audio1LowPass4k,datain);

%now play the sound of the data
sound(output1,fs)

%now we will rewrite the filtered data 
audiowrite("Audio1FilteredDesignMethod.m4a",output1,fs);

%Now I would like to plot the result so we can see the difference
%Original signal
subplot(2,2,1)
plot(datain,'b');
title ('Original Signal');
xlabel("Time in Second")
ylabel("Amplitude")


%Filtered signal
subplot(2,2,2)
plot(output1,'g')
title('Denoised Signal with MATLAB Built In Filter')
xlabel("Time in Second")
ylabel("Amplitude")



%this is the function used to filter the data
function Hd = Audio1LowPass4k
%AUDIO1LOWPASS4K Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.11 and Signal Processing Toolbox 8.7.
% Generated on: 15-Jul-2022 21:53:34

% Butterworth Lowpass filter designed using FDESIGN.LOWPASS.

% All frequency values are in Hz.
Fs = 48000;  % Sampling Frequency

N  = 100;   % Order
Fc = 1000;  % Cutoff Frequency

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.lowpass('N,F3dB', N, Fc, Fs);
Hd = design(h, 'butter');
end
% [EOF]

