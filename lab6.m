clear; close all;
global t_end;
t_end = 5;
k = [-1.52 -0.51];
u = @(x) k(1)*x(1)+k(2)*x(2);
fun6 = @(t,x) [x(2)+u(x); -x(2)+u(x)];
[t,x] = ode45(fun6, [0 t_end], [1 0]);
U = k(1)*x(:,1)+k(2)*x(:,2);
figure('Color','white');
grid on; hold on;
plot(t,x(:,1));
plot(t,x(:,2));
plot(t,U);

K = fminsearch(@fmsfun_lab6, [1 0]);
u1 = @(x) K(1)*x(1)+K(2)*x(2);
fun6 = @(t,x) [x(2)+u1(x); -x(2)+u1(x)];
[t1,x1] = ode45(fun6, [0 t_end], [1 0]);
U1 = K(1)*x1(:,1)+K(2)*x1(:,2);

plot(t1,x1(:,1),'--','LineWidth',1);
plot(t1,x1(:,2),'--','LineWidth',1);
plot(t1,U1,'--','LineWidth',1);
legend ('x_1(t) - аналитический', 'x_2(t) - аналитический', 'u(t) - аналитический', ...
        'x_1(t) - численный', 'x_2(t) - численный', 'u(t) - численный');