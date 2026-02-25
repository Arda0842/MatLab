clc
clear

%% SYMBOLIC TANIM
syms x y
f = x^2 - y^2 + 4*x*y;

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

%% 2) Kritik Nokta (Gradient = 0)
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

detH = det(H);
fprintf('\nDet(H) = %s\n',char(detH))

%% 4) Nokta Türü Kararı
D_value = double(subs(detH,[x y],[x0 y0]));
fxx_value = double(subs(fxx,[x y],[x0 y0]));

if D_value > 0 && fxx_value > 0
    tip = 'Minimum Noktasi';
elseif D_value > 0 && fxx_value < 0
    tip = 'Maksimum Noktasi';
else
    tip = 'Eyer (Saddle) Noktasi';
end

disp(' ')
disp('--- Sonuc ---')
fprintf('Kritik nokta (%s , %s) -> %s\n',char(x0),char(y0),tip)

%% 5) Fonksiyon Değeri
f_deger = subs(f,[x y],[x0 y0]);
fprintf('Fonksiyon Degeri = %s\n',char(f_deger))