for i = 1:10
    x = linspace(1,10,10000*i);
    y = sin(x);

    diff_y = cos(x);
    n = length(x);
    h = x(2)- x(1);

    max_diff = 0;
    agregat2 = zeros(1, n-2);
    for j = 1:n-2
        agregat2(j)=(4*y(j+1)-3*y(j)-y(j+2))/(2*h);
        max_diff = max(abs(diff_y(j)-agregat2(j)),max_diff);
    end
    alpha_2 = log(max_diff)/log(h)

    max_diff_wave = 0;
    agregat2_v = zeros(1, n-2);
    for j = 2:n-1
        agregat2_v(j-1) = (y(j+1)-y(j-1))/(2*h);
        max_diff_wave = max(abs(diff_y(j) - agregat2_v(j-1)), max_diff_wave);
    end
    alpha_2_wave = log(max_diff_wave)/log(h)

end

C1=max_diff/h^2
C2=max_diff_wave/h^2