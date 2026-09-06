%%
addpath('..\lib\');
%%
clc; clear; 
x = linspace(0, pi, 100);
y = 2 * sin(x) .* cos(x) + 2 * x;

plot(x, y)

%%
clc; clear;

x = linspace(0, pi);
fx = sin(x) + x;
gx = x.^2 + cos(x);

plot(x, fx)
hold on
plot(x, gx)
% or simply plot(x, fx, ..., x, gx)

%%
clc; clear;

x = linspace(0, pi);
fx = sin(x) + x;
gx = x.^2 + cos(x);

figure(1)
plot(x, fx)
figure(2)
plot(x, gx)

%% 1)
clc; clear;

xf = linspace(1, 2, 50);
fx = 2 * log(xf+2) ./ sqrt(xf+1);

xg = linspace(0, 5, 50);
gx = (xg.^2 + 2*xg + 1) ./ (xg.^2 + 1);

plot(xf, fx, xg, gx)

%%
clc; clear;

x = [-5 -4.5 -3 -2.3 -1 0.5 1 2 3 4 5];
y = [-0.9 -0.85 -0.4 -0.2 0.4 0.3 0.7 0.6 0.8 1 1.2];
plot(x, y, '*')

%%
clc; clear;

x = 0:pi/20:2*pi;
y = sin(x);
plot(x, y, '--r');
axis([0 2*pi -1.5 1.5])

%% 2)
clc; clear;

x1 = linspace(0, 2.5);
y1 = sin(exp(x1));

x2 = linspace(-3, 1.5);
y2 = (x2.^3 - 3 * x2 + 2) .* exp(x2);

figure(1)
plot(x1, y1, 'r')
title('f1(x) = sin(e^x)')
legend('f1')
grid on

figure(2)
plot(x2, y2, 'b')
title('f2(x) = (x^3-3x+2)e^x')
legend('f2')
grid on

%% 3) the simple way
clc; clear;

x = linspace(0, 1);
for n = 0:20
    plot(x, x.^n);
    hold on
end
title('Funzioni x^n tra 0 e 1')
xlabel('x')
ylabel('x^n')

%% 3) the Matlab way
clc; clear; 

N = 0:20;

x = linspace(0, 1).';
Y = x.^N;

figure(1)
plot(x, Y)
title('Funzioni x^n tra 0 e 1')
xlabel('x')
ylabel('x^n')

Y2 = x.^(1./N);

figure(2)
plot(x, Y2)
title('Funzioni x^{1/n} tra 0 e 1')
xlabel('x')
ylabel('x^{1/n}')


%%

f = @(x) (sin(x) + x).^2;

x = 0:0.01:2*pi;
y = f(x);
plot(x, y)

%% 4)
clc; clear;

f = @(x) (2 * log(x+2) ./ sqrt(x+1)) - (x.^2 + 2*x + 1) ./ (x.^2 + 1);

x = 1:0.01:2;
plot(x, f(x), '--k')

%%
clc; clear;

f = @(a,x) a.^x;

a = [0.1 1 10];
x = 0:0.01:1;
Y = f(a', x);

plot(x, Y)
title('f(x)=a^x')
legend('a=0.1', 'a=1', 'a=10')


