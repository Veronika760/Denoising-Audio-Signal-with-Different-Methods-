
%Load the audio sample Audio.1 in matlab we use audioread to read the file,
%X as the signal data and Fs as data rate/frequency
[X, Fs] = audioread("AudioSamanta.m4a");
%sound(X,Fs)

%then we calculate the period of the sample which is 1/data rate
T = 1/Fs;
t = (0:T : (length(X)-1)/Fs); %sample period on time, length of sample data - 1 divided to Frequency/sample rate

%Now let's plot the unfiltered data on the time domain
subplot(4,2,1)
plot(t,X)
title ("Time Domain Representation of Unfiltered .m4a")
xlabel("Time in Second")
ylabel("Amplitude")
xlim([0 t(end)])

m = length(X); %showing the original audio sample length

%we can transform the length into power of 2 so that the computation become
%faster, this is needed for the FFT to compute fast
n = pow2(nextpow2(m)); 

%Next we will transform the sample into Frequency domain using fast fourier
%transform. FFT is considered to be one of the most incredible algorithms in
%signal processing as it can compute the signal and transform really fast
%and efficient, way better than DFT


y = fft(X, n);
f = (0: n-1)*(Fs/n);
amplitude = abs(y)/n;

%Now lets plot the signal that we have converted to frequency domain
subplot(4,2,2)
plot(f(1:floor(n/2)),amplitude(1:floor(n/2)))
title("Frequency Domain Representation of Unfiltered .m4a")
xlabel("Frequency")
ylabel("Amplitude")


%Now the next step is to filter the audio frequency ,
%we will filter the audio sample using Low Pass Filter to remove the noise 
order = 7;%maximum noise value that can be continued
[b,a] = butter (order,1000/(Fs/2),'low');%'low' defining low pass filter
filtered_m4a = filter(b,a,X);
%sound(filtered_m4a, Fs)
tl = (0:T:(length(filtered_m4a)-1)/Fs);
subplot(4,2,3)
plot(tl,filtered_m4a,'g')
title("Time Domain Representation of Filtered .m4a")
xlabel("Time in Second")
ylabel("Amplitude")
xlim([0 tl(end)])

m1 = length (X); %length of the original sample
n1 = pow2(nextpow2(m1)); %Transforming the length 
y1 = fft (filtered_m4a, n1);
f = (0:n1-1)*(Fs/n1);
amplitude = abs (y1)/n1;
subplot(4,2,4)
plot(f(1:floor(n1/2)), amplitude(1:floor(n1/2)))
title("Frequency Domain Representation of Filtered .m4a")
xlabel("Frequency")
ylabel("Amplitude")

%As we see it is not so effective that I can not get rid all the noise now
%i want to try to change the audio file type maybe it gives better result

m4AFilename = 'AudioSamanta.m4a';
[originalsample,Fs] = audioread(m4AFilename);
wavFilename = 'AudioSamanta.wav';
audiowrite(wavFilename,originalsample,Fs);

[z, frequency] = audioread("AudioSamanta.wav");
%sound(z, frequency)

%Basically I will just use the same codes and see the result
%then we calculate the period of the sample which is 1/data rate
T = 1/frequency;
t = (0:T : (length(z)-1)/frequency); %sample period on time, length of sample data - 1 divided to Frequency/sample rate

%Now let's plot the unfiltered data on the time domain
subplot(4,2,5)
plot(t,z)
title ("Time Domain Representation of Unfiltered .wav")
xlabel("Time in Second")
ylabel("Amplitude")
xlim([0 t(end)])

m = length(z); %showing the original audio sample length
%we can transform the length into power of 2 so that the computation become
%faster, this is needed for the FFT to compute fast
n = pow2(nextpow2(m)); 

%Next we will transform the sample into Frequency domain using fast fourier
%transform. FFT is considered to be one of the most incredible algorithm in
%signal processing as it can compute the signal and transform really fast
%and efficient, way better than DFT

y = fft(z, n);
f = (0: n-1)*(frequency/n);
amplitude = abs(y)/n;

%Now lets plot the signal that we have converted to frequency domain
subplot(4,2,6)
plot(f(1:floor(n/2)),amplitude(1:floor(n/2)))
title("Frequency Domain Representation of Unfiltered .wav")
xlabel("Frequency")
ylabel("Amplitude")


%Now the next step is to filter the audio frequency ,
%we will filter the audio sample using Low Pass Filter to remove the noise 
order = 7;%maximum noise value that can be continued
[b,a] = butter (order,1000/(frequency/2),'low');%'low' defining low pass filter
filtered_wav = filter(b,a,z);
%sound(filtered_wav, frequency)
tl = (0:T:(length(filtered_wav)-1)/frequency);
subplot(4,2,7)
plot(tl,filtered_wav,'g')
title("Time Domain Representation of Filtered .wav")
xlabel("Time in Second")
ylabel("Amplitude")
xlim([0 tl(end)])

m1 = length (z); %length of the original sample
n1 = pow2(nextpow2(m1)); %Transforming the length 
y1 = fft (filtered_wav, n1);
f = (0:n1-1)*(frequency/n1);
amplitude = abs (y1)/n1;
subplot(4,2,8)
plot(f(1:floor(n1/2)), amplitude(1:floor(n1/2)))
title("Frequency Domain Representation of Filtered .wav")
xlabel("Frequency")
ylabel("Amplitude")


