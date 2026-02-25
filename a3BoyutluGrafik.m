
clear;
close all;

% 1) Grid oluşturma 
[x,y] = meshgrid(-5:0.2:5 , -5:0.2:5);

% 2) Fonksiyon tanımı
z = x.^2 + y.^2;

% 3) 3 Boyutlu yüzey grafiği
figure
surf(x,y,z)
shading interp
colormap jet
colorbar

xlabel('x')
ylabel('y')
zlabel('f(x,y)')
title('3D Surface Plot: f(x,y) = x^2 + y^2')
grid on

