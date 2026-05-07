clear all; close all;
x10 = -10; x20 = -4;

fun8 = @(t,x) [x(2); -0.89*x(1) - x(2) + 0.8];
[t1,x1] = ode23s(fun8, [1.25*pi 0], [0 0]);

fun8_2 = @(t,x) [x(2); -0.89*x(1) - x(2) - 0.8];
[t2,x2] = ode23s(fun8_2, [0 1.25*pi], [x10 x20]);

figure('Color','white');
plot(x1(:,1),x1(:,2),'-r',x2(:,1),x2(:,2));
grid on;
%тут нет пересечений, 
% нужно искать еще одну линию пересечений

figure('Color','white');
hold on; grid on;
plot(x1(:,1),x1(:,2),'-r');
N = 20;
for i = 1:N
    T = 1.25*pi + i*1.25*pi/N; t1 = T - i*1.25*pi/N;
    u_t1= @(t,t1) [0.8*((t >= t1) - (t < t1))];
    fun8_i = @(t,x) [x(2); -0.89*x(1) - x(2) + u_t1(t,t1)];
    [t,x] = ode23s(fun8_i, [T 0], [0 0]);
    plot(x(end,1),x(end,2),'r*');
end

t1 = 1.2;
t2 = t1 + 1.2 * pi;
T = 5.6;
u_t_all = @(t)[0.8*((t < t1) -(t >= t1) + 2*(t >= t2))];
rp_ode = @(t,x) [x(2); -0.89*x(1) - x(2) + u_t_all(t)];
[t3,x3]=ode23s(rp_ode,[0 T],[x10 x20]);
plot(x3(:,1),x3(:,2),'b')