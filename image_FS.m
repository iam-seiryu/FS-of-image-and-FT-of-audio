%% load mat file and initialize
clear;                                  
close all;                              

mat_name = input("Type mat file name: ", 's');
load(mat_name+".mat", 'x', 'y', 't');
x_component = x;
y_component = y;
dt = t(2) - t(1);                       
num_sample = length(t);        
T = dt * num_sample;               
%% Obtain Fourier Series
% set N
N = 100;

% x component
figure(1);      movegui('northwest');
% append a0
x = 1/T*x_component*dt*ones(length(t),1);
w0 = 2*pi/T;
for n = 1:N
   c = cos(n*w0*t);
   s = sin(n*w0*t);
   a = 2/T*(x_component*c')*dt;
   b = 2/T*(x_component*s')*dt;
   x = x+(a*c)+(b*s);
   
   hold on;
   grid on;
   subplot(211);
   plot(t, x);
   xlabel('time(s)');
   ylabel('x(t)');
   title("x component of the image (n="+num2str(n)+")");
   pause(0.02);
   hold off;
end
hold on;
subplot(211);
plot(t, x_component,'r', LineWidth=2.5)
hold off;

% y component
% append a0
y = 1/T*y_component*dt*ones(length(t),1);
w0 = 2*pi/T;
for n = 1:N
   c = cos(n*w0*t);
   s = sin(n*w0*t);
   a = 2/T*(y_component*c')*dt;
   b = 2/T*(y_component*s')*dt;
   y = y+(a*c)+(b*s);

   hold on;
   grid on;
   subplot(212);
   plot(t, y);
   xlabel('time(s)');
   ylabel('y(t)');
   title("y component of the image (n="+num2str(n)+")");
   pause(0.02);
   hold off;
end
hold on;
subplot(212);
plot(t, y_component, 'r', LineWidth=2.5)
hold off;
%% plot the figures
figure(2);      movegui('northeast');
figure(2).Position(3) = 1120;
subplot(121);
plot(x_component,y_component);
title("Original image")
            
figure(2);      movegui('northeast');
subplot(122);
plot(x, y);
title("Approximate image")