for n = 3:20
  x = linspace(1, 5, n);
  y = sin(x);
  h = x(2) - x(1);
  plot(1:0.1:5, sin(1:0.1:5), 'b');
  hold on
  for i = 1:n - 1
      if y(i) < 0
          rectangle('Position', [x(i), y(i), h, abs(y(i))]);
      else
          rectangle('Position', [x(i), 0, h, y(i)]);
      end
  end
  clc
  integral = -cos(5) + cos(1)
  leftRectangle = sum(h*y(1:n-1))
  hold off
  waitforbuttonpress;
end

for n = 3:20
  x = linspace(1, 5, n);
  y = sin(x);
  h = x(2) - x(1);
  plot(1:0.1:5, sin(1:0.1:5), 'b');
  hold on
  for i = 1:n - 1
      plot([x(i), x(i), x(i+1), x(i+1), x(i)], [0, y(i), y(i+1), 0, 0], 'black');
  end
  clc
  integral = -cos(5) + cos(1)
  trapezoid = h/2 * (y(1) + 2*sum(y(2:n-1)) + y(n))
  hold off
  waitforbuttonpress;
end