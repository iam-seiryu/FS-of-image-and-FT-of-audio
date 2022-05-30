%% init
clear;                                  
close all;                              

mat_name = input("Type mat file name: ", 's');
load(mat_name+".mat", 'x', 'y');                                      
%% DFT
t = linspace(0,1,3000); 
N = length(x);


M_DFT = zeros(N);
for a = 0:N-1
    for b = 0:N-1
        M_DFT(a+1,b+1) = exp(-1i*2*pi/N*a*b);
    end
end

% x component
M_DFT_coeff_x = M_DFT*x';
FS_coeff_x = M_DFT_coeff_x/N;

x_plot = [];
for a = 1:length(t)
    x_plot(a) = DFT(t(a),FS_coeff_x, N);
end
x_plot = real(x_plot);

% y component
M_DFT_coeff_y = M_DFT*y';
FS_coeff_y = M_DFT_coeff_y/N;
y_plot = [];
for a = 1:length(t)
    y_plot(a) = DFT(t(a),FS_coeff_y, N);
end
y_plot = real(y_plot);

%plot(t,x_plot)
plot(x_plot, y_plot)