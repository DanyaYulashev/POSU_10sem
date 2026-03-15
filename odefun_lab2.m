function f = odefun_lab2(t,x)
    global t1 Umax;
    if (t < t1)
        u = Umax / t1 * t;
    else
        u = 2 * Umax - Umax / t1 * t;
    end
    f = -0.15 * x + u;
end