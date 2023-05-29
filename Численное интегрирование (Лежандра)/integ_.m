function num = integ_(v)
    res = zeros(1, length(v) + 1);
    for i = 1:length(v)
        res(i) = v(i)/(length(v) - i + 1);
    end
    num = polyval(res, 1) - polyval(res, -1);
end

