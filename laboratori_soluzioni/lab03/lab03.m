%%
clc

realmax
realmin
2/0

realmin
realmin/10

%% 
clc
format long

1/3
1/exp(1)

eps

%%
clc
format long

a = 1;
b = 1e50;
while a ~= 0
    a = a / b
end

%%
clc; format long;

x = 77777777
y1 = sqrt(x*x+1)-x
y2 = 1/(sqrt(x*x+1)+x)

%%
clc; format long;

n = 10^12
an = (1+1/n)^n
En = abs(an-exp(1))

n = 10^14
an = (1+1/n)^n
En = abs(an-exp(1))

% Error is large for ^14 than ^12

%% mat_trisup.m
clc

n = input('Inserisci dimensione matrice ');
if n <= 0
    disp('Dimensione non accettabile');
    return;
end

A = eye(n)*n
for i = 1:n
    %for j = i+1:n
    %    A(i,j) = i/(j+1);
    %end
    A(i,i+1:n) = i./[i+2:n+1];
end

A

%%
clc


B = [4 -1 1;
    -1 3 -2;
    1 -2 3];
C = inv(B)

B*C
C*B

norm(B, 1)
norm(B, inf)

%% Exercise 4
clc


A = [3 9 0 -7; 
    2 2 2 1; 
    0 2 1 3;
    4 -3 0 9];

norm(A, 1)
norm(inv(A), inf)

max(sum(abs(A)))
max(sum(abs(inv(A)')))

%% 
clc;

v = (1:4)
diag(v)
diag(v, 1)
diag(v, -2)

A = diag(2*ones(1, 7)) - diag(ones(1, 6), 1) - diag(ones(1, 6), -1)

%% Exercise 5
clc;

v = [1:0.3:2.2]

diag(v)
diag(v,1)
diag(v, -1)
diag(v, 3)
diag(v, -2)

%%
clc;

A = diag(1:10) - diag(ones(1, 9), -1) - diag(ones(1, 8), 2)

B = diag((1:10).^2);
B(1, :) = 0.1;
B(:, 1) = 1

%% 
clc;

C = [4 -1 1 5;
    -1 3 -2 3;
    1 -2 3 9;
    1 3 7 6]

tril(C)
tril(C, -1)
triu(C)
triu(C, 1)

%% Exercise 6
clc;

A = hilb(4)

triu(A)
tril(A)

%% Exercise 7
clc;

A = ones(10)
tril(triu(A, -2), 4)

%% Exercise 8
clc; format long;

A = [-16 8 -7;
    1 -5 -3;
    1 10 14];
b = [-9; 4; -13];

x1 = A\b

x2 = inv(A)*b

