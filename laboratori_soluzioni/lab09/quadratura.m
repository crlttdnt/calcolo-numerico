%%
addpath('../lib')

%% 1)
clc; clear;
a = -2;
b = 5;
f = @(x) 7*x - 5;
p = [7 -5];

% Usando 'integral'
integral(f, a, b)

% Usando 'polyint'
P = polyint(p);
polyval(P, b) - polyval(P, a)

% Usando formula di quadratura (grado 1, dunque bastano PM opppure T)
% I_PM(f) ~ (b-a)*f((a+b)/2)
(b-a) * f((a+b)/2)
% I_T(f) ~ (b-a)/2*[f(a) + f(b)]
(b-a)/2 * (f(a) + f(b))

%%
clc; clear;

a = -2;
b = 5;
f = @(x) 5*x.^2 - 3*x + 8;
p = [5 -3 8];

integral(f, a, b)

P = polyint(p);
polyval(P, b) - polyval(P, a)

% Grado 2 -> Per esattezza serve CS
% Trapezio:
(b-a)/2 * (f(a) + f(b)) % Sbagliato
% CS: I_CS(f) ~ (b-a)/6 * [f(a) + 4f((a+b)/2) + f(b)]
(b-a)/6 * (f(a) + 4*f((a+b)/2) + f(b)) % Giusto

%%
clc; clear;

a = -2;
b = 5;
f = @(x) 3*x.^3 - 2*x.^2 + 5*x - 1;
p = [3 -2 5 -1];

P = polyint(p);
polyval(P, b) - polyval(P, a)

(b-a)/6 * (f(a) + 4*f((a+b)/2) + f(b))


%% 
clc; clear;

x = [-10 -5 -3 -1 0 1 2 3 5 7 9];
y = [-1 5 2.3 1.4 -2  -4 3 1.1 3.2 -1 -4]; 
I = trapz(x, y)

%% 2.a)
clc; clear;
 
a = 0;
b = pi/2;
f = @(x) sin(x);

I = integral(f, a, b);

M = [20 200 2000 20000];
Hs = (b-a)./M;

I_tcs = zeros(size(M));
errs = zeros(size(M));

for i = 1:length(M)
    m = M(i);
    
    nodes = linspace(a, b, m+1); % m sottointervalli significa m+1 nodi di quadratura
    values = f(nodes);

    I_tcs(i) = trapz(nodes, values);
    errs(i) = abs(I - I_tcs(i));
end

% Verifica che err = O(H^2)
% devo vedere se err = C*H^2
% idea: log(err) = log(C*H^2); log(err) = log(C) + 2*log(H)
% dunque posso trovare l'interpolante tra i punti log(H), log(err)
% e verificare che abbia una pendenza 2
p = polyfit(log(Hs), log(errs), 1);
slope = p(1);

% plot:
loglog(Hs, errs)

%% 2.b)
clc; clear;

a = -10;
b = 10;
f = @(x) cos(x) .* exp(sin(x));

I = integral(f, a, b);

M = [20 200 2000 20000];
Hs = (b-a)./M;

I_tcs = zeros(size(M));
errs = zeros(size(M));

for i = 1:length(M)
    m = M(i);

    nodes = linspace(a, b, m+1); % m sottointervalli significa m+1 nodi di quadratura
    values = f(nodes);

    I_tcs(i) = trapz(nodes, values);
    errs(i) = abs(I - I_tcs(i));
end

% Verifica che err = O(H^2)
% devo vedere se err = C*H^2
% idea: log(err) = log(C*H^2); log(err) = log(C) + 2*log(H)
% dunque posso trovare l'interpolante tra i punti log(H), log(err)
% e verificare che abbia una pendenza 2
p = polyfit(log(Hs), log(errs), 1);
slope = p(1)

% plot:
loglog(Hs, errs)

%% 3)
clc; clear; 

a = -10;
b = 10;
f = @(x) cos(x) .* exp(sin(x));

toll = 1e-6;

m = 1;
x = linspace(a, b, m+1);
y = f(x);
I_old = trapz(x, y);
while 1
    m = 2*m;
    x = linspace(a, b, m+1);
    y = f(x);
    I_new = trapz(x, y);
    if abs(I_new - I_old) < toll
        break
    end
    I_old = I_new;
end

I_new
I = integral(f, a, b)

%% 4)
clc; clear;

a = 1;
b = 2;
f = @(x) 1./x + exp(x);

I = integral(f, a, b);
M = [20 200 2000 20000];
H = (b-a)./M;
I_csc = zeros(size(M));
err = zeros(size(M));
for i=1:length(M)
    m = M(i);
    x = linspace(a, b, m+1);
    y = f(x);

    I_csc(i) = pmedc(a, b, m, f);
    err(i) = abs(I - I_csc(i));
end

I_csc
err

% Con PM, dovrebbe essere err = O(H^2) = C*H^2
% log(err) = log(C) + 2*log(H)
polyfit(log(H), log(err), 1) %ok

%%
clc; clear; format long e;

a = 0;
b = 5;
f = @(x) 1 ./ (1 + x.^2);

I = integral(f, a, b);
M = [20 200 2000 20000];
H = (b-a)./M;
I_csc = zeros(size(M));
err = zeros(size(M));
for i=1:length(M)
    m = M(i);
    x = linspace(a, b, m+1);
    y = f(x);

    I_csc(i) = simpsc(a, b, m, f);
    err(i) = abs(I - I_csc(i));
end

I_csc
err

% Con PM, dovrebbe essere err = O(H^2) = C*H^4
% log(err) = log(C) + 4*log(H)
polyfit(log(H), log(err), 1) % 2.44?