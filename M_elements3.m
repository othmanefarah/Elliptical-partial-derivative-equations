function [M] = M_elements3(X, Y)

M = zeros(3, 3);
alpha = det([X(2)-X(1), X(3)-X(1); Y(2)-Y(1), Y(3)-Y(1)]);
grad_eta = zeros(2, 3);
grad_eta(:, 1) = (1/alpha) * [Y(2)-Y(3); X(3)-X(2)];
grad_eta(:, 2) = (1/alpha) * [Y(3)-Y(1); X(1)-X(3)];
grad_eta(:, 3) = (1/alpha) * [Y(1)-Y(2); X(2)-X(1)];
M = (alpha/2) * (grad_eta' * grad_eta);

