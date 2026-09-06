% CORTI FILIPPO 77044A
addpath('..\labs\lib')

%% 1)
clc; clear; format short e;

%1:
N = 20;
A = sqrt(N)*diag(ones(N, 1)) + 2*diag(ones(N-1, 1), 1) - 2*diag(ones(N-2, 1), -2) + diag(1, N-1) + diag(1, -N+1);

detA = det(A)
invA = inv(A);
cond = norm(A, inf) * norm(invA, inf)

%2:
D = diag(diag(A));
E = -tril(A, -1); 
F = -triu(A, 1);

% B = D^-1*(E-F) = D\(E+F)
Bj = D \ (E + F);
rho = max(abs(eig(Bj)))

%3:
b = ones(N, 1);
x0 = zeros(N, 1);
toll = 1e-6;
nitmax = 200;

[xj, nitj] = jacobi(A, b, x0, toll, nitmax);
nitj

xe = A \ b;
relerr = norm(xj-xe, inf) / norm(xe, inf)


%% 2)
clc; clear; format short e;

f = @(t, y) y + exp(t).*cos(t);
t0 = 0;
tmax = 1;
y0 = 0;

sol = @(t) exp(t) .* sin(t);

%1:
h = 0.01;
toll = 1e-6;
nitmax = 100;
dfy = @(t, y) 1; 

T = t0:h:tmax;
[T, Y] = eulimp(f, T, y0, dfy, toll, nitmax);

Ymax = max(Y)

%2:
plot(T, sol(T), T, Y)
legend('Exact', 'EulImp')

%3:
norm(sol(T) - Y, inf)

%4:
I = integral(sol, 0, 1)
Ip20 = pmedc(0, 1, 20, sol)
Ip40 = pmedc(0, 1, 40, sol)

rapp = abs(Ip20 - I) / abs(Ip40 - I)
