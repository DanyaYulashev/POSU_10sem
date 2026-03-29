clear all; close all;
s = dsolve('Dx1 = 2*x2', 'Dx2 = -2*x2+0.5*psi2', 'Dpsi1 = 0', 'Dpsi2 = 2*(psi2-psi1)', ...
    'x1(0)=1','x2(0)=0','x1(2.5)=0','x2(2.5)=0');
fun = @(t,x) [2*x(2);
              -2*x(2)+0.5*x(4);
              0;
              2*(x(4)-x(3))];
tend = 2.5;
psi0B = [1 1];
u = fminsearch(@fmsfun_lab4, psi0B);
[T,X] = ode45(fun, [0 tend],[1 0 u(1) u(2)]);

syms t;
for i = 1:length(T)
    x1(i) = double(subs(s.x1, t, T(i)));
    x2(i) = double(subs(s.x2, t, T(i)));
    psi1(i) = double(subs(s.psi1, t, T(i)));
    psi2(i) = double(subs(s.psi2, t, T(i)));
end

u_anal = 0.5 * psi2;
u_chisl = 0.5 * X(:,4);

figure('color','white');
subplot(3,1,1);
hold on; grid on;
plot(T,X(:,1));
plot(T,x1,'--','LineWidth',2)
xlabel('t, с'); ylabel('x_1(t)');
legend('x_1(t) - численное','x_1(t) - аналитическое');

subplot(3,1,2);
hold on; grid on;
plot(T,X(:,2));
plot(T,x2,'--','LineWidth',2)
xlabel('t, с'); ylabel('x_2(t)');
legend('x_2(t) - численное','x_2(t) - аналитическое');

subplot(3,1,3);
hold on; grid on;
plot(T,u_chisl);
plot(T,u_anal,'--','LineWidth',2);
xlabel('t, с'); ylabel('u(t)');
legend('u(t) - численное','u(t) - аналитическое');