clear;
close all;

k = input('Maillage carré (Saisir 1) ou maillage fourni (Saisir 2) ? ');

if(k == 1)
    n = input('Saisir n : ');
    [coordinates, elements3, elements4, dirichlet, neumann] = maillage_carre(n);
    A = raideur_triangle(coordinates, elements3);
    b = b_elements3(coordinates, elements3, dirichlet, A);
    u = zeros(n^2, 1);
    pointsLibres = setdiff(1:n^2, unique(dirichlet));
    u(pointsLibres) =  A(pointsLibres, pointsLibres) \ b(pointsLibres);
    show(elements3, elements4, coordinates, u);
else
    coordinates = load('coordinates.dat');
    elements3 = load('elements3.dat');
    elements4 = load('elements4.dat');
    dirichlet = load('dirichlet.dat');
    neumann = load('neumann.dat');
    [n,~] = size(coordinates);
    A = raideur_quadrangle(coordinates, elements3, elements4);
    b = b_elements4(coordinates, elements3, elements4, dirichlet, neumann, A);
    u = zeros(n, 1);
    pointsLibres = setdiff(1:n, unique(dirichlet));
    u(pointsLibres) =  A(pointsLibres, pointsLibres) \ b(pointsLibres);
    show(elements3, elements4, coordinates, u);
end