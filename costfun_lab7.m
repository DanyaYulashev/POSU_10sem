function f = costfun_lab7(Tstart)
t1 = Tstart(1); t2 = Tstart(2); T = Tstart(3);
u = @(t) -1.5*(t < t1) + 1.5*(t >= t1) - 3*(t >= t2) + 1.5*(t >= T);
fun7 = @(t,x) [x(2); x(3); -x(2) - 2*x(3) + 0.9*u(t)];
[t,x] = ode45(fun7, [0 T], [12 0 0]);
f = x(end, :) * [x(end,:)]';
plot(t,x,t,u(t),'b--');
legend('x_1(t)','x_2(t)','x_3(t)','u(t)')
xlabel('t,c')
grid on;
end