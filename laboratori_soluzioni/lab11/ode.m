%% 
addpath('..\lib')

%% 1)
clc; clear;
hold on;

f = @(t, y) t*(2+t) - y;
tspan = [0 2];
y0 = 1;

sol = @(t) t.^2 + exp(-t);

H = [0.5 0.25 0.125];
errs = zeros(1, length(H));
for i = 1:length(H)
    h = H(i);
    T = 0:h:2;
    [T, U] = eulero(f, T, y0);
    plot(T, U);
    errs(i) = max(abs(sol(T)-U));
end

plot(0:0.01:2, sol(0:0.01:2), 'k');
legend('h=0.5','h=0.25','h=0.125','exact');

errs

% If we assume errs = O(h^p)
% That this means errs = C*H^p
% log(errs) = log(C) + p*log(H)

polyfit(log(H), log(errs), 1)
% result is 1.0433e+00 1.0659e-01 so p = 1.0433


%% 2a)
clc; clear;
hold on;

f = @(t, y) -2*t*y.^2;
t0 = 0;
tmax = 2;
y0 = 1;

sol = @(t) 1 ./ (1+t.^2);

% a)
H = [0.1 0.01 0.001 0.0001];
errs = zeros(1, length(H));
for i = 1:length(H)
    h = H(i);
    T = t0:h:tmax;
    [T, U] = eulero(f, T, y0);
    plot(T, U);
    errs(i) = max(abs(sol(T)-U));
end

plot(t0:0.01:tmax, sol(t0:0.01:tmax), 'k');

errs

% err(h) = O(h^p)
% errs = C*H^p
% log(errs) = log(C) + p*log(H)

polyfit(log(H), log(errs), 1) % p is around 1

%% 2b)
clc; clear;
hold on;

f = @(t, y) -25 * y;
t0 = 0;
tmax = 2;
y0 = 1;

sol = @(t) exp(-25*t);

% a)
H = [0.1 2/25 0.05];
errs = zeros(1, length(H));
for i = 1:length(H)
    h = H(i);
    T = t0:h:tmax;
    [T, U] = eulero(f, T, y0);
    plot(T, U);
    errs(i) = max(abs(sol(T)-U));
end

plot(t0:0.01:tmax, sol(t0:0.01:tmax), 'k');

errs

% err(h) = O(h^p)
% errs = C*H^p
% log(errs) = log(C) + p*log(H)

polyfit(log(H), log(errs), 1) % p is around 1

%% 2c)
clc; clear;
hold on;

f = @(t, y) -25 * y;
t0 = 0;
tmax = 2;
y0 = 1;

sol = @(t) exp(-25*t);

% a)
H = [0.01 0.001 0.0001]; % notice all h < 2/25 otherwise "assolutamente instabile"
errs = zeros(1, length(H));
for i = 1:length(H)
    h = H(i);
    T = t0:h:tmax;
    [T, U] = eulero(f, T, y0);
    plot(T, U);
    errs(i) = max(abs(sol(T)-U));
end

plot(t0:0.01:tmax, sol(t0:0.01:tmax), 'k');

errs

% err(h) = O(h^p)
% errs = C*H^p
% log(errs) = log(C) + p*log(H)

polyfit(log(H), log(errs), 1) % p is around 1


%% 3) C1
clc; clear;
hold on;

f = @(t, y) -2*t*y.^2;
t0 = 0;
tmax = 2;
y0 = 1;

sol = @(t) 1 ./ (1+t.^2);
toll = 1e-6;
nitmax = 200;
dfy = @(t, y) -4 * t .* y;

% a)
H = [0.1 0.01 0.001 0.0001];
errs = zeros(1, length(H));
for i = 1:length(H)
    h = H(i);
    T = t0:h:tmax;
    [T, U] = eulimp(f, T, y0, dfy, toll, nitmax);
    plot(T, U);
    errs(i) = max(abs(sol(T)-U));
end

plot(t0:0.01:tmax, sol(t0:0.01:tmax), 'k');

errs

% err(h) = O(h^p)
% errs = C*H^p
% log(errs) = log(C) + p*log(H)

polyfit(log(H), log(errs), 1) % p is around 1

%% 3) C2
clc; clear;
hold on;

f = @(t, y) -25 * y;
t0 = 0;
tmax = 2;
y0 = 1;

sol = @(t) exp(-25*t);
toll = 1e-6;
nitmax = 200;
dfy = @(t, y) -25;

% a)
H = [0.1 0.01 0.001 0.0001];
errs = zeros(1, length(H));
for i = 1:length(H)
    h = H(i);
    T = t0:h:tmax;
    [T, U] = eulimp(f, T, y0, dfy, toll, nitmax);
    plot(T, U);
    errs(i) = max(abs(sol(T)-U));
end

plot(t0:0.01:tmax, sol(t0:0.01:tmax), 'k');

[H' errs']

% err(h) = O(h^p)
% errs = C*H^p
% log(errs) = log(C) + p*log(H)

polyfit(log(H), log(errs), 1) % p is around 1


%% 4) C1
clc; clear;
hold on;

f = @(t, y) -2*t*y.^2;
t0 = 0;
tmax = 2;
y0 = 1;

sol = @(t) 1 ./ (1+t.^2);
toll = 1e-6;
nitmax = 200;
dfy = @(t, y) -4 * t .* y;

% a)
H = [0.1 0.01 0.001 0.0001];
errs = zeros(1, length(H));
for i = 1:length(H)
    h = H(i);
    T = t0:h:tmax;
    [T, U] = heun(f, T, y0);
    plot(T, U);
    errs(i) = max(abs(sol(T)-U));
end

plot(t0:0.01:tmax, sol(t0:0.01:tmax), 'k');

[H' errs']

% err(h) = O(h^p)
% errs = C*H^p
% log(errs) = log(C) + p*log(H)

polyfit(log(H), log(errs), 1) % p is expected to be 2

%% 4) C2
clc; clear;
hold on;

f = @(t, y) -25 * y;
t0 = 0;
tmax = 2;
y0 = 1;

sol = @(t) exp(-25*t);
toll = 1e-6;
nitmax = 200;
dfy = @(t, y) -25;

% a)
H = [0.1 0.01 0.001 0.0001]; % remove 0.1 to see stability
errs = zeros(1, length(H));
for i = 1:length(H)
    h = H(i);
    T = t0:h:tmax;
    [T, U] = heun(f, T, y0);
    plot(T, U);
    errs(i) = max(abs(sol(T)-U));
end

plot(t0:0.01:tmax, sol(t0:0.01:tmax), 'k');

[H' errs']

% err(h) = O(h^p)
% errs = C*H^p
% log(errs) = log(C) + p*log(H)

polyfit(log(H), log(errs), 1) % p is expected to be 2

%% 5)
clc; clear;
hold on;

f = @(t, y) t.^2 * (1 - 3*y);
t0 = 0;
tmax = 2;
y0 = 2;

sol = @(t) 1/3*(1+5*exp(-t.^3));
toll = 1e-6;
nitmax = 200;

dfy = @(t, y) -3*t.^2;

H = [0.5 0.05 0.005 0.0005];
errs = zeros(1, length(H));
for i = 1:length(H)
    h = H(i);
    T = t0:h:tmax;
    [T, Y] = cranknic(f, T, y0, dfy, toll, nitmax);
    plot(T, Y);
    errs(i) = norm(sol(T)-Y, inf);
end

T = t0:0.01:tmax;
plot(T, sol(T), 'k');

[H' errs']

polyfit(log(H), log(errs), 1) % 2?
