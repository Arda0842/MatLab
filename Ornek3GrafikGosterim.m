clc;
clear;
close all;

%% 1) Grid oluşturma

[x,y] = meshgrid(-5:0.1:5 , -5:0.1:5);

%% 2) Fonksiyon tanımı

Z = x.^2 - y.^2 + 4*x.*y;

%% 3) Surface Plot

figure
surf(x,y,Z)      
shading interp
colormap parula
title('Surface Plot')
xlabel('x')
ylabel('y')
zlabel('F(x,y)')
hold on

%% 4) Grid tabanlı minimum ve maksimum arama

[min_value, min_index] = min(Z(:));
[max_value, max_index] = max(Z(:));

[row_min,col_min] = ind2sub(size(Z), min_index);
[row_max,col_max] = ind2sub(size(Z), max_index);

x_min = x(row_min,col_min);
y_min = y(row_min,col_min);

x_max = x(row_max,col_max);
y_max = y(row_max,col_max);

%% 5) Noktaları işaretleme (3D)

plot3(x_min, y_min, min_value, 'ro', ...
    'MarkerSize',10,'MarkerFaceColor','r')

plot3(x_max, y_max, max_value, 'bo', ...
    'MarkerSize',10,'MarkerFaceColor','b')

%% 6) Contour Plot

figure
contour(x,y,Z,30)
colorbar
title('Contour Plot')
xlabel('x')
ylabel('y')
grid on
hold on

plot(x_min, y_min, 'ro', ...
    'MarkerSize',10,'MarkerFaceColor','r')

plot(x_max, y_max, 'bo', ...
    'MarkerSize',10,'MarkerFaceColor','b')