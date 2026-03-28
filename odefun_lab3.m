function f = odefun_lab3(t,x)
    global K umax;
    u = K(1) * x(1) + K(2) * x(2) + K(3) * x(3);
    if abs(u) > umax
        u = umax * sign(u);
    end
    f = [x(2) - x(3);
         -2*x(2) + 2*x(3) + u;
         x(3) + u];
end