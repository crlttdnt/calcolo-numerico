% CORTI FILIPPO 77044A
addpath('..\labs\lib')

%% 1)
clc; clear; format short e;

%1:
N = 20;
A = 10*diag(N:-1:1) - 2*diag(ones(N-3, 1), 3) - 2*diag(ones(N-3, 1), -3)
b = ones(N, 1)

%2:
lamdamin = min(eig(A))
detA = det(A)

%3:
[L, U, P] = lu(A);
Lnorm = norm(L, inf)

%4:
% PA = LU
% LUx = Pb; Ly = Pb; Ux = y
y = L \ (P*b);
x = U \ y;

ynorm = norm(y, inf)
xnorm = norm(x, inf)

%5:
x0 = zeros(N, 1);
toll = 1e-6;
maxit = 100;

xj = jacobi(A, b, x0, toll, maxit);
diffnorm = norm(xj - x, inf)

%% 2)
clc; clear; format short e;

f = @(t, y) -y + exp(-t) .* (21*t.^2+5);
t0 = 0;
tmax = 1;
y0 = -1;

sol = @(t) exp(-t) .* (7*t.^3 + 5*t - 1);

%1:
h = 0.05;
T = t0:h:tmax;
[T, Y] = heun(f, T, y0);
Y2 = Y(2)

%2:
errinf = norm(sol(T)-Y, inf)

%3:
toll = 1e-5;
alpha = bisezione(sol, 0, 1, toll)

%4:
It = trapz(T, Y)
I = integral(sol, 0, 1)

err = abs(I-It)




