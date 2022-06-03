% Compare elapsed time of DFT and FFT
%% init
clear;                                  
close all;                              

mat_name = input("Type mat file name: ", 's');
load(mat_name+".mat", 'x', 'y');                                      
%% DFT
tic;
% x component
x_dft = dft1(x)';
x_idft = idft1(x_dft);

% y component
y_dft = dft1(y)';
y_idft = idft1(y_dft);

figure(1);  movegui("northwest");
subplot(221);
stem(real(x_dft))
title("DFT of real part of x");
xlabel('w');
subplot(222);
stem(imag(x_dft))
title("DFT of imaginary part of x");
xlabel('w');
subplot(223);
stem(real(y_dft))
title("DFT of real part of y");
xlabel('w');
subplot(224);
stem(imag(y_dft))
title("DFT of imaginary part of y");
xlabel('w');

figure(2);  movegui("northeast");
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


figure(1);  movegui("northwest");
subplot(221);
stem(real(x_fft))
title("FFT of real part of x");
xlabel('w');
subplot(222);
stem(imag(x_fft))
title("FFT of imaginary part of x");
xlabel('w');
subplot(223);
stem(real(y_fft))
title("FFT of real part of y");
xlabel('w');
subplot(224);
stem(imag(y_fft))
title("FFT of imaginary part of y");
xlabel('w');

figure(2);  movegui("northeast");
plot(x_ifft,y_ifft)
elapsed_time = toc;
disp("elapsed time of : " + elapsed_time);