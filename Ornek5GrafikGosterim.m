clc;
clear;
close all;

%% 1) Grid
[x,y] = meshgrid(-2:0.1:2 , -2:0.1:2);

%% 2) Fonksiyon
Z = x.^3 - 3*x.*y.^2;

%% 3) Surface Plot
figure
surf(x,y,Z)
shading interp
colormap parula
colorbar
title('Surface Plot - f(x,y) = x^3 - 3xy^2')
xlabel('x')
ylabel('y')
zlabel('f(x,y)')
grid on
hold on

% Kritik nokta (0,0)
plot3(0,0,0,'ro','MarkerSize',12,'MarkerFaceColor','r')

%% 4) Contour Plot
figure
contour(x,y,Z,30)
colorbar
title('Contour Plot - Saddle Structure')
xlabel('x')
ylabel('y')
grid on
hold on

plot(0,0,'ro','MarkerSize',12,'MarkerFaceColor','r')