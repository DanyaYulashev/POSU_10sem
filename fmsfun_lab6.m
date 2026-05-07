function f = fmsfun_lab6(k)
    global t_end;
    lambda = 2.3;
    u = @(x) k(1)*x(1)+k(2)*x(2);
    fun6 = @(t,x) [x(2)+u(x); -x(2)+u(x)];
    [t,x] = ode45(fun6, [0 t_end], [1 0]);
    U = k(1)*x(:,1)+k(2)*x(:,2);
    integrand = lambda * x(:,1).^2 + U.^2;
    J = 0.5 * trapz(t, integrand);
    f = J ^ 2;
end