clc
clear
close all
%% SYMBOLIC TANIM
syms x y
f = x^2 + y^2 - 4*x - 6*y;
disp('--- Fonksiyon ---')
pretty(f)
%% 1. Türevler
fx = diff(f,x);
fy = diff(f,y);
disp(' ')
disp('--- Kısmi Türevler ---')
disp('df/dx = ')
pretty(fx)
disp('df/dy = ')
pretty(fy)
%% 2. Kritik Nokta
kritik = solve([fx==0 , fy==0],[x y]);
x0 = kritik.x;
y0 = kritik.y;
disp(' ')
disp('--- Kritik Nokta ---')
fprintf('x* = %s\n',char(x0))
fprintf('y* = %s\n',char(y0))
%% 3. Hessian Matrisi
fxx = diff(f,x,2);
fyy = diff(f,y,2);
fxy = diff(diff(f,x),y);
H = [fxx fxy; fxy fyy];
disp(' ')
disp('--- Hessian Matrisi ---')
pretty(H)
detH = det(H);
fprintf('\nDet(H) = %s\n',char(detH))

%% 4. Max-Min Kararı
if double(subs(detH,[x y],[x0 y0])) > 0 && ...
 double(subs(fxx,[x y],[x0 y0])) > 0
 tip = 'Minimum Noktasi';
elseif double(subs(detH,[x y],[x0 y0])) > 0 && ...
 double(subs(fxx,[x y],[x0 y0])) < 0
 tip = 'Maksimum Noktasi';
else
 tip = 'Eyer (Saddle) Noktasi';
end
disp(' ')
disp('--- Sonuc ---')
fprintf('Kritik nokta (%s , %s) -> %s\n',char(x0),char(y0),tip)
%% 5. Minimum / Maksimum Değer
f_deger = subs(f,[x y],[x0 y0]);
fprintf('Fonksiyon Degeri = %s\n',char(f_deger))
%% 6) Grafikler + Kritik Noktayı İşaretleme
% Sayısal grid (grafik için)
[xg,yg] = meshgrid(-2:0.1:6 , -2:0.1:8);
% f'nin sayısal hali
fg = double(subs(f,{x,y},{xg,yg}));
% Kritik nokta ve fonksiyon değeri
x0n = double(x0);
y0n = double(y0);
z0n = double(subs(f,{x,y},{x0n,y0n}));
%% --- Surface Plot ---
figure
surf(xg,yg,fg)
shading interp
colorbar
xlabel('x'); ylabel('y'); zlabel('f(x,y)');
title(['Surface Plot - ' tip])
hold on
% Kritik noktayı 3B işaretle
plot3(x0n,y0n,z0n,'ro','MarkerSize',12,'LineWidth',3)
text(x0n,y0n,z0n, sprintf(' (%g,%g,%g)',x0n,y0n,z0n), ...
 'FontSize',11,'FontWeight','bold')
%% --- Contour (Seviye Eğrileri) ---
figure
contour(xg,yg,fg,20)
colorbar
xlabel('x'); ylabel('y');
title(['Level Curves (Contour) - ' tip])
grid on
hold on
% Kritik noktayı 2B işaretle
plot(x0n,y0n,'ro','MarkerSize',10,'LineWidth',3)
text(x0n,y0n, sprintf(' (%g,%g)',x0n,y0n), ...
 'FontSize',11,'FontWeight','bold')