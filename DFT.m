function res = DFT(t,FS_coeff,N)
T = 1;
expn = zeros(1, N);
for a = 0:N-1
    expn(a+1) = exp(1i*2*pi/T*a*t);
end

res = expn*FS_coeff;

end

