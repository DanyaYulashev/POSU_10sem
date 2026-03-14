clear all;
z = @(x) x(1)^2 + x(2)^2 + 4*x(1) + 4;
costfunc = @(x) exp(-0.1 * z(x))*cos(z(x));
%поиск глобального максимума
X = fminsearch(costfunc, [0, 0]);
%исследование поведения функции в районе экстремума
x1 = -8:0.1:4; x2 = -8:0.1:6;
[X1,X2] = meshgrid(x1,x2);
Z = exp(-0.1 * (X1.^2 + X2.^2 + 4*X1 + 4)).*cos((X1.^2 + X2.^2 + 4*X1 + 4)); 

figure('color','white');
subplot(1,2,1);
grid on; hold on;
surf(X1,X2,Z);
view(45, 30);

subplot(1,2,2);
grid on; hold on;
contour(X1,X2,Z,[X(1) X(2) 20]);

costfunc(X)