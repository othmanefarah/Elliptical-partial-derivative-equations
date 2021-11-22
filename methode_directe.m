close;
clear all;
nzA = zeros(30, 1);
nzR = zeros(30, 1);
pnzA = zeros(30, 1);
pnzR = zeros(30, 1);
for n = 1:30
  [coordinates, elements3, elements4, dirichlet, neumann] = maillage_carre(n);
  A = raideur_quadrangle(coordinates, elements3, elements4);
  [R, flag] = chol(A);
  nzA(n) = length(nonzeros(A));
  pnzA(n) = nzA(n)/n^4;
  nzR(n) = length(nonzeros(R));
  pnzR(n) = nzR(n)/n^4;
end

figure(1)
plot(1:30, nzR, 'b')
hold on;
plot(1:30, nzA, 'r')
legend('R', 'A')
xlabel('taille de la maille n')
title("Evolution du nombre d'éléments non nuls")


figure(2)
plot(1:30, pnzR, 'b')
hold on;
plot(1:30, pnzA, 'r')
legend('R', 'A')
xlabel('taille de la maille n')
ylabel("% d'éléments non nuls")
title("Pourcentage d'éléments non nuls")