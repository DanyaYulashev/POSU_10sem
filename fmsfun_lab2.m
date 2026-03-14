function f = fmsfun_lab2(Um)
    global t t1 x x0 u Umax;
    Umax = Um;
    t = [];
    x = [];
    u = [];

    [t,x] = ode45(@odefun_lab2, [0 2*t1], [x0]);

    for i = 1:length(t)
        if t(i) <= t1
            u(i) = Um / t1 * t(i);
        else
            u(i) = 2*Um - Um / t1 * t(i);
        end
    end
    f = x(end) * x(end);
end

