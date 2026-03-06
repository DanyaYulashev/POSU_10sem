% variant 17
x10 = 1; x20 = 0; x30 = 0;
t_end = 30;
fun = @(t,x) [2*x(2); -1*x(1) + 0.5*x(3); -2*x(1)-4*x(2)-3*x(3)];
[t,X] = ode45(fun, [0 t_end], [x10, x20, x30]);

A = [0,2,0;-1,0,0.5;-2,-4,-3];
eigenvals = eig(A);
T = t;
figure('color','white');
grid on; hold on;
plot(t,X, '-');
syms t;
% legend("X1 - численный", "X2 - численный", "X3 - численный","X1 - аналитический", "X2 - аналитический", "X3 - аналитический");