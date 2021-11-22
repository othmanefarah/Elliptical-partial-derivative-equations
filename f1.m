function [valeur] = f1(x)

n = size(x, 1);
valeur = zeros(n, 1);
for i = 1:n
    valeur(i) = 2*pi * sin(pi * x(i,1)) * sin(pi * x(i,2));
end