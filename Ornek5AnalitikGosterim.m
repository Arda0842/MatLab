clc
clear

%% SYMBOLIC TANIM
syms x y
f = x^3 - 3*x*y^2;

disp('--- Fonksiyon ---')
pretty(f)

%% 1) Kısmi Türevler
fx = diff(f,x);
fy = diff(f,y);

disp(' ')
disp('--- Kısmi Türevler ---')
disp('df/dx = ')
pretty(fx)
disp('df/dy = ')
pretty(fy)

%% 2) Kritik Nokta
kritik = solve([fx==0 , fy==0],[x y]);
x0 = kritik.x;
y0 = kritik.y;

disp(' ')
disp('--- Kritik Nokta ---')
fprintf('x* = %s\n',char(x0))
fprintf('y* = %s\n',char(y0))

%% 3) Hessian Matrisi
fxx = diff(f,x,2);
fyy = diff(f,y,2);
fxy = diff(diff(f,x),y);

H = [fxx fxy; fxy fyy];

disp(' ')
disp('--- Hessian Matrisi ---')
pretty(H)

%% 4) Determinant
detH = det(H);
fprintf('\nDet(H) = %s\n',char(detH))

%% 5) Kritik Noktada Determinant
D0 = subs(detH,[x y],[x0 y0]);
fprintf('Kritik noktada Det(H) = %s\n',char(D0))

%% 6) Karar
if double(D0) > 0 && double(subs(fxx,[x y],[x0 y0])) > 0
    tip = 'Minimum Noktasi';
elseif double(D0) > 0 && double(subs(fxx,[x y],[x0 y0])) < 0
    tip = 'Maksimum Noktasi';
elseif double(D0) < 0
    tip = 'Eyer (Saddle) Noktasi';
else
    tip = 'Ikinci Turev Testi Sonucsuz';
end

disp(' ')
disp('--- Sonuc ---')
fprintf('Kritik nokta (%s , %s) -> %s\n',char(x0),char(y0),tip)

%% 7) Fonksiyon Değeri
f_deger = subs(f,[x y],[x0 y0]);
fprintf('Fonksiyon Degeri = %s\n',char(f_deger))