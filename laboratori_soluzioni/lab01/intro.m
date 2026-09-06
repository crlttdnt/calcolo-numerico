%% Exercise 1

a = 3;
b = 2;

disp(3/(a+b));
disp((a+b)/2);
disp((a+b)/2*a);
disp(1/8^(1/3));
disp(64^(1/4));

%%

x = 10;
y = 5;
z = 2;

disp((3*x-2*y)/(5*z*z));

%%
a = 1/3;
b = 1/5;
disp((a^-3)/(1-b+3*a)^2)


%% Exercise 2

x = pi/2;
y = 2*sin(x)*cos(x) - cos(2*x);
disp(y)

%%

x = 5;
y = x/nthroot(x-9, 5);
disp(y);

%%
x = 10;
num = exp(1)^(sin(x*x)) + cos(x);
den = 2*sqrt(x)+5*log(x);
disp(num/den);

%% Exercise 3

mypi = atan(1)*4;
disp(mypi);
disp(pi == mypi);

mypi2 = abs(log(-1));
disp(mypi2);
disp(pi == mypi2);
