function [A] = raideur_quadrangle(C, T, Q)

np = size(C, 1);
A = zeros(np);
[nq,~]=size(Q);
[nt,~]=size(T);

for k = 1:nq
    X = C(Q(k,:), 1);
    Y = C(Q(k,:), 2);
    [M] = M_elements4(X, Y);
    for i = 1:4
        for j = 1:4
            A(Q(k,i), Q(k,j)) = A(Q(k,i), Q(k,j)) + M(i,j);
        end
    end
end

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

