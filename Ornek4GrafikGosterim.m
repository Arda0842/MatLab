clc; clear; close all;

% Grid
[x,y] = meshgrid(-2:0.1:6 , -2:0.1:8);

% Fonksiyon
Z = x.^2 + y.^2 - 4*x - 6*y;

% Analitik minimum
x_min = 2;
y_min = 3;
z_min = x_min^2 + y_min^2 - 4*x_min - 6*y_min;

% Surface plot
figure
surf(x,y,Z)
shading interp
hold on

% Minimum noktayı kırmızı göster
plot3(x_min,y_min,z_min,'ro','MarkerSize',12,'MarkerFaceColor','r')

title('Minimum Noktasi (2,3)')
xlabel('x')
ylabel('y')
zlabel('f(x,y)')
grid on

% Contour plot
figure
contour(x,y,Z)
colorbar
hold on

% Minimum noktayı işaretle
plot(x_min,y_min,'ro','MarkerSize',12,'MarkerFaceColor','r')

title('Contour Plot - Minimum (2,3)')
xlabel('x')
ylabel('y')
grid on