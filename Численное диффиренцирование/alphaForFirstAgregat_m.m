for i = 1:10
    x = linspace(1,10,1000*i);
    y = sin(x);

    diff_y = cos(x);
    n = length(x);
    h = x(2)- x(1);

    max_diff = 0;
    agregat1 = zeros(1, n-1);
    for j = 1:n-1
        agregat1(j)=(y(j+1)-y(j))/h;
        max_diff = max(abs(diff_y(j) - agregat1(j)), max_diff);
    end

    alpha_1 = log(max_diff)/log(h)

    max_diff_wave = 0;
    agregat1_wave = zeros(1, n-1);
    for j = 2:n
        agregat1_wave(j-1) = (y(j)-y(j-1))/h;
        max_diff_wave = max(abs(diff_y(j)-agregat1_wave(j-1)),max_diff_wave);
    end
    alpha_1_wave = log(max_diff_wave)/log(h)
end

C1=max_diff/h
C2=max_diff_wave/h