fun = @(x)x(1)^2 - x(2)^2 - 10  + x(1) + 3*x(2) - 10;

x0 = [1,1];
[x,fval] = fminunc(fun,x0)