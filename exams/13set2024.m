% CORTI FILIPPO 77044A
addpath('..\labs\lib')

%% 1)
clc; clear; format short e;
hold on;

%1:
a = 2;
b = 3;
f = @(x) -log(x) .* cos(x) - 0.5;

zs = linspace(a, b, 100);
plot(zs, f(zs))

%2:
alpha = fzero(f, [a b])

x0 = 2;
toll = 1e-5;
nitmax = 100;
df = @(x) - ((1./x) .* cos(x) + log(x) .* -sin(x));  
alphaN = newton(f, df, x0, toll, nitmax)

err = abs(alphaN - alpha)

%3:
N = 5;
x = linspace(a, b, N);
y = f(x);

p = polyfit(x, y, N-1);
pxm = polyval(p, (a+b)/2)

z = linspace(a, b, 100);
err2 = max(abs(f(z) - polyval(p, z)))

%4:
r = polyfit(x, y, 1);
rxm = polyval(r, (a+b)/2)
err3 = max(abs(f(z) - polyval(r, z)))

%% 2)
clc; clear; format short e;

f = @(t, y) y.*sin(t) + sin(2*t);
t0 = 0;
tmax = 1;
y0 = -2;

sol = @(t) 2 - 2*cos(t) - 2*exp(1 - cos(t));

%1:
h = 0.05;
T = t0:h:tmax;
[T, Y] = heun(f, T, y0);
YN = Y(end)

%2:
plot(T, sol(T), T, Y)
legend('Exact','Heun');

%3:
errinf = norm(sol(T)-Y, inf)

%4:
s1 = griddedInterpolant(T, Y, 'linear');
s1t = s1(1/3)

%5:
It = trapz(T, Y)
I = integral(sol, 0, 1)

err = abs(I-It)
