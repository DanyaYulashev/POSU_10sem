function f = fmsfun_lab3(w)
    global K;
    x10 = 1; x20 = 0; x30 = 0;
    Ak = [0 -1 -1; 0 1 2; 1 0 0]; Bk = [3*w-1; -3*w^2 - 2; w^3];
    K = Ak\Bk;
    tend = 10;
    [t,x] = ode45(@odefun_lab3,[0 tend],[x10 x20 x30]);
    tm = tend;
    for i = length(t):-1:1
        if abs(x(i,1)) > 0.05 * x10
            tm = t(i);
            break;
        end
    end
    f = tm;
end