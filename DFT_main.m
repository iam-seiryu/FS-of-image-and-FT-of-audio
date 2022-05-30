%% init
clear;                                  
close all;                              

mat_name = input("Type mat file name: ", 's');
load(mat_name+".mat", 'x', 'y');                                      
%% DFT
tic;
x_dft = dft1(x);
x_idft = idft1(x_dft);

y_dft = dft1(y);
y_idft = idft1(y_dft);

plot(x_idft,y_idft)
disp("elapsed time: " + toc);

%% FFT
tic;
x_fft = fft(x');
x_ifft = ifft(x_fft);

y_fft = fft(y');
y_ifft = ifft(y_fft);

plot(x_ifft, y_ifft)
disp("elapsed time: " + toc);