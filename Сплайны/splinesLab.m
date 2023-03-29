x = linspace(1, 10, 5);
y = sin(x);

n = length(x);

%создание квадратной матрицы сплайнов размером 4(n-1) 
A = zeros(4*(n-1));

%матрица y(k)
B = zeros(4*(n-1), 1);

%отслеживание записи в определенную строчку и колонку
col = 1;
row = 1;
for i = 1:(n-1)
    %запись S_k(x_k) = y_k  
    A(row, col:col+3) = [x(i)^3, x(i)^2, x(i), 1];
    B(row) = y(i);

    %запись S_k(x_k+1) = y_k+1 
    A(row+1, col:col+3) = [x(i+1)^3, x(i+1)^2, x(i+1), 1];
    B(row+1) = y(i+1);

    %если сплайн не последний, то проверяю условие первой и второй
    %производной, иначе заполняю краевые условия
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

%нахожу коэффиециенты
X = (A^-1)*B;

%делю найденые коэффы на сплайны (каждые 4 коэффа - один сплайн)
splines = zeros(n - 1, 4);
for i = 1:n-1
    splines(i, :) = X( (i-1)*4 + 1 : (i-1)*4 + 4 );
end

%считаю шаг и рисую реальный синус
h = x(2)-x(1);
plot(x(1):0.1:x(n), sin(x(1):0.1:x(n)),'b', x, y, 'g*'); hold on
ylim([-1, 1]);

diff = zeros(1, 5);
%рисую сплайн "конструктуром"
for i = 1:n-1
    %вывожу коэффы сплайна
    splines(i, 1:4)
    
    %считаю сплайн_k для x = [x_k, x_k+1]
    xx = (i-1)*h + x(1):0.1:(i-1)*h + h + x(1);
    yy = polyval(splines(i, 1:4), xx);

    %рисую его на промежутке [0, h]
    pl = plot(0:0.1:h, yy, 'r');
    pause;
    delete(pl);

    %рисую сплайн в нужном месте
    plot(xx, yy, 'r');
    pause;
    clc;

    %нахожу макс отклонение, заношу его в 1 ячейку
    %в остальные 4 закидываю координаты
    for j=1:length(yy)
        if abs(yy(j)-sin(xx(j))) > diff(1)
            diff(1) = abs(yy(j)-sin(xx(j)));
            diff(2:5) = [xx(j), xx(j), yy(j), sin(xx(j))];
        end
    end
end
%рисую макс отклонение
diff(1)
plot(diff(2:3), diff(4:5), '--');
pause;











%нахождение макс отклонений и вывод
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
    X = (A^-1)*B;
    
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
xlim([3, 20])
