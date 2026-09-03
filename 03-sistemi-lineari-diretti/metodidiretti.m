%% 1)

A = [-16 8 -7;
    1 -5 -3;
    1 10 14];

b = [-9; 4; -13];

A\b
inv(A)*b

%% 2)
clc;

A = [1 1 1; 2 2 2; 3 3 3];
b = [1 1 1]';

det(A) % 0
rank(A) % 1
A\b % "Matrix is singular"

%%
clc;

A = [1 2 3; 4 5 6; 5 7 9];
b = [1 2 3]';

det(A) % 3e^-15 (almost 0)
rank(A) % 2
rank([A b]) % 2
x = A\b % "Matrix is close to singular or badly scaled"
A*x % [1 2 3]

% rank(A) = rank(A|b), quindi la matrice ha soluzione
% det = 0 quindi ha infinite soluzioni

%%
clc;

A = [1 2 3; 4 5 6; 5 7 9];
b = [5 2 3]';

det(A) % 3e^-15 (almost 0)
rank(A) % 2
rank([A b]) % 3
x = A\b % "Matrix is close to singular or badly scaled"
A*x % [6 8 4]

% rank(A) != rank(A|b), quindi la matrice NON ha soluzione
% A\b ritorna una approssimazione della soluzione (non segnala errore!)


%% 3)
clc;
clear;
format long;

N = 43;
A = 7*eye(N);
A(1, 2:end) = 0.1;

A = A + diag(-3 * ones(N-2, 1), -2)
b = ones(N, 1)

x = A \ b
norm(A*x - b)


%% 4)
clc; clear; format long;

A = [4 -2 1;
    -2 5 -2;
    1 -2 6];

[L, U, P] = lu(A);
isequal(P, eye(3)) % true
b = A * ones(3, 1);

% LUx = b
% Quindi posso fare Ly = b
% E poi Ux = y

x1 = A \ b;

y = L \ b;
x2 = U \ y;

isequal(x1, x2)

%% 5)
clc; clear; format long;

A = [-5 8 -7;
    12 -5 -3;
    1 10 14];

[L, U, P] = lu(A);
b = A * ones(3, 1);
% P is not the identity
% So we have PA = LU
% Quindi LUx = Pb
% Che risolvo come Ly = Pb
% E poi Ux = y

y = L \ (P*b);
x = U \ y

all(abs(x - ones(3,1)) < 1e-12)

%% 6)
clc; clear; format long;

N = 100;
A = 4*eye(N) -2 * diag(ones(1, N-1), -1) -2 * diag(ones(1, N-1), 1);
invA = inv(A);

% Modo 1: Risolvendo ogni sistema con \

tic
invA1 = zeros(N);
for i=1:N
    ei = zeros(N, 1);
    ei(i) = 1;
    invA1(:, i) = A \ ei;
end
toc

matrixcmp(invA, invA1)

% Modo 2: Fattorizzare LU una volta, poi risolvere i diversi sistemi
tic
[L, U, P] = lu(A);
invA2 = zeros(N);
for i=1:N
    ei = zeros(N, 1);
    ei(i) = 1;
    y = L \ (P * ei);
    invA2(:, i) = U \ y;
end
toc

matrixcmp(invA, invA2)

%% 7)
clc;

% spy(A) mostra in un plot le posizioni della matrice A in cui i 
% coefficienti di A non sono nulli

A=4*diag(ones(10,1))-diag(ones(9,1),1)-diag(ones(9,1),-1);

[L, U, P] = lu(A);
matrixcmp(P, eye(10))
subplot(1,3,1)
spy(A)
title('A')
subplot(1,3,2)
spy(L)
title('L')
subplot(1,3,3)
spy(U)
title('U')

% In questo caso A è "a banda", P è la matrice identità e dunque L e U sono
% anch'esse a banda

%%
clc;

B=3*diag(ones(10,1))-2*diag(ones(9,1),1)-2*diag(ones(9,1),-1);

[L, U, P] = lu(B);
matrixcmp(P, eye(10))
subplot(1,3,1)
spy(B)
title('A')
subplot(1,3,2)
spy(L)
title('L')
subplot(1,3,3)
spy(U)
title('U')

% In quest caso B è a banda, ma P non è identità e dunque L ed U non sono a
% banda

%%
clc;

C=2*diag(ones(10,1));
C(1:end, 1) = 0.1;
C(1, 1:end) = 0.1;

C

[L, U, P] = lu(C);
matrixcmp(P, eye(10))
subplot(1,3,1)
spy(C)
title('A')
subplot(1,3,2)
spy(L)
title('L')
subplot(1,3,3)
spy(U)
title('U')

% In questo caso C non è a banda, P è identità ma comunque L ed U non sono a
% banda (sono addirittura piene)

%%
clc;


D=diag(ones(7,1));
D(1:end, end) = 1;
D(end, 1:end) = (2:8);

D

[L, U, P] = lu(D);
matrixcmp(P, eye(7))
subplot(1,3,1)
spy(D)
title('A')
subplot(1,3,2)
spy(L)
title('L')
subplot(1,3,3)
spy(U)
title('U')

% In questo caso C non è a banda, P non è identità ed L ed U non sono a
% banda (sono addirittura piene)


%% CHOLESKY
clc;

A = [1 -1 0;
    -1 5 6;
    0 6 10]

issymmetric(A)
R = chol(A)

% A è tale per cui A=R'R
% Posso usare questa fattorizzazione per risolvere un sistema lineare in A
% Ax = b ---> R'Rx=b dunque risolvo R'y=b e poi Rx = y

b = [3; 1; 1];

x1 = A \ b

y = R' \ b;
x = R \ y

%%
function iseq = matrixcmp(X, Y)
    iseq = all(all(abs(X - Y) < 1e-12));
end
