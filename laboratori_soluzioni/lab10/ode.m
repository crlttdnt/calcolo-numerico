%%
addpath('..\lib')

%% 6) C1
clc; clear; 

f = @(t, y) -2 .* t .* y.^2;
y0 = 1;
t0 = 0;
tmax = 2;

[T, U] = ode45(f, [t0 tmax], y0);

sol = @(t) 1 ./ (1+t.^2);
plot(T, U, T, sol(T))

err = norm(U-sol(T), inf) / norm(sol(T), inf)

%% 6) C2
clc; clear;

f = @(t, y) -25 * y;
y0 = 1;
tspan = [0 2];

[T, U] = ode45(f, tspan, y0);

sol = @(t) exp(-25*t);
plot(T, U, T, sol(T))

err = norm(U-sol(T), inf) / norm(sol(T), inf)