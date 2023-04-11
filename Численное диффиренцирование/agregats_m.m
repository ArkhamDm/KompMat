x = linspace(1, 10, 10);
y = sin(x);

diff_y = cos(x);
h = x(2)-x(1);
n = length(x);

agregat1 = zeros(1, n-1);
for i = 2:n
    agregat1(i-1) = (y(i)-y(i-1))/h;
    
end

agregat2 = zeros(1, n-2);
for i = 2:n-1
    agregat2(i-1) = (y(i+1) - y(i-1))/(2*h);
end

agregat4 = zeros(1, n-4);
for i=3:n-2
    agregat4(i-2) = (y(i-2) - 8*y(i-1) + 8*y(i+1) -y(i+2))/(12*h);
end

hold on;
plot(x(2:n), agregat1, "black", x(2:n-1), agregat2, "g");
plot(x(3:n-2), agregat4, "r", x, diff_y, "b");
legend("I", "II", "IV", "cos(x)");
