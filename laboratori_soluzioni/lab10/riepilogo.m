%%
addpath('..\lib')

%% 1)
clc; clear; format long;

f = @(x) x - (1 ./ (sin(x) + 2));
a = 0;
b = 5;

zs = linspace(a, b, 1000);
plot(zs, f(zs), [a b], [0 0])

% 1.
z = fzero(f, [a b])
hold on
plot(z, f(z), 'or')

% 2.
toll = 1e-8;
[zb, nitb] = bisezione(f, a, b, toll)

% 3.
x0 = 2;
nitmax = 200;
df = @(x) 1 + 1 ./ (sin(x) + 2).^2 .* (cos(x));
[zn, nitn] = newton(f, df, x0, toll, nitmax)

% 4.
abs(z - zb)
abs(z - zn)

%% 2)
clc; clear; format long;

f = @(x) 2*x.^2 - 1 ./ (cos(x.^2) + 3);
a = 0;
b = 5;

zs = linspace(a, b, 1000);
plot(zs, f(zs), [a b], [0 0])

% 1.
z = fzero(f, [a, b])
hold on
plot(z, f(z), 'or')

% 2.
tollb = 1e-2;
[x0, nitb] = bisezione(f, a, b, tollb)

tolln = 1e-6;
nitmax = 200;
df = @(x) 4*x + (1 ./ (cos(x.^2) + 3).^2 .* - 2.*x.*sin(x.^2));

[zn, nitn] = newton(f, df, x0, tolln, nitmax)

% 3.
abs(z - zn)

%% 3)
clc; clear; format short e;

f = @(t, y) (cos(2*pi*t) - 4*t.^2) .* y;
tspan = [0 5];
y0 = 4;

sol = @(t) 4 * exp((1/(2*pi))*sin(2*pi*t) - (4/3)*t.^3);

[T, Y] = ode45(f, tspan, y0);
Ymax = max(Y)

err = norm(Y-sol(T),inf) / norm(sol(T),inf)

It = trapz(T, Y)

Ie = integral(sol, 0, 5);
errI = abs(It - Ie) / abs(Ie)


