% CORTI FILIPPO 77044A
addpath('..\labs\lib')

%% 1)
clc; clear; format short e;

f = @(x) sin(x) + exp(-x);
a = 0;
b = 2;

%1:
z = linspace(a, b, 1000);
plot(z, f(z))

%2:
df = @(x) cos(x) - exp(-x);
ddf = @(x) - sin(x) + exp(-x);
x0 = 1.5;
toll = 1e-6;
nitmax = 100;

xmax = newton(df, ddf, x0, toll, nitmax)
fxmax = f(xmax)

%3:
I = integral(f, 0, 2)

%4:
h = 0.1;
z = 0:h:2;
s = griddedInterpolant(z, f(z), 'linear');

sxmax = s(xmax)
err = abs(fxmax - sxmax)

It = trapz(z, f(z))
err2 = abs(I - It)


%% 2)
clc; clear; format short e;

f = @(t, y) 3*(t+1) - y;
t0 = 1;
tmax = 2;
y0 = 4;

y = @(t) 3*t + exp(1-t);

%1:
h = 0.01;
T = t0:h:tmax;
[T, Y] = heun(f, T, y0);
Y(end)

%2:
norm(y(T) - Y, inf)

%3:
x = linspace(1, 2, 10);
y = y(x);

r = polyfit(x, y, 1)
pm = polyval(r, 1.5)


