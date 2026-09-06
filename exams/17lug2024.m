% CORTI FILIPPO 77044A
addpath('..\labs\lib')

%% 1)
clc; clear; format short e;

f = @(x) (exp(cos(x))) ./ (x.^2 + 1);
a = 0;
b = 1;

%1:
x = linspace(a, b, 10);
y = f(x);
p = polyfit(x, y, 9);

xm = (a+b)/2;
pxm = polyval(p, xm)

z = linspace(a,b, 100);
maxerr = max(abs(f(z) - polyval(p, z)))

%2:
s1 = griddedInterpolant(x, y, 'linear');
s1xm = s1(xm)

maxerr = max(abs(f(z) - s1(z)))

%3:
%a)
I = integral(f, a, b)

%b)
Tnodes = linspace(a, b, 3);
IT = trapz(Tnodes, f(Tnodes))

%c)
ICS = simpsc(a, b, 2, f)

%d)
errT = abs(I - IT)
errCS = abs(I - ICS)

%% 2)
clc; clear; format short e;

f = @(t, y) (y+1)./t + 1;
t0 = 1;
tmax = 2;
y0 = -1;

y = @(t) t.*log(t) - 1;

%1:
h = 0.01;
toll = 1e-6;
nitmax = 100;
dfy = @(t, y) 1./t;

T = t0:h:tmax;
[T, Y] = eulimp(f, T, y0, dfy, toll, nitmax);
YN = Y(end)

%2:
plot(T, y(T), T, Y);
legend('Exact', 'EulImp')

%3:
infnorm = norm(y(T) - Y, inf)

%4:
t0 = 1;
toll = 1e-6;
nitmax = 100;
dy = @(t) 1.*log(t) + t.*(1./t);
alphaN = newton(y, dy, t0, toll, nitmax)

alpha = fzero(y, [t0 tmax])
