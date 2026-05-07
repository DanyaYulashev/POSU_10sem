clear all; close all;
t1 = 10; t2 = 11.5; T = 12;
x10 = 12;
u = @(t) -1.5*(t < t1) + 1.5*(t >= t1) - 3*(t >= t2) + 1.5*(t >= T);
fun7 = @(t,x) [x(2); x(3); -x(2) - 2*x(3) + 0.9*u(t)];
[t1, x1] = ode45(fun7, [T t2], [0 0 0]);
[t2, x2] = ode45(fun7, [0 t2], [x10 0 0]);
figure('color','white')
grid on; hold on;
plot(x1(:,2), x1(:,3),x2(:,2), x2(:,3));
[t,x] = ode45(fun7, [0 T], [x10 0 0]);
figure('color','white')
grid on; hold on;
plot(t,x);
x1T1 = x(end,1);
plot(t,u(t),'b--')
legend('x_1(t)','x_2(t)','x_3(t)','u(t)')
xlabel('t,c');

% t0 = [t1 t2 T];
% iter = 0;
% err = 10e3;
% while (err >= 1e-5)
%     fprintf('Начальные значения на шаге %2d: %.3f\t%.3f\t%.3f\n',iter, t0);
%     [T_find, err] = fminsearch(@costfun_lab7,t0);
%     iter = iter+1;
%     t0 = T_find;
% end
% fprintf('Конечные значения нашлись на шаге %2d: %.3f\t%.3f\t%.3f\n',iter, t0);
