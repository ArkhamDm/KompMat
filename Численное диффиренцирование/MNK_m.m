n = 20;
X = linspace(0,1,n);

p1 = 5; p2 = -3; p3 = 2;
Y = p1 + p2*X + p3*X.^2;

sigma = 0.3;
Z = sigma * (randn(n,1)');
Y_shum = (Y + Z)';


t_y = 1.96;
s_n = 0.3;
x_average = sum(X)/n;
y_average = sum(Y_shum)/n;
K_x_y = sum((X' - x_average).*(Y_shum - y_average))/n;
D_X = sum((X - x_average).^2)/n;
o_2 = K_x_y/D_X;
delta = t_y * s_n * n^(-1/2) * ( (1 + (( X - x_average).^2/D_X)) ).^(1/2);
f_x_o = y_average + o_2*(X - x_average);

F_minus = f_x_o - delta;
F_plus = f_x_o + delta;

parabola = [X'.^2, X', ones(n, 1)];
straight = [X', ones(n,1)];

A = parabola;
coef_parabola = (A'*A)^(-1) * (A'*Y_shum);

A = straight;
coef_straight = (A'*A)^(-1) * (A'*Y_shum);

podgonka_parabola = parabola * coef_parabola;
podgonka_straight = straight * coef_straight;

plot(X, Y_shum,'*', X, Y, 'black', X, podgonka_parabola,'b', X, F_plus, 'r', X, F_minus, 'r'); grid on;
legend("Шум", "Реал кривая","МНК парабола")
plot(X, Y_shum,'*', X, Y, 'black', X, podgonka_straight, 'b', X, F_plus, 'r', X, F_minus, 'r'); grid on;
legend("Шум", "Реал кривая","МНК прямая")



neviazka_parabola = Y_shum - podgonka_parabola;
proof_that_ortog = sum(neviazka_parabola.*podgonka_parabola)

neviazka_straight = Y_shum - podgonka_straight;
proof_that_ortog = sum(neviazka_straight.*podgonka_straight)


dispersia_shum_parabola = sqrt(sum(neviazka_parabola.^2)/(n-3))
dispersia_shum_straight = sqrt(sum(neviazka_straight.^2)/(n-2))