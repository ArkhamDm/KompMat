crush = zeros(2, 10);
for i = 1:10
    x = linspace(1, 10, 2000*i);
    y = sin(x);

    diff_y = cos(x);
    n = length(x);
    h = x(2) - x(1);

    max_diff_wave = 0;
    agregat4_v = zeros(1, n-4);
    for j = 3:n-2
        agregat4_v(j-2) = (y(j-2) - 8*y(j-1) + 8*y(j+1) - y(j+2))/(12*h);
        max_diff_wave = max(abs(diff_y(j) - agregat4_v(j-2)), max_diff_wave);
    end
    
    crush(1, i) = h;
    crush(2, i) = max_diff_wave;
end

plot(crush(1, :), crush(2, :))
