% CORTI FILIPPO 77044A
addpath('..\labs\lib')

%% 1)
clc; clear; format short e;

f = @(x) cos(2*x) + 3*x - 2;
a = 0;
b = 2;

% 1:
alpha = fzero(f, [a b])

% 2:
z = linspace(a, b, 6);
r = polyfit(z, f(z), 1);

ralpha = polyval(r, alpha)
S = sum((f(z) - polyval(r, z)).^2)

% 3:
p = polyfit(z, f(z), 5);
palpha = polyval(p, alpha)

x = linspace(a, b, 100);
err = max(abs(f(x) - polyval(p, x)))

% 
plot(x, f(x), x, polyval(r, x), x, polyval(p, x))
legend('exact', 'regression line', 'polyfit')

%% 2)
clc; clear; format short e;

f = @(t, y) 2*y*(t - 5);
t0 = 0;
tmax = 1;
y0 = 1;

y = @(t) exp(t.^2 - 10*t);

% 1:
h = 0.001;
T = t0:h:tmax;
[T, Y] = eulero(f, T, y0);
YN = Y(end)

% 2:
norm(y(T) - Y, inf)

% 3:
I = integral(y, 0, 1)
IT = trapz(T, Y)
err = abs(IT - I)
