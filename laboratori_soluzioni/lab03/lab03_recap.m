%% 1)
clc;

identity(1e-08)
identity(1e-12)
identity(1e-14)

function y = identity(x)
y = ((x+1)-1)/x;
end
%% 2)
clc;

A = diag(20*ones(1, 10)) + diag(1:9, -1) + diag(1:9, 1) -2 * diag(ones(1, 7), 3) -2 * diag(ones(1, 7), -3)


%% 3)
clc;

A = diag(2*ones(1, 10)) - tril(ones(10, 10) , -1) + triu(ones(10, 10) , 1)
A = triu(tril(A, 5), -5)

B = zeros(10, 10);
for i=(1:10)
    B(i, :) =  [-1*ones(1,i-1) [2] ones(1, 10-i)];
end
B

%% 4)
clc;

A = [-5 8 -7 1;
    12 -5 -3 1;
    1 10 14 1;
    1 0 1 2];

b1 = [-43; 21; -1; 3];
b2 = [-1; 75; -26; 3];

A\b1
A\b2

