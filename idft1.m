%% inverse discrete fourier transform 1D
function [f] = idft1(freq_domain_value)
    M = length(freq_domain_value);
    x = -M/2:M/2-1;
    n = -M/2:M/2-1;
    power = 1i*2*pi/M*x'*n;
    expn = exp(power);
    f = real(freq_domain_value*expn/M)';
end