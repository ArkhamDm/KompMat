x = linspace(1, 10, 10);
y = sin(x);

diff_y = cos(x);
h = x(2)-x(1);
n = length(x);

agregat1 = zeros(1, n-1);
for i = 1:n-1
    agregat1(i) = (y(i+1)-y(i))/h;
end

agregat1_v = zeros(1, n-1);
for i = 2:n
    agregat1_v(i-1) = (y(i)-y(i-1))/h;
end

agregat2 = zeros(1, n-2);
for i = 1:n-2
    agregat2(i) = (4*y(i+1) - 3*y(i) - y(i+2))/(2*h);
end

agregat2_v = zeros(1, n-2);
for i = 2:n-1
    agregat2_v(i-1) = (y(i+1) - y(i-1))/(2*h);
end

agregat4 = zeros(1, n-4);
for i=2:n-3
    agregat4(i-1) = ((-3)*y(i-1) - 10*y(i) + 18*y(i+1) - 6*y(i+2) + y(i+3))/(12*h);
end

agregat4_v = zeros(1, n-4);
for i=3:n-2
    agregat4_v(i-2) = (y(i-2) - 8*y(i-1) + 8*y(i+1) - y(i+2))/(12*h);
end

plot(x(1:n-1), agregat1, 'r', x(2:n), agregat1_v, 'b', x, diff_y, 'black');
legend("I", "I(wave)", "real diff");
plot(x(1:n-2), agregat2, 'r', x(2:n-1), agregat2_v, 'b', x, diff_y, 'black');
legend("II", "II(wave)", "real diff");
plot(x(2:n-3), agregat4, 'r', x(3:n-2), agregat4_v, 'b', x, diff_y, 'black')
legend("IV", "IV(wave)", "real diff");