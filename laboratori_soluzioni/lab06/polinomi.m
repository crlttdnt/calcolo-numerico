%%
addpath('..\lib')

%% 
clc; clear;

p = [-3 2 0 1 -5]; % p(x) = -3x^4 + 2x^3 + x - 5
q = [1 0 0 -2 1 0]; % q(x) = x^5 - 2x^2 + x
h = [1 -1]; % h(x) = x - 1


w = polyval(p, 2)
W = polyval(p, [2, 3, 4])

a = 3;
z = a * p; % new polynomial
z = p / a; % new polynomial

%%
clc;

z = polysum(p, q)

z = conv(p, q)

[z, r] = deconv(q, p)
conv(p, z)+r % q

%%
clc;
p

s = polyder(p) % derivative

s = polyint(s) % integral (with q = 0)

z = roots(p)


%% 1)
clc; clear;

p = [1 -1 4 -1]; % x^3 - x^2 + 4x - 1
q = [1 -3 -1]; % x^2 - 3x - 1

diff = polysum(p, -q)
sum = polysum(3*p, 5*q)
prod = conv(p, q)
diff2 = 2 * conv(p, p) - 3 * conv(conv(q, q), q)
[q, r] = deconv(p, q)
pp = polyder(p)
v = polyval(p, 3) - polyval(q, 3)

%% 2)
clc; clear;

p = [1 0 -1 4]; % x^3 - x + 4
q = [1 6 0 -24 -1 -30]; % x^5 + 6x^4 - 24x^2 - x - 30

xp = -2:0.01:1;
xq = -6:0.01:3;

plot(xp, polyval(p, xp), xq, polyval(q, xq))
grid on

roots(p)
roots(q)

%% 3)
clc; clear;

p = [1 -2 -1]; % x^2 - 2x - 1

P = polyint(p);
polyval(P, 3) - polyval(P, 0)

q = [4 5 5 0 -1 0];
Q = polyint(q);
polyval(Q, 7) - polyval(Q, -1)


%% 4)
clc; clear;

p = [3 -1 -15 5];
xp = -2:0.01:2;
plot(xp, polyval(p, xp))
grid on

pp = polyder(p);
roots(pp) % max and mins of p

%%
p = [12 -15 -40 0 0 0];
xp = -1.5:0.01:2.5;
plot(xp, polyval(p, xp))
grid on

pp = polyder(p);
roots(pp) % max and mins of p

