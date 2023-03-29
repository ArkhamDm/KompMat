x = linspace(1, 10, 10);
y = sin(x);

n = length(x);
A = zeros(4*(n-1));
B = zeros(4*(n-1), 1);
col = 1;
row = 1;
for i = 1:(n-1)
    A(row, col:col+3) = [x(i)^3, x(i)^2, x(i), 1];
    B(row) = y(i);
    A(row+1, col:col+3) = [x(i+1)^3, x(i+1)^2, x(i+1), 1];
    B(row+1) = y(i+1);

    row = row + 2;
    if i ~= n-1
        A(row, col:col+7) = [3*x(i+1)^2, 2*x(i+1), 1, 0, -3*x(i+1)^2, -2*x(i+1), -1, 0];
        A(row+1, col:col+7) = [6*x(i+1), 2, 0, 0, -6*x(i+1), -2, 0, 0];
    else
        A(row, 1:2) = [6*x(1), 2];
        A(row+1, col:col+1) = [6*x(n), 2]; 
    end
    row = row + 2;
    col = col + 4;
end 
X = B'/A';

splines = zeros(n - 1, 4);
for i = 1:n-1
    splines(i, :) = X( (i-1)*4 + 1 : (i-1)*4 + 4 );
end

h = x(n)-x(n-1);
plot(1:0.1:x(n), sin(1:0.1:x(n)),'b', x, y, 'g*'); hold on
ylim([-1, 1]);
for i = 1:n-1
    splines(i, 1:4)
    
    h = x(2)- x(1);
    xx = (i-1)*h + 1:0.1:(i-1)*h + 1 + h;
    yy = polyval(splines(i, 1:4), xx);
    pl = plot(0:0.1:h, yy, 'r');
    pause;
    delete(pl);

    yy = polyval(splines(i, 1:4), xx);
    plot(xx, yy, 'r');
    pause;
    clc;
end







for m = 3:20
    x = linspace(1, 10, m);
    y = sin(x);
    
    n = length(x);
    A = zeros(4*(n-1));
    B = zeros(4*(n-1), 1);
    col = 1;
    row = 1;
    for i = 1:(n-1)
        A(row, col:col+3) = [x(i)^3, x(i)^2, x(i), 1];
        B(row) = y(i);
        A(row+1, col:col+3) = [x(i+1)^3, x(i+1)^2, x(i+1), 1];
        B(row+1) = y(i+1);
    
        row = row + 2;
        if i ~= n-1
            A(row, col:col+7) = [3*x(i+1)^2, 2*x(i+1), 1, 0, -3*x(i+1)^2, -2*x(i+1), -1, 0];
            A(row+1, col:col+7) = [6*x(i+1), 2, 0, 0, -6*x(i+1), -2, 0, 0];
        else
            A(row, 1:2) = [6*x(1), 2];
            A(row+1, col:col+1) = [6*x(n), 2]; 
        end
        row = row + 2;
        col = col + 4;
    end 
    X = B'/A';
    
    splines = zeros(n - 1, 4);
    for i = 1:n-1
        splines(i, :) = X((i-1)*4 + 1:(i-1)*4 + 4);
    end
    
    diff = 0;
    for i = 1:n-1
        h = x(2) - x(1);
        xx = (i-1)*h + 1:0.1:(i-1)*h + 1 + h;
        yy = polyval(splines(i, 1:4), xx);
        for j=1:length(yy)
            diff = max(abs(yy(j)-sin(xx(j))), diff);
        end
    end
    diff_all(m-2) = diff;
end
figure;
plot(3:20, diff_all);
