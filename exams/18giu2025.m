% CORTI FILIPPO 77044A
addpath('..\labs\lib')

%% 1)
clc; clear; format short e;

f = @(x) (cos(pi*x)) ./ (x.^2 .* (1 + log(x)));
x = linspace(2, 4, 6);
y = f(x);

% 1:
s1 = griddedInterpolant(x, y,'linear');
res1 = s1(2.5)

% 2:
p = polyfit(x, y, length(x)-1);
allroots = roots(p);
realroots = allroots(imag(allroots) == 0);
res2 = realroots(realroots >= 2 & realroots <= 4)

% 3:
toll = 1e-6;
res3 = bisezione(f, 2, 3, toll)

%% 2)
clc; clear; 
format short e;
f = @(t, y) -3*y + t;
t0 = 0;
tmax = 10;
y0 = 0;

y = @(t) 1/9 .* (exp(-3*t) - 1) + 1/3.*t;

% 1-2:
H = [0.1 0.01 0.001 0.0001];
errs = zeros(1, length(H));
for i=1:length(H)
    h = H(i);
    T = t0:h:tmax;
    [T, Y] = heun(f, T, y0);
    errs(i) = norm(y(T) - Y, inf) / norm(y(T), inf);
end

[H' errs']

% 3:
% L'ordine del metodo di Heun è dato da p t.c. err(h) = C*H^p
% errs = C*H^p -> log(errs) = log(C) + p*log(H)
poly = polyfit(log(H), log(errs), 1);
order = poly(1)

% 4:
format long;
h = 0.0001;
T = t0:h:tmax;
[T, Y] = heun(f, T, y0);
IT = trapz(T, Y)
