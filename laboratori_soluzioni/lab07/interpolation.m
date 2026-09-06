%%
addpath('..\lib')

%% 1)
clc; clear;

x = [-2 1 2 7];
y = [-4 -1 0.5 3];

p = polyfit(x, y, length(x) - 1);

plot(x, y, 'or', -3:0.01:10, polyval(p, -3:0.01:10), '-b')

%%
clc; clear;

x = [-5 -3 -1 1 3 5];
y = [0.1 -0.5 0.5 1.1 0.9 -2];

p = polyfit(x, y, length(x) - 1);

xs = -6:0.01:6;
plot(x, y, 'or', xs, polyval(p, xs), '-b')

%% 2)
clc; clear;

f = @(x) exp(x) .* sin(x);

n = 16;

x = linspace(-1, 1, n + 1);
y = f(x)
p = polyfit(x, y, n);

xs = -2:0.01:2;
plot(x, y, 'or', xs, polyval(p, xs), '-b', xs, f(xs), '-g')
legend('samples', 'interpolation', 'actual')

%% 3)
clc; clear;

a = 1;
b = 4;
f = @(x) ((x.^2 - 5*x + 6) .* log(x)) ./ x;

n = 5;

x = linspace(a, b, n + 1);
y = f(x);
p = polyfit(x, y, n);

xs = linspace(a, b, 1000);
pxs = polyval(p, xs);
fxs = f(xs);
plot(x, y, 'or', xs, pxs, '-b', xs, fxs, '-g')
legend('samples', 'interpolation', 'actual')

maxerr = max(abs(fxs - pxs))

%%
clc; clear;

a = -5;
b = 5;
f = @(x) 1 ./ (1 + x.^2);

n = 4;

x = linspace(a, b, n + 1);
y = f(x);
p = polyfit(x, y, n);

xs = linspace(a, b, 1000);
pxs = polyval(p, xs);
fxs = f(xs);
plot(x, y, 'or', xs, pxs, '-b', xs, fxs, '-g')
legend('samples', 'interpolation', 'actual')

maxerr = max(abs(fxs - pxs))

%% 4)
clc; clear;

a = -1;
b = 1;
n = 10;

k = 1:n;
ck = cos(pi*(2*k - 1) / (2*n));

xk = (b-a) / 2 * ck + (a+b) / 2;
plot(xk, zeros(n), 'or')
grid on
title(sprintf('Chebyshev %d nodes', n))

%% 5)
clc; clear;

a = -5;
b = 5;
n = 16; % Now larger values correspond to a smaller error
f = @(x) 1 ./ (1 + x.^2);


k = 1:n+1;
ck = cos(pi*(2*k - 1) / (2*(n+1))); % Use cheby nodes now
x = (b-a) / 2 * ck + (a+b) / 2;
y = f(x);
p = polyfit(x, y, n);

xs = linspace(a, b, 1000);
pxs = polyval(p, xs);
fxs = f(xs);
plot(x, y, 'or', xs, pxs, '-b', xs, fxs, '-g')
legend('samples', 'interpolation', 'actual')

maxerr = max(abs(fxs - pxs))

%%

x = [-1 1 2 3 5];
y = [0 -1 5 2 1];

s1 = griddedInterpolant(x, y, 'linear');
z = 0;
plot(x, y, 'ro', x, y, 'b', z, s1(z), '*g')

%% 6)
clc; clear;

f = @(x) (1 ./ (1+x.^2));

a = -5;
b = 5;

mvals = [5, 50, 500];
errs = zeros(size(mvals));

for i = 1:length(mvals)
    figure(i)
    m = mvals(i);
    H = 10/m;

    sp = linspace(a, b, m+1);
    fsp = f(sp);
    s1 = griddedInterpolant(sp, fsp, 'linear');

    xs = linspace(a, b, 10000);
    fxs = f(xs);
    s1xs = s1(xs);

    plot(xs, fxs, '-g', xs, s1xs, '-b', sp, fsp, 'ro')
    hold on
    legend('f(x)', 'linear spline', 'spline points')
    title(sprintf('m = %d', m))
    grid on

    errs(i) = max(abs(fxs - s1xs));
end

table(mvals', 10./mvals', errs', 10./mvals'.^2, 'VariableNames', {'m','H','Error', 'H^2'})

%% 7)
clc; clear;

f = @(x) (exp(x) .* cos(4*x));

a = 0;
b = pi;

mvals = [5, 50, 500];
errs = zeros(size(mvals));

for i = 1:length(mvals)
    figure(i)
    m = mvals(i);
    H = 10/m;

    sp = linspace(a, b, m+1);
    fsp = f(sp);
    s1 = griddedInterpolant(sp, fsp, 'linear');

    xs = linspace(a, b, 10000);
    fxs = f(xs);
    s1xs = s1(xs);

    plot(xs, fxs, '-g', xs, s1xs, '-b', sp, fsp, 'ro')
    hold on
    legend('f(x)', 'linear spline', 'spline points')
    title(sprintf('m = %d', m))
    grid on

    errs(i) = max(abs(fxs - s1xs));
end

table(mvals', 10./mvals', errs', 10./mvals'.^2, 'VariableNames', {'m','H','Error', 'H^2'})

%% 
clc; clear;

f = @(x) (sqrt(abs(x)));

a = -1;
b = 1;

mvals = [5, 50, 500];
errs = zeros(size(mvals));

for i = 1:length(mvals)
    figure(i)
    m = mvals(i);
    H = 10/m;

    sp = linspace(a, b, m+1);
    fsp = f(sp);
    s1 = griddedInterpolant(sp, fsp, 'linear');

    xs = linspace(a, b, 10000);
    fxs = f(xs);
    s1xs = s1(xs);

    plot(xs, fxs, '-g', xs, s1xs, '-b', sp, fsp, 'ro')
    hold on
    legend('f(x)', 'linear spline', 'spline points')
    title(sprintf('m = %d', m))
    grid on

    errs(i) = max(abs(fxs - s1xs));
end

table(mvals', 10./mvals', errs', 10./mvals'.^2, 'VariableNames', {'m','H','Error', 'H^2'})




