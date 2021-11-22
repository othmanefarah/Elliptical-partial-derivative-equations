function [b] = b_elements3(C, T, dirichlet, A)

[np, ~] = size(C);
[nt,~] = size(T);
b = zeros(np, 1);
u = zeros(np, 1);

for j = 1:nt
    coordonnees = C(T(j,:),:)';
    alpha = det([coordonnees(:,2)-coordonnees(:,1) ...
    coordonnees(:,3)-coordonnees(:,1)]);
    b(T(j,:)) = b(T(j,:)) + alpha * f(sum(C(T(j,:),:))/3)/6;
end

u(unique(dirichlet)) = u_d(C(unique(dirichlet),:));
b = b - A * u;

