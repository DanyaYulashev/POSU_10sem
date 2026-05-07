clear all; close all;
global fun8 x10 x20;
fun8 = @(t,x,u) [x(2); -0.89*x(1) - x(2) + u];
x10 = -10; x20 = -4;
function f = costfun(t)
    global fun8 x10 x20;
    t1 = t(1);
    t2 = t(2);
    T = t(3);
   
    u = @(t) 0.89 * ((t < t1) - (t >= t1) + 2*(t >= t2));

    [~, x] =ode45(@(t,x) fun8(t,x,u(t)), [0 T], [x10 x20]);

    f = x(end,1)^2 + x(end,2)^2;
end

t0 = [1 4 6];
t_opt = fminsearch(@costfun, t0);

fprintf(['Подобранные численно оптимальные значения времен переключения:\n' ...
    't_1 = %.3f\nt_2 = %.3f\nT = %.3f\n'], t_opt);

u_opt = @(t) 0.89 * ((t < t_opt(1)) - (t >= t_opt(1)) + 2*(t >= t_opt(2)));
[t,x] = ode45(@(t,x) fun8(t,x,u_opt(t)), [0 t_opt(3)], [x10 x20]);
figure('color','white')
plot(x(:,1),x(:,2)); grid on;
xlabel('x_1'); ylabel('x_2');

figure('color','white');
plot(t,u_opt(t)); grid on;
xlabel('t,c'); ylabel('u(t)');