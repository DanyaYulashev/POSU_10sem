function f = odefun_lab5(t,x)
    global t1 u_max;
    if t < t1
        u = -u_max;
    else
        u = u_max;
    end
    f = [0.5*x(2)+u; -x(2)+u];
end