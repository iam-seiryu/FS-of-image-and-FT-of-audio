%% discrete fourier transform 1D
function [F] = dft1(time_domain_value)
    M = length(time_domain_value);
    x = -M/2:M/2-1; 
    n = -M/2:M/2-1;
    power = -1i*2*pi/M*n'*x;
    expn = exp(power);
    F = (time_domain_value*expn)';
end