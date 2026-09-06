%%
addpath('..\lib');

%% 1)
clc; clear; format short e;

f = @(x) (2 * sin(x) .* cos(x)) ./ (1 + x.^2);
a = 0;
b = 2;

n = 10;
xi = linspace(0, 2, 10);
fxi = f(xi);

% 1:
p = polyfit(xi, fxi, n-1);

zk = linspace(a, b, 100);
fzk = f(zk);
pzk = polyval(p, zk);

err = norm(fzk - pzk, inf)

% 2:
pp = polyder(p);
ppzk = polyval(pp, zk);

plot(zk, fzk, '-r', ...
    zk, pzk, '-g', ...
    zk, ppzk, '-b');
legend('f', 'p', "p'")
grid on
hold on

xcrit = roots(pp); % punti notevoli di p
xcrit = xcrit(xcrit >= 0 & xcrit <= 2 & imag(xcrit) == 0); % solo punti in [0,2], solo radici reali
xall = [[0] xcrit [2]]; % controllare che il max non sia agli estremi
yall = polyval(p, xall);

[ymax, idx] = max(yall);
xmax = xall(idx)

plot(xmax, ymax, 'ok')

% 3:
s1 = griddedInterpolant(xi, fxi, 'linear');
s1zk = s1(zk);

err2 = norm(fzk - s1zk, inf)

%% 2)
clc; clear; format short e;

g = @(x) (x.^2) ./ (1 + x.^2);

a = -4;
b = 4;

% 1:
n = 10;
xnodes = linspace(a, b, n+1);
ynodes = g(xnodes);
p = polyfit(xnodes, ynodes, n);

z = linspace(a, b, 100);
gz = g(z);
pz = polyval(p, z);

figure(1)
plot(z, gz, 'g', z, pz, 'b', xnodes, ynodes, 'or')
legend('function', 'polyfit', 'nodes')

err = norm(gz - pz, inf)

% 2:
k = 1:n+1;

xcnodes = cos((pi*(2*k-1))./(2*(n+1)));
xcnodes = (b-a) / 2 * xcnodes + (a+b) / 2;
ycnodes = g(xcnodes);
p2 = polyfit(xcnodes, ycnodes, n);
p2z = polyval(p2, z);

figure(2)
plot(z, gz, 'g', z, p2z, 'b', xcnodes, ycnodes, 'or')
legend('function', 'polyfit', 'cheby nodes')

err_cheby = norm(gz - p2z, inf)


%% 3)
clc; clear; format short e;

f = @(x) sin(x + exp(x)) - 7/12;

a = 0;
b = 1;
xmax = 4/15;
ymax = f(xmax);

% 1:
x = linspace(a, b, 100);
y = f(x);
plot(x, y, 'g', xmax, ymax, 'or')

% 2:
h = 0.1;
z = a:h:b;
fz = f(z);

s = griddedInterpolant(z, fz, 'linear');
symax = s(xmax)
err = abs(ymax - symax)

h = 0.01;
z = a:h:b;
fz = f(z);

s = griddedInterpolant(z, fz, 'linear');
symax = s(xmax)
err = abs(ymax - symax)



