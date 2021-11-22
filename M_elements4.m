function [M] = M_elements4(X, Y)

J = [X(2)-X(1), X(4)-X(1);
     Y(2)-Y(1), Y(4)-Y(1)];
B = inv(J' * J);
C1 = [2, -2; -2, 2] * B(1,1) + ...
    [3, 0; 0, -3] * B(1,2) + ...
    [2, 1; 1, 2] * B(2,2);
C2 = [-1, 1; 1, -1] * B(1,1) + ...
    [-3, 0; 0, 3] * B(1,2) + ...
    [-1, -2; -2, -1] * B(2,2);
M = det(J) * [C1 C2; C2 C1]/6;