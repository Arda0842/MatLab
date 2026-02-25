clc; clear; close all;

% Grid
[x,y] = meshgrid(-1:0.3:6 , -1:0.3:6);

% Fonksiyon
Z = 4*x.*y - 3*x.^2 - 2*y.^2 + 6*x - 8;

% Grid tabanlı arama
[max_value, index] = max(Z(:));
[row,col] = ind2sub(size(Z), index);

x_ext = x(row,col);
y_ext = y(row,col);

% Surface plot
figure
surf(x,y,Z)
shading interp
hold on
plot3(x_ext,y_ext,max_value,'ro','MarkerSize',10,'MarkerFaceColor','r')
title('Surface Plot')
xlabel('x')
ylabel('y')
zlabel('f(x,y)')
grid on

% Contour plot
figure
contour(x,y,Z)
colorbar
hold on
plot(x_ext,y_ext,'ro','MarkerSize',10,'MarkerFaceColor','r')
title('Contour Plot')
xlabel('x')
ylabel('y')
grid on