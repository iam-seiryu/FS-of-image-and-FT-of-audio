%% inverse discrete fourier transform 1D
function [f] = idft1(freq_domain_value)
M = length(freq_domain_value);
x = 0:M-1;
n = 0:M-1;
power = 1i*2*pi/M*x'*n;
expn = exp(power);
f = real(freq_domain_value*expn/M);
end