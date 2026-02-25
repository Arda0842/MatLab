clc;
clear;
close all;

%% 1) Grid oluşturma (meshgrid)

[x,y] = meshgrid(-2:0.7:2 , -2:0.7:2);

%% 2) Fonksiyon tanımı

Z = x.^2 + y.^2;

%% 3) Surface plot üretme

figure
surf(x,y,Z)
title('Surface Plot')
xlabel('x')
ylabel('y')
zlabel('f(x,y)')
grid on
hold on

%% 4) Grid tabanlı minimum arama

[min_value, index] = min(Z(:));
[row,col] = ind2sub(size(Z), index);

x_min = x(row,col);
y_min = y(row,col);

%% 5) Minimum noktasını işaretleme

plot3(x_min, y_min, min_value, 'ro', ...
    'MarkerSize',10,'MarkerFaceColor','r')

%% 6) Contour plot üretme

figure
contour(x,y,Z)
colorbar
title('Contour Plot (Seviye Eğrileri)')
xlabel('x')
ylabel('y')
grid on
hold on

plot(x_min, y_min, 'ro', ...
    'MarkerSize',10,'MarkerFaceColor','r')
