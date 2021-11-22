function [b] = b_elements4(C, T, Q, dirichlet, neumann, A)

[np, ~] = size(C);
[nt,~] = size(T);
[nq,~] = size(Q);
b = zeros(np, 1);
u = zeros(np, 1);

for j = 1:nq
    c = C(Q(j,:),:)';
    alpha = det([c(:,2)-c(:,1) ...
    c(:,4)-c(:,1)]);
    b(Q(j,:)) = b(Q(j,:)) + alpha * f(sum(C(Q(j,:),:))/4)/4;
end

for j = 1:nt
    c = C(T(j,:),:)';
    alpha = det([c(:,2)-c(:,1) ...
    c(:,3)-c(:,1)]);
    b(T(j,:)) = b(T(j,:)) + alpha * f(sum(C(T(j,:),:))/3)/6;
end

% Condition de Dirichlet
u(unique(dirichlet)) = u_d(C(unique(dirichlet),:));
b = b - A * u;

% Condition de Neumann
for j = 1 : size(neumann,1)
    b(neumann(j,:))=b(neumann(j,:)) + ...
    norm(C(neumann(j,1),:) - ...
    C(neumann(j,2),:)) * ...
    g(sum(C(neumann(j,:),:))/2)/2;
end
