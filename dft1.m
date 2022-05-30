%% discrete fourier transform
function [F] = dft1(time_domain_value)
M = length(time_domain_value);
x = 0:M-1;
n = 0:M-1;
power = -1i*2*pi/M*n'*x;
expn = exp(power);
F = time_domain_value*expn;
end