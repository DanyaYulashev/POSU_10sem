function f = fmsfun_lab5(T)
    global t1 u_max x10 x20;
    t = [];
    x = [];
    u = [];
    t1 = T(1);
    [t,x] = ode45(@odefun_lab5, [0 abs(T(2))], [x10 x20]);
    f = x(end,1)^2 + x(end,2)^2;
end