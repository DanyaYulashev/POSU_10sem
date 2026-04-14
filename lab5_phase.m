clear all;
sys1 = @(t,x) [0.5*x(2)-2; -x(2)-2];
sys2 = @(t,x) [0.5*x(2)+2; -x(2)+2];

tend = 10;
T1 = [0 1.72]; T2 = [1.72 0];
    
[t1, x1] = ode45(sys1, T1, [2 0]);
[t2, x2] = ode45(sys2, T2, [0 0]);

eps = 1e-3;
dist_matrix = zeros(length(t1), length(t2));
for i = 1:length(t1)
    for j = 1:length(t2)
        dist_matrix(i,j) = norm(x1(i,:) - x2(j,:));
    end
end
[min_dist, idx] = min(dist_matrix(:));
[i_min, j_min] = find(dist_matrix == min_dist);
t_match = t1(i_min(1));
fprintf('Момент переключения: t_1 = %.4f\n',t_match);

figure('color','white')
hold on; grid on;
title('Фазовое пространство')
plot(x1(:,2),x1(:,1));
plot(x2(:,2),x2(:,1));
xlabel('x2'), ylabel('x1');
legend('t = [0 tend]','t = [tend 0]')

global t1 u_max;
t1 = t_match; u_max = 2;
[t,x] = ode45(@odefun_lab5,[0 1.72],[2 0]);
u = 2 * (-(t < t_match) + (t >= t_match));
figure('color','white');
hold on; grid on;
plot(t,x(:,1), '-r');
plot(t,x(:,2), '-b');
plot(t,u, '-k');
xlim([0 2]);