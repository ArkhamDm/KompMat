function [answer] = skalyar_proizv(f, g, a, b)

B = conv(f, g);
n=length(B)-1;
C = zeros(1, length(B)+1);
for i=1:length(B)
    C(i)=B(i)/(n+2+1/2-i);
end

sum1 = 0;
sum2 = 0;
for i=0:length(C)-1
    sum1= sum1 + C(length(C)-i)*a^(i+1/2);
end
for i=0:length(C)-1
    sum2= sum2 + C(length(C)-i)*b^(i+1/2);
end
answer = sum2-sum1;
end