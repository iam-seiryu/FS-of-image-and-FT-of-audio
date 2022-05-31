% Compare elapsed time of DFT and FFT
%% init
clear;                                  
close all;                              

mat_name = input("Type mat file name: ", 's');
load(mat_name+".mat", 'x', 'y');                                      
%% DFT
tic;
% x component
x_dft = dft1(x);
x_idft = idft1(x_dft);

% y component
y_dft = dft1(y);
y_idft = idft1(y_dft);

plot(x_idft,y_idft)

elapsed_time = toc;
disp("elapsed time: " + elapsed_time);
%% FFT
tic;
% x component
x_fft = fft(x');
x_ifft = ifft(x_fft);

% y component
y_fft = fft(y');
y_ifft = ifft(y_fft);

plot(x_ifft, y_ifft)

elapsed_time = toc;
disp("elapsed time of : " + elapsed_time);