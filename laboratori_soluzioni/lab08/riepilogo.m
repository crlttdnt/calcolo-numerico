%%
addpath('..\lib');

%% 1)
clc; clear;

q = [1 3 5 9 12 15];
z = [10.7 30.9 41.8 80.9 100.5 129.5];

polyfit(q, z, 1)

%% 2)
clc; clear;

T = 0:10:70;
C = [96.4 46.3 21.2 17.89 10.1 6.9 3.5 1.9];

% 1:
r = polyfit(T, C, 1);
s1 = griddedInterpolant(T, C, 'linear');
p = polyfit(T, C, 7);

z = 0:0.2:70;
plot(z, polyval(r, z), '-r', z, s1(z), '-g', z, polyval(p, z), '-b', T, C, 'ok')

% 2:
t = 62;
r62 = polyval(r, t)
s62 = s1(t)
p62 = polyval(p, t)

% 3:
sr = sum(abs(C - polyval(r, T)).^2)

sp = sum(abs(C - polyval(p, T)).^2) 
% sp should be zero as p is literally the polynomial passing through those points

%% 3)
clc; clear;

f = @(t) 2/3 * log(2/3 * t);
a = 3*exp(1) / 2;
b = a + 1;

x = linspace(a, b, 10);
y = f(x);

% 1:
r = polyfit(x, y, 1)

% 2:
rxbar = polyval(r, mean(x))

% 3:
M = [x' ones(10, 1)];
Mt = M';
A = Mt * M;
b = Mt * y';
z = A \ b


%% 4)
clc; clear;

x = 1:0.15:2.5;
y = [0.1 0.15 0.2 0.3 0.5 0.65 0.78 1 1.2 1.35 1.45];

parabola = polyfit(x, y, 2)
polyval(parabola, 1.75)

% y = C*x^A
% logy = logC + A*logx

p = polyfit(log(x), log(y), 1);
A = p(1)
C = exp(p(2))

C * (1.75)^A


%% 5)
clc; clear;

x = 1:5;
y = [0.35 0.25 0.2 0.15 0.12];
xs = 1:0.01:5;

% y = 1/(Ax+B)
% 1/y = Ax+B

p = polyfit(x, 1./y, 1);
A = p(1)
B = p(2)

f = @(x) 1./(A*x+B);

f(1.5)
plot(x, y, 'or', xs, f(xs), '-g')

%% 6)
clc; clear;

x = 1:5;
y = [0.25 0.31 0.35 0.4 0.41];
xs = 1:0.01:5;

% y = x/(A+Bx)
% 1/y = A*1/x+B

p = polyfit(1./x, 1./y, 1);
A = p(1)
B = p(2)

f = @(x) x ./ (A + B*x);

f(4.5)
plot(x, y, 'or', xs, f(xs), '-g')

