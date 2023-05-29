function res = sk_pr(f, g)
    v = conv(f, g);
    b(1) = -v(1);
    n = length(v);
    for i = 2:n
        b(i) = (n-i+1)*b(i-1) - v(i);
    end
    res = b(n);
end

