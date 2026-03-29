function f = fmsfun_lab4(psi0)
   costfun = @(t,x) [2*x(2); -2*x(2) + 0.5*x(4); 0; 2*(x(4)-x(3))];
   t = [];
   tend = 2.5;
   x = [];
   [t,x] = ode45(costfun, [0 tend], [1 0 psi0(1) psi0(2)]);

   f = x(end,1)^2 + x(end,2)^2;
end