close;
clear all;
h = [];
err = [];
for n = 10:50
    [coordinates, elements3, elements4, dirichlet, neumann] = maillage_carre(n);
    A = raideur_triangle(coordinates, elements3);
    [np, ~] = size(coordinates);
    [nt,~] = size(elements3);
    b = zeros(np, 1);
    u = zeros(np, 1);
    for j = 1:nt
        coordonnees = coordinates(elements3(j,:),:)';
        alpha = det([coordonnees(:,2)-coordonnees(:,1) ...
        coordonnees(:,3)-coordonnees(:,1)]);
        b(elements3(j,:)) = b(elements3(j,:)) + alpha * f1(sum(coordinates(elements3(j,:),:))/3)/6;
    end
    u(unique(dirichlet)) = u_d(coordinates(unique(dirichlet),:));
    b = b - A * u;
    u = zeros(n^2, 1);
    pointsLibres = setdiff(1:n^2, unique(dirichlet));
    u(pointsLibres) =  A(pointsLibres, pointsLibres) \ b(pointsLibres);
    h = [h 1/n];
    solutionExacte = u_exacte(coordinates);
    err = [err norm(solutionExacte - u)/size(u, 1)];
end
loglog(h, err);
title("Tracé de l'erreur")
xlabel('log(h)')
ylabel('log(|| u^{ex}_h -u_h ||_{2h})')