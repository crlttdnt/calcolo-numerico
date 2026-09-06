%%
addpath('..\lib')
%%
clc; clear;

N = 10;
x = 1:N;
y = [1.3 3.5 4.2 5.0 7.0 8.8 10.1 12.5 13 15.6];
ks = 1:0.01:10;

% polinomio di grado N-1
p = polyfit(x, y, length(x) - 1);

% polinomio di grado 1 ==> Retta di Regressione
r = polyfit(x, y, 1)

plot(x, y, '*g', ks, polyval(p, ks), '-r', ks, polyval(r, ks), '-b');

%% 1)
clc; clear;

x = 0:10;
y = [0 1.25 2.27 3.04 3.77 4.71 5.91 7.19 8.29 9.12 9.83];
ks = -1:0.01:11;

r = polyfit(x, y, 1);

plot(x, y, 'or', ks, polyval(r, ks), 'k')


%% 2)
clc; clear;

x = [-5 -2 0.5 1 1.5 3 6];
y = [1.5 2 -1 2.5 1 -2 3];
ks = -6:0.01:6;

r = polyfit(x, y, 1)

plot(x, y, '*b', ks, polyval(r, ks), '-r', mean(x), mean(y), 'og')

%% 3)
clc; clear;

f = @(t) 2*exp(-2*t) - t;
x = linspace(0, 1, 10);
y = f(x);

% i)
r = polyfit(x, y, 1)

% ii)
M = [x' ones(10, 1)];
Mt = M';
A = Mt * M;
b = Mt * y';

z = A \ b

%% 4)
clc; clear;

f = @(x) 5 * cos(pi * x.^2) - exp(x);
x = linspace(0, 1, 5);
y = f(x);
ks = linspace(0, 1, 100);

% 1:
r = polyfit(x, y, 1);
xmean = mean(x);
polyval(r, xmean)
ymean = mean(y)
assert(abs(polyval(r, xmean) - mean(y)) < 1e-12);

% 2:
p = polyfit(x, y, length(x) - 1);
zs = roots(p)
zs = zs(imag(zs) == 0 & zs >= 0 & zs <= 1)

% plot
plot(x, y, 'or', xmean, ymean, '*r', ks, polyval(r, ks), 'g', ks, polyval(p, ks), 'b')
grid on


%% 5)
clc; clear;
hold on;

x = [-3 -2 0 2 4];
y = [3 2 0.5 1 3];
ks = -4:0.01:5;

M = 0:4;
for m=M
    pm = polyfit(x, y, m);
    plot(ks, polyval(pm, ks), '-');
end
plot(x, y, 'or');
plot(mean(x), mean(y), '*r');
grid on

%% 6)
clc; clear;
hold on;

x = -55:10:55;
y = [3.22, 3.3, 3.32, 3.17, 3.07, 3.02, 3.02, 3.12, 3.2, 3.35, 3.37, 3.25];
ks = -55:0.01:55;

M = [1 2 4 11];
for m=M
   pm = polyfit(x, y, m);
   plot(ks, polyval(pm, ks))
end
plot(x, y, 'or', 'MarkerFaceColor','r')
legend('deg 1','deg 2','deg 4','deg 11','data')
grid on

%% 7)
clc; clear;

x = 1:5;
y = [4.9 8 12.3 23.1 36.5];
ks = 1:0.01:5;

% I want to find C and A such that y = C*e^(Ax)
% Idea:
% log(y) = log(C*e^(Ax)); log(y) = log(C) + Ax;
% that is: logy = Ax + logC

p = polyfit(x, log(y), 1);
A = p(1); 
logC = p(2);
C = exp(logC);

A, C

f = @(x) C*exp(A*x);
v = f(2.5)
plot(x, y, 'or', ks, f(ks), '-b');


%% 8)
clc; clear;

x = 1:5;
y = [0.6 1.9 4.3 7.6 12.6];
ks = 1:0.01:5;

% I want to find C and A such that y = C*x^A
% Idea:
% log(y) = log(C*x^A); log(y) = log(C) + A*log(x)
% that is: logy = A*logx + logC

p = polyfit(log(x), log(y), 1);
A = p(1);
logC = p(2);
C = exp(logC);

A, C

f = @(x) C * x.^A;
v = f(2.5)
plot(x, y, 'or', ks, f(ks), '-b')

%% 9)
clc; clear;

f = @(x) cos(10*x) .* exp(sin(10*x));
a = -10;
b = 10;

i = 1/10 * (exp(sin(100)) - exp(-sin(100)))
q = integral(f, a, b)

% Condition 1: |q - i| < 1e-10
abs(q-i)

% Condition 2: |q - i| / |i| < 1e-6
abs(q-i) / abs(i)



