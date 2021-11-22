function [U] = u_exacte(x)

n = size(x, 1);
U = zeros(n, 1);
for i = 1:n
    U(i) = sin(pi * x(i,1)) * sin(pi * x(i,2));
end