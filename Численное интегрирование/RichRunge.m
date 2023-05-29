n = 10;
x = linspace(1, 3, n);
y = sin(x);
h = x(2) - x(1);
integral = -cos(3) + cos(1)
%трапеции
trapezoid = h/2*(y(1)+2*sum(y(2:n-1))+y(n))
intg_real = integral - trapezoid
N = 2*n;
x = linspace(1,3,N);
y = sin(x);
h = x(2)-x(1);
trapezoid_2h = h/2*(y(1)+2*sum(y(2:N-1))+y(N))


intg_runge = (trapezoid - trapezoid_2h)/3