%% 1)
clc; clear; format long;

A = [7 0 1 4;
    0 5 10 1;
    1 -3 1 0;
    4 1 1 -9];

b1 = [3; 1; 1; 0];
b2 = [0; 4; 7; 50];

[L, U, P] = lu(A);

% In generale LU = PA
% Dunque A = LU/inv(P)
% Per risolvere Ax = b posso risolvere LUx = Pb
% Che significa: 
% risolvo Ly = Pb in y
% risolvo Ux = y in x

y1 = L \ (P*b1);
x1 = U \ y1

matcmp(x1, A \ b1)

y2 = L \ (P*b2);
x2 = U \ y2

matcmp(x2, A \ b2)


%% 2)
clc; clear; format long;

A = [-5 8 -7 1;
    12 -5 -3 1;
    1 10 14 1;
    1 0 1 2];

b1 = [-43 21 -1 3]';
b2 = [-1 76 -26 3]';

[L, U, P] = lu(A);

% LU = PA
% LUx = Pb

y1 = L \ (P*b1);
x1 = U \ y1

y2 = L \ (P*b2);
x2 = U \ y2


%% 3)
clc; clear; format long;

% Il calcolo dell'inversa tramite fattorizzazione LU prevede che si
% risolvano N sistemi lineari Ax = ei
% Dove ei è un vettore di tutti zeri, tranne per un 1 in posizione i
% Con fattorizzazione diventa LUx = Pei -> Ly = P*ei, Ux = y

A = [-5 8 -7 1;
    12 -5 -3 1;
    1 10 14 1;
    1 0 1 2];

[L, U, P] = lu(A);

invA = zeros(4);
for i = (1:4)
    ei = zeros(4, 1); 
    ei(i) = 1;
    y = L \ (P*ei);
    x = U \ y;
    invA(:, i) = x;
end

matcmp(invA, inv(A))


%% 4)
clc; clear; format long;

n = 10;
A = hilb(n) + 3*diag(ones(n, 1))-1*diag(ones(n-1, 1), 1)-1*diag(ones(n-1, 1), -1)


[L, U, P] = lu(A);

norm(L, inf)
norm(U, inf)

b = ones(10, 1);
y = L \ (P*b);
x = U \ y;

norm(y, inf)
norm(x, inf)
 

%% 5)
clc; clear; format long;

A = 5*eye(8) - 2 * diag(ones(7, 1), 1) - 2 * diag(ones(7, 1), -1);
b = [(1:7) [26]]';

R = chol(A);
norm(R, inf)

% Ax = b -> R'Rx = b -> R'y = b poi Rx = y

y = R' \ b;
x = R \ y;

norm(y, 2)
norm(x, 2)


%%

% Compares two matrices for equality
function are_equal = matcmp(A, B)
    are_equal = all(abs(A - B) <= 1e-10, 'all')
end