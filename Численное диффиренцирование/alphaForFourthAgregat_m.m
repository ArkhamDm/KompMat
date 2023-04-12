for i = 1:10
    x = linspace(1,10, 400*i);
    y = sin(x);

    diff_y = cos(x);
    n = length(x);
    h = x(2) - x(1);

    max_diff = 0;
    agregat4 = zeros(1, n-4);
    for j = 2:n-3
        agregat4(j-1) = ((-3)*y(j-1) - 10*y(j) + 18*y(j+1) - 6*y(j+2) + y(j+3))/(12*h);
        max_diff = max(abs(diff_y(j)-agregat4(j-1)),max_diff);
    end
    alpha_4 = log(max_diff)/log(h)

    max_diff_wave = 0;
    agregat4_v = zeros(1, n-4);
    for j = 3:n-2
        agregat4_v(j-2) = (y(j-2) - 8*y(j-1) + 8*y(j+1) - y(j+2))/(12*h);
        max_diff_wave = max(abs(diff_y(j) - agregat4_v(j-2)), max_diff_wave);
    end
    alpha_4_wave = log(max_diff_wave)/log(h)

end

C1=max_diff/h^4
C2=max_diff_wave/h^4