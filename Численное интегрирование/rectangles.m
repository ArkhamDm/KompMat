clc;
n = 7;
left = 1;
right = 3;
x = linspace(left, right, n);
y = sin(x);
h = (x(n) - x(1))/ (n-1);

n2 = 14;
x2 = linspace(left, right, n2);
y2 = sin(x2);
h2 = (x2(n2) - x2(1))/ (n2-1);

disp("Значение интеграла");
integralReal = -cos(right) + cos(left);
disp(integralReal);

disp("Метод правых прямоугольников")
rightRectangle = sum(h*y(2:n));
disp(rightRectangle);
rightRectangle2 = sum(h2*y2(2:n2));
alpha = 1;
disp("Ошибка по Рунге")
runge = abs(rightRectangle2 - rightRectangle)/(2^alpha - 1);
disp(runge);
disp("Уточнение по Ричардсону")
intRich = (2^alpha * rightRectangle2 - rightRectangle) / (2^alpha - 1);
disp(intRich);

disp("Метод левых прямоугольников")
leftRectangle = sum(h*y(1:n-1));
disp(leftRectangle);
leftRectangle2 = sum(h2*y2(1:n2-1));
alpha = 1;
disp("Ошибка по Рунге")
runge = abs(leftRectangle2 - leftRectangle)/(2^alpha - 1);
disp(runge);
disp("Уточнение по Ричардсону")
intRich = (2^alpha * leftRectangle2 - leftRectangle) / (2^alpha - 1);
disp(intRich);

disp("Метод средних прямоугольников")
m = 1:n-1;
middleRectangle = sum(h*sin((x(m+1) + x(m)) / 2));
disp(leftRectangle);
m2 = 1:n2-1;
middleRectangle2 = sum(h2*sin((x2(m2+1) + x2(m2)) / 2));
alpha = 2;
disp("Ошибка по Рунге")
runge = abs(middleRectangle2 - middleRectangle)/(2^alpha - 1);
disp(runge);
disp("Уточнение по Ричардсону")
intRich = (2^alpha * middleRectangle2 - middleRectangle) / (2^alpha - 1);
disp(intRich);

disp("Метод трапеций")
trapezoid = h/2 * (y(1) + 2*sum(y(2:n-1)) + y(n));
disp(trapezoid);
trapezoid2 = h2/2 * (y2(1) + 2*sum(y2(2:n2-1)) + y2(n2));
alpha = 2;
disp("Ошибка по Рунге")
runge = abs(trapezoid2 - trapezoid)/(2^alpha - 1);
disp(runge);
disp("Уточнение по Ричардсону")
intRich = (2^alpha * trapezoid2 - trapezoid) / (2^alpha - 1);
disp(intRich);


disp("Метод симпсона")
Odd = sum(y(2:2:n - 1));
Even = sum(y(3:2:n - 1));
simpson = (h/3)*(y(1) + 4*Odd + 2*Even + y(n));
disp(simpson);

n2 = 13;
x2 = linspace(left, right, n2);
y2 = sin(x2);
h2 = (x2(n2) - x2(1))/ (n2-1);

Odd2 = sum(y2(2:2:n2 - 1));
Even2 = sum(y2(3:2:n2 - 1));
simpson2 = (h2/3)*(y2(1) + 4*Odd2 + 2*Even2 + y2(n2));
alpha = 4;
disp("Ошибка по Рунге")
runge = abs(simpson2 - simpson)/(2^alpha - 1);
disp(runge);
disp("Уточнение по Ричардсону")
intRich = (2^alpha * simpson2 - simpson) / (2^alpha - 1);
disp(intRich);