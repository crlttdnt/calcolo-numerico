%%
addpath('..\lib')

%% Pb. 1
clc; clear;
hold on;

f = @(t, y) t.^2 * (1 - 3*y);
t0 = 0;
tmax = 2;
y0 = 2;

sol = @(t) 1/3 * (1 + 5*exp(-t.^3));

toll = 1e-6;
nitmax = 200;
dfy = @(t, y) -3*t.^2;

H = [0.1 0.01 0.001];
errs = zeros(1, length(H));
for i = 1: length(H)
    h = H(i);
    T = t0:h:tmax;
    %[T, Y] = eulero(f, T, y0);
    %[T, Y] = eulimp(f, T, y0, dfy, toll, nitmax);
    %[T, Y] = heun(f, T, y0);
    [T, Y] = cranknic(f, T, y0, dfy, toll, nitmax);
    plot(T, Y);
    errs(i) = max(abs(Y - sol(T)));
end

T = t0:0.01:tmax;
plot(T, sol(T), 'k');

[H' errs']
polyfit(log(H), log(errs), 1)

%% Pb. 2
clc; clear;
hold on;

f = @(t, y) y./t + (y./t).^2;
t0 = exp(1);
tmax = exp(1) + 2;
y0 = exp(1);

sol = @(t) t ./ (2 - log(t));

toll = 1e-6;
nitmax = 200;
dfy = @(t, y) 1./t + 2./(t.^2)*y;

H = [0.1 0.01 0.001];
errs = zeros(1, length(H));
for i = 1: length(H)
    h = H(i);
    T = t0:h:tmax;
    %[T, Y] = eulero(f, T, y0);
    %[T, Y] = eulimp(f, T, y0, dfy, toll, nitmax);
    %[T, Y] = heun(f, T, y0);
    [T, Y] = cranknic(f, T, y0, dfy, toll, nitmax);
    plot(T, Y);
    errs(i) = max(abs(Y - sol(T)));
end

T = t0:0.01:tmax;
plot(T, sol(T), 'k');

[H' errs']
polyfit(log(H), log(errs), 1)

%% Pb. 3
clc; clear;
hold on;

f = @(t, y) - 1./t * (2*y + t.^2 * y.^2);
t0 = 1;
tmax = 5;
y0 = 1;

sol = @(t) 1 ./ (t.^2 .* (1 + log(t)));

toll = 1e-6;
nitmax = 200;
dfy = @(t, y) -2./t - 2*t*y;

H = [0.1 0.01 0.001];
errs = zeros(1, length(H));
for i = 1: length(H)
    h = H(i);
    T = t0:h:tmax;
    [T, Y] = eulero(f, T, y0);
    %[T, Y] = eulimp(f, T, y0, dfy, toll, nitmax);
    %[T, Y] = heun(f, T, y0);
    %[T, Y] = cranknic(f, T, y0, dfy, toll, nitmax);
    plot(T, Y);
    errs(i) = max(abs(Y - sol(T)));
end

T = t0:0.01:tmax;
plot(T, sol(T), 'k');

[H' errs']
polyfit(log(H), log(errs), 1)


%% Pb. 4
clc; clear;
hold on;

f = @(t, y) - y.^2;
t0 = 0;
tmax = 10;
y0 = 5;

sol = @(t) 5 ./ (1 + 5*t);

toll = 1e-6;
nitmax = 200;
dfy = @(t, y) -2*y;

H = [0.1 0.01 0.001];
errs = zeros(1, length(H));
for i = 1: length(H)
    h = H(i);
    T = t0:h:tmax;
    [T, Y] = eulero(f, T, y0);
    %[T, Y] = eulimp(f, T, y0, dfy, toll, nitmax);
    %[T, Y] = heun(f, T, y0);
    %[T, Y] = cranknic(f, T, y0, dfy, toll, nitmax);
    plot(T, Y);
    errs(i) = max(abs(Y - sol(T)));
end

T = t0:0.01:tmax;
plot(T, sol(T), 'k');

[H' errs']
polyfit(log(H), log(errs), 1)


%% Pb. 5
clc; clear;
hold on;

f = @(t, y) y./t + pi.*t.*cos(pi*t);
t0 = 1;
tmax = 3;
y0 = 0;

sol = @(t) t .* sin(pi*t);

toll = 1e-6;
nitmax = 200;
dfy = @(t, y) 1./t;

H = [0.1 0.01 0.001];
errs = zeros(1, length(H));
for i = 1: length(H)
    h = H(i);
    T = t0:h:tmax;
    %[T, Y] = eulero(f, T, y0);
    %[T, Y] = eulimp(f, T, y0, dfy, toll, nitmax);
    %[T, Y] = heun(f, T, y0);
    [T, Y] = cranknic(f, T, y0, dfy, toll, nitmax);
    plot(T, Y);
    errs(i) = max(abs(Y - sol(T)));
end

T = t0:0.01:tmax;
plot(T, sol(T), 'k');

[H' errs']
polyfit(log(H), log(errs), 1)


