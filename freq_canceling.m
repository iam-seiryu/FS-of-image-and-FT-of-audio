% discrete fourier transform of audio

%% load mat file and initialize
clear;                                  
close all;                              

mat_name = input("Type mat file name: ", "s");
load(mat_name+".mat", 'y', 'Fs', 't');
%% DFT of audio
% massive size vector to matrix
m = floor(sqrt(length(y)));
y = y(1:m*m);
y_mat = reshape(y,m,m);

% show original audio
figure(1);  movegui("northwest");
plot(y);
title("Original signal: "+mat_name);
xlabel("time");

% DFT
F = [];
for i = 1:length(y_mat)
    F(:,end+1) = dft1(y_mat(:,i)');
end
F_vec = reshape(F', m*m, 1);

% plot signal in freq.-domain
figure(2); movegui("north");
subplot(211);
stem(real(F_vec));
title("Original Signal in frequency-domain");
xlabel("Frequency");

% high-pass filter
filter_ratio = 0.137;
F_vec_filtered = F_vec;
len = length(F_vec);
mid = len/2;
rect = ones(size(F_vec_filtered));
rect(floor(-filter_ratio*len/2+mid):floor(filter_ratio*len/2+mid)) = 0;
F_vec_filtered = rect.*F_vec_filtered;

% plot filtered signal in freq.-domain
subplot(212);
stem(real(F_vec_filtered));
title("Filtered Signal in freqency-domain");
xlabel("Frequency");

% reshape massive size vector to matrix
F_filtered = reshape(F_vec_filtered, m, m)';

% iDFT(filtered)
f_filtered = [];
for i = 1:length(F_filtered)
    f_filtered(:,end+1) = idft1(F_filtered(:,i)');
end
f_vec_filtered = reshape(f_filtered, m*m, 1);

figure(3);  movegui("northeast");
subplot(311);
plot(y);
title("Original Signal in time-domain");
xlabel("time");
subplot(312);
plot(f_vec_filtered);
title("Filtered Signal in time-domain");
xlabel("time");
subplot(313);
audio_wo_noise = y-f_vec_filtered;
plot(audio_wo_noise);
title("Signal with Noise Canceling");
xlabel("time");

% play original sound and filtered sound
sound(y, Fs);
pause(3)
sound(y-f_vec_filtered, Fs);
audiowrite(mat_name+"_res.wav",audio_wo_noise,Fs)
%% FFT of audio
plot(y);
fft_y = fft(y);
% mid = length(y)/2;
% N = length(y)*4/10;
% fft_y(mid-N:mid+N) = 0;
plot(real(fft_y));

y = ifft(fft_y);
% plot(y);
% sound(y,Fs)