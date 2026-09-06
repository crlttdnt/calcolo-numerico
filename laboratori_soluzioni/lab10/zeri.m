%%
addpath('..\lib')

%% 1)
clc; clear;

f = @(x) exp(x) - x.^2 - sin(x) - 1;
a = -2;
b = 2;
toll = 1e-8;

x = linspace(a, b, 1000);
y = f(x);
zs = zeros(1,1000);
plot(x, y, x, zs)

% Vedo 2 zeri: uno intorno a 0, l'altro intorno a 1.3
% il metodo di bisezione se eseguito troverà uno di questi zeri

[x1, nit1] = bisezione(f, a, b, toll)

% Come trovo il secondo?
% Dovrei accorciare l'intervallo:

[x2, nit2] = bisezione(f, x1+toll, b, toll)

%% 2a)
clc; clear;
f = @(x) exp(-x) - sin(x);
a = -1;
b = 5;
toll = 1e-5;

f(a);
f(b);

% entrambi sono > 0 --> non posso applicarlo
% provo a plottare
zs = linspace(a, b, 1000);
ys = f(zs);
plot(zs, ys, [a b], [0 0])

% sono evidenti 2 zeri, posso dividere:
c = 2;

[zero1, nit1] = bisezione(f, a, c, toll)
[zero2, nit2] = bisezione(f, c, b, toll)

%% 2b)
clc; clear;
f = @(x) (5*x.^3 - 8*x.^2 + x + 2) .* sin(x);
a = -1;
b = 2;
toll = 1e-5;

zs = linspace(a, b, 1000);
ys = f(zs);
plot(zs, ys, [a b], [0 0])

% ci sono 3 zeri, due posso calcolarli facilmente
c = -0.3;

[zero1, nit1] = bisezione(f, a, c, toll)
[zero2, nit2] = bisezione(f, c, b, toll)

% il terzo zero è problematico perchè è un punto di minimo: non esistono
% due valori a e b t.c. f(a)*f(b) < 0 e a < zero3 < b


%% 3)
clc; clear;

f = @(x) x.^2 - 7;
df = @(x) 2*x;

zs = linspace(-5, 5, 1000);
plot(zs, f(zs), [-5 5], [0 0])

[z, nit] = newton(f, df, 10, 1e-12, 200)

%% 4a)
clc; clear;

f = @(x) exp(-x) .* sin(x);
df = @(x) -exp(-x) .* sin(x) + exp(-x) .* cos(x);
a = -1;
b = 5;
toll = 1e-6;
nitmax = 100;

zs = linspace(a, b, 1000);
plot(zs, f(zs), [a b], [0 0])

[zero1, nit1] = newton(f, df, 0.5, toll, nitmax)
[zero2, nit2] = newton(f, df, 2, toll, nitmax)

%% 4b)
clc; clear;

f = @(x) (x-1).^2 .* (x+2/5);
df = @(x) 2*(x-1) .* (x+2/5) + (x-1).^2;
a = -1;
b = 2;
toll = 1e-6;
nitmax = 100;

zs = linspace(a, b, 1000);
plot(zs, f(zs), [a b], [0 0])

[zero1, nit1] = newton(f, df, a, toll, nitmax)
[zero2, nit2] = newton(f, df, b, toll, nitmax)


%% 5)
clc; clear;

f = @(x) atan(x);
toll = 1e-12;

% bisezione
a = -15;
b = 20;

zs = a:0.01:b;
plot(zs, f(zs), [a b], [0 0])

[zb, nitb] = bisezione(f, a, b, toll)

% newton
x0 = 20;

df = @(x) 1 ./ (1+x.^2);

[zn, nitn] = newton(f, df, x0, toll, 200)
% newton fallisce -> restituisce NaN -> l'instabilità è perché sono partito
% troppo lontano dalla radice

% combinati:
[zb, nitb] = bisezione(f, a, b, 0.001);
[zn, nitn] = newton(f, df, zb, toll, 200)
% solo 2 iterazioni!



