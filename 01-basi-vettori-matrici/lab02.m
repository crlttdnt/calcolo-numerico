a = [1 2 3 4];
b = [4 3 2 1];
disp(a.*b); 
disp(a./b);
disp(a.^b);
disp(a.^3);

%%
x = [0, pi/6, pi/4, pi/3, pi];
disp(x.*sin(x));

%% Exercise 1
u = [1 0 2 -3];
v = [3; 0; 2; 1];
z = u.*(v');
w = u.^(v');
y = z./w;
disp(z);
disp(w);
disp(y);

x = linspace(1, 2, 11);
disp(x.*log(x));
disp((x.^3).*cos(x));

%%
v = [1 2 3 4 5];
w = [100 200];

v(end-1:end) = w;
disp(v);
v(3:4) = [];
disp(v);
disp([v w]);

%% Exercise 2
x = [-3 5 8 0 1 5 -2 4];
x(6) = 100;
x(1:3) = [4 7 -1];
x(4) = [];
x = [[1 2 3] x];
disp(x);

%% Exercise 3
a = (1:10);
a = sin(a.^2);
disp(a);
disp(max(a));
disp(min(a));

%%
disp(sum(1:10)); % 55
disp(sum((1:10).^2)); % 385

%%
a = 1./(1:100);
disp(prod(a(1:2:20)));
b = diff(a);
disp(sum(b));
disp(a(100) - 1);

%% 
v = [1 2 3 4];
w = ones(1, 4);

disp(dot(v, w));
disp(v*w');
disp(norm(v, 2));

v = [1 3 -5 2];
disp(norm(v, inf));

%% Exercise 4
u = [1 0 2 -3];
v = [3 0 2 1];

disp(u*v');
disp(norm(u, 2));
disp(norm(v, 2));

%%
A = [1 2 3; 
    4 5 6];
B = ones(2, 3);

C = A + B;
D = A - B;

s = B(1,2) + D(2, 3);

A';

%%
eye(4);
hilb(3);

%% Exercise 5
n = 5;
disp(eye(n) + zeros(n) + ones(n) + hilb(n));

A = [2 1 0;
    3 1 0;
    -2 1 1];
E = [1 -1 1;
    2 -1 0;
    3 2 1];

disp(A*E);
disp(E*A);

C = A.*E;
disp(C);

%%
A = eye(4);
B = hilb(2);

A(3:4, 3:4) = B
disp(A);

r = A(4,:);
disp(r);

B(:, 2) = [];
disp(B);

%%
A = zeros(3, 2);
B = ones(3, 4);
C = 2 * ones(2, 6);

D = [A B]

E = [D; 
    C]

%% Exercise 6
A = [1 2 3 4;
    -1 0 -1 0;
    4 5 6 7;
    5 4 3 2];
disp(A);

A(:,3) = 100;
A(2,:) = -3;
A(3:4,2:3) = [1 2; 3 4];
A(:, 3) = [];
A(5, :) = [3 1 5];
disp(A);

%%

A = [4 -1;
    -1 3];
det(A)
rank(A)


%% Exercise 7

function is_eq = fpcmp(a, b, tol)
    if nargin < 3
        tol = 1e-12;
    end
    is_eq = abs(a-b) < tol;
end

A = [2 1 0;
    3 1 0;
    -2 1 1];
E = [1 -1 1;
    2 -1 0;
    3 2 1];

alpha = rand;

assert(fpcmp(det(A), det(A')));
assert(fpcmp(det(alpha*A), alpha^3*det(A')));
assert(fpcmp(det(A*E), det(A)*det(E)));

A = [1 2 3 4;
    -1 0 -1 0;
    4 5 4 7;
    5 4 3 2];
B = [1 3 0 -1;
    -1 0 1 2;
    1 2 3 4;
    0 3 1 1];

det(A)
rank(A)
det(B)
rank(B)

prod(A)
sum(A)
max(A)
min(A)
sort(A)