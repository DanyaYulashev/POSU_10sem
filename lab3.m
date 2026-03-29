clear all; close all;
global K umax;
umax = 1.4;
w0 = 2;
w_opt = fminsearch(@fmsfun_lab3,w0);

fprintf('Оптимальная частота w_opt = %.4f\n', w_opt);

[t,x] = ode45(@odefun_lab3, [0 10], [1 0 0]);
figure('color','white');
grid on; hold on;
plot(t, x);
plot([0 10], [0.05 0.05], 'r--', [0 10], [-0.05 -0.05], 'r--');
xlabel('t,c'); ylabel('x(t)');
title(sprintf('w_opt = %.4f', w_opt));
legend('x_1(t)','x_2(t)','x_3(t)');

u = zeros(size(t));
for i=1:length(t)
    u(i) = K(1)*x(i,1) + K(2)*x(i,2) + K(3)*x(i,3);
    if abs(u(i)) > umax, u(i) = umax*sign(u(i)); end
end
figure('color','white');
grid on; hold on;
plot(t,u);
xlabel('t,c'); ylabel('u(t)');
title('Закон управления u(t)');