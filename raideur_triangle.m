function [A] = raideur_triangle(C, T)

np = size(C, 1);
A = zeros(np);
[nt,~]=size(T);

for k = 1:nt
    X = C(T(k,:), 1);
    Y = C(T(k,:), 2);
    [M] = M_elements3(X, Y);
    for i = 1:3
        for j = 1:3
            A(T(k,i), T(k,j)) = A(T(k,i), T(k,j)) + M(i,j);
        end
    end
end
    
