function d = diff_(a)
    len_a = length(a);
    d = zeros(1, len_a-1);
    for i = 1:len_a - 1
        d(i) = (len_a - i)*a(i);
    end
end

