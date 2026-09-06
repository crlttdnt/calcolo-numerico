%%
addpath('../lib/');

%% lib test
clc; clear; format long;

A = ones(3);
b = ones(3, 1);
x0 = zeros(3, 1);
toll = 1e-3;
nitmax = 100;

[x, nit] = jacobi(A, b, x0, toll, nitmax);
[x, nit] = gs(A, b, x0, toll, nitmax);

%% 1)
clc; clear; format long;

toll = 1e-10;
nitmax = 100000;

x0 = zeros(3, 1);

A1 = [3 0 4;
    7 4 2;
    1 1 2];
b1 = A1 * ones(3, 1);

jacobi(A1, b1, x0, toll, nitmax);
gs(A1, b1, x0, toll, nitmax);

A2 = [-3 3 -6;
    -4 7 -8;
    5 7 -9];
b2 = A2 * ones(3, 1);

jacobi(A2, b2, x0, toll, nitmax);
gs(A2, b2, x0, toll, nitmax);

A3 = [4 1 1;
    2 -9 0;
    0 -8 -6];
b3 = A3 * ones(3, 1);

[x, nit] = jacobi(A3, b3, x0, toll, nitmax);
[x, nit] = gs(A3, b3, x0, toll, nitmax); % Faster


A4 = [7 6 9;
    4 5 -4;
    -7 -3 8];
b4 = A4 * ones(3, 1);

[x, nit] = jacobi(A4, b4, x0, toll, nitmax); % Faster
[x, nit] = gs(A4, b4, x0, toll, nitmax);

%% 2)
clc; clear; format long;

toll = 1e-6;
nitmax = 200;
x0 = zeros(3, 1);
b = [1 0 -1]';

A1 = [-22 8 13;
    5 7 -1;
    -4.5 2 -9];

A2 = [1 0.5 0.5;
    -1 3 -0.3;
    0 -0.3 0.4];

A3 = [1 0 -1;
    -1 3 -0.1;
    0.5 0.5 1];

A4 = [1 -3 2.5;
    4 -7 2;
    -8 11 5];

% Verifico la convergenza usando rho(B) < 1
A = A4;
 
% A = D - E - F;
D = diag(diag(A));
E = -tril(A, -1); 
F = -triu(A, 1);
assert(matcmp(A, D - E - F));

% B = D^-1*(E-F) = D\(E+F)
Bj = D \ (E + F);
rho = max(abs(eig(Bj)))

if rho < 1
    expected = A \ b;
    actual = jacobi(A, b, x0, toll, nitmax);
    matcmp(expected, actual, 1e-6)
end

%% 3)
clc; clear; format long;

toll = 1e-6;
nitmax = 700;
x0 = zeros(3, 1);
b = [1 0 -1]';

A1 = [4 -1 0;
    -1 4 -1;
    0 -1 4];

A2 = [-5 4 1;
    4 -6 -2;
    1 -2 -8];

A3 = [1 1/2 1/3;
    1/2 1/3 1/4;
    1/3 1/4 1/5];

A4 = [4 0 7;
    1 5 0;
    -4 5 8];

% Verifico la convergenza usando rho(B) < 1
A = A3;

% A = D - E - F;
D = diag(diag(A));
E = -tril(A, -1); 
F = -triu(A, 1);
assert(matcmp(A, D - E - F));

% B = (D-E)^-1-F
Bgs = (D - E) \ F;
rho = max(abs(eig(Bgs)))

if rho < 1
    expected = A \ b
    actual = gs(A, b, x0, toll, nitmax)
    matcmp(expected, actual, toll)
end


%% 4)
clc; clear; format short;

N = 15;
A = diag(1:N) + diag((1:N-3).^2, 3) - 0.5 * diag(ones(N-1, 1), -1);
b = ones(N, 1);

x0 = zeros(N, 1);
toll = 1e-6;
nitmax = 200;

expected = A \ b

xj = jacobi(A, b, x0, toll, nitmax)
xgs = gs(A, b, x0, toll, nitmax)

norm(expected-xj, 2)
norm(expected-xgs, 2)

%% 5)
clc; clear; format short;

N = 4:50;

nitj = zeros(size(N));
nitgs = zeros(size(N));
errj = zeros(size(N));
errgs = zeros(size(N));

for k = 1:length(N)
    n = N(k);

    A = 3*diag(ones(n,1)) - 2*diag(ones(n-1,1),1) - diag(ones(n-1,1),-1);

    xexpected = ones(n,1);
    b = A * xexpected;

    x0 = zeros(n,1);
    toll = 1e-12;
    nitmax = 10000;

    [xj, nitj(k)] = jacobi(A, b, x0, toll, nitmax);
    [xgs, nitgs(k)] = gs(A, b, x0, toll, nitmax);

    errj(k) = norm(xj - xexpected, 2) / norm(xexpected, 2);
    errgs(k) = norm(xgs - xexpected, 2) / norm(xexpected, 2);
end

% Iterazioni
figure;
plot(N, nitj, '-o', N, nitgs, '-s');
grid on;
xlabel('n');
ylabel('Numero iterazioni');
legend('Jacobi', 'Gauss-Seidel', 'Location', 'best');
title('Confronto numero di iterazioni');

% Errori relativi
figure;
semilogy(N, errj, '-o', N, errgs, '-s');
grid on;
xlabel('n');
ylabel('Errore relativo');
legend('Jacobi', 'Gauss-Seidel', 'Location', 'best');
title('Confronto errore relativo');