%%
addpath('../lib')

%% 1)
clc; clear; format short e;
n = 7;
a = n + 2;

f = @(x) (a*x.^5 - 1) ./ (x.^5 + 1);
x = linspace(0, 1, 10);
y = f(x);

% i)
I = integral(f, 0, 1)
% ii)
I_tc = trapz(x, y)
% iii)
s1 = griddedInterpolant(x, y, 'linear');
z = nthroot(1/a, 5);
s1(z)

%% 2)
clc; clear; format short e;

% 2.a)

a = 0;
b = pi/4;
f = @(x) 1 ./ cos(x);

I = log(sqrt(2) + 1);

M = [10 100 1000 10000];
H = (b-a)./M;
I_pmc = zeros(size(M));
I_tc = zeros(size(M));
I_csc = zeros(size(M));
for i=1:length(M)
    m = M(i);
    x = linspace(a, b, m+1);
    y = f(x);
    I_pmc(i) = pmedc(a, b, m, f);
    I_tc(i) = trapz(x, y);
    I_csc(i) = simpsc(a, b, m, f);
end 

H

% PMC
err_pmc = abs(I - I_pmc)
polyfit(log(H), log(err_pmc), 1) % first value should be around 2

% TC
err_tc = abs(I - I_tc)
polyfit(log(H), log(err_tc), 1) % first value should be around 2

% CSC
err_csc = abs(I - I_csc)
polyfit(log(H), log(err_csc), 1) % first value should be around 4

% 2.b)
clc; clear; format short e;
a = 1;
b = 2;
f = @(x) sqrt(2*x + 5);


I = 1/3 * (sqrt(9^3) - sqrt(7^3))

M = [10 100 1000 10000];
H = (b-a)./M;
I_pmc = zeros(size(M));
I_tc = zeros(size(M));
I_csc = zeros(size(M));
for i=1:length(M)
    m = M(i);
    x = linspace(a, b, m+1);
    y = f(x);
    I_pmc(i) = pmedc(a, b, m, f);
    I_tc(i) = trapz(x, y);
    I_csc(i) = simpsc(a, b, m, f);
end 

H

% PMC
err_pmc = abs(I - I_pmc)
polyfit(log(H), log(err_pmc), 1) % first value should be around 2

% TC
err_tc = abs(I - I_tc)
polyfit(log(H), log(err_tc), 1) % first value should be around 2

% CSC
err_csc = abs(I - I_csc)
polyfit(log(H), log(err_csc), 1) % first value should be around 4