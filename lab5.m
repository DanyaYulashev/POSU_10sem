clear all; close all;
global u_max x10 x20;
u_max = 2;
x10 = 2; x20 = 0;
ti0 = [1 1.5];
T = fminsearch(@fmsfun_lab5, ti0);

t1 = T(1);
T_end = T(2);

[t,x] = ode45(@odefun_lab5, [0 T_end], [x10 x20]);
u = u_max * (-(t < t1) + (t >= t1));

figure('color','white');
grid on; hold on;
plot(t,x(:,1), '-r');
plot(t,x(:,2), '-b');
plot(t,u, '-k');
xlim([0 2]);
legend('x_1(t)','x_2(t)','u(t)')