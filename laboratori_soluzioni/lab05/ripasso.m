%% 
addpath('../lib/')

%% 1)
clc; clear; format short;
n = 100;

An = 2*eye(n) - diag(ones(1,n-1), -1) - diag(ones(1,n-1), 1);
bn = ones(n, 1);

x0 = zeros(n, 1);
toll = 1e-6;
nitmax = 100000;

x = An \ bn;

[xj, nitj] = jacobi(An, bn, x0, toll, nitmax);
errj = norm(xj - x, 2) / norm(x, 2);
nitj, errj

[xgs, nitgs] = gs(An, bn, x0, toll, nitmax);
errgs = norm(xgs - x, 2) / norm(x, 2);
nitgs, errgs

%% 2)
clc; clear; format short e;

x = linspace(0, pi/2, 9);

% 1:
A = 11 * eye(10) - diag(ones(9, 1), -1) + diag(x, 1);
b = ones(10, 1);

% 2:
D = diag(diag(A));
E = -tril(A, -1);
F = -triu(A, 1);

Bj = D \ (E + F);
rho = max(abs(eig(Bj)))

% 3:
x0 = zeros(10, 1);
toll = 1e-5;
nitmax = 200;

[xj, nitj] = jacobi(A, b, x0, toll, nitmax);
nitj

% 4:
xe = A \ b;
norm(xe - xj, 2)

%% 3)
clc; clear; format short e;

N = 16;
A = diag(20:20+N-1) - 5 * diag(ones(1, N-1), -1) + 5 * diag(ones(1, N-2), 2);
b = ones(N, 1);

% 1:
det(A)

% 2:
D = diag(diag(A));
E = -tril(A, -1);
F = -triu(A, 1);

Bgs = (D - E) \ F;
rho = max(abs(eig(Bgs)));

% 3:
x0 = zeros(N, 1);
toll = 1e-6;,
nitmax = 200;

xe = A \ b;
[xgs, nitgs] = gs(A, b, x0, toll, nitmax);
nitgs
norm(xe - xgs, 2) / norm(xe, 2)
