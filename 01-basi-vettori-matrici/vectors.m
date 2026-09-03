%% Exercise 4

disp(28:1:80);
%%
disp(22:-4:-10);
%%
disp(linspace(-1, 5, 125));
%%
u = [1 2 0 -3];
v = [3 0 2 1];
disp(u+v);
disp(u'-v');
disp(5*u);
disp((u+v)/10);

%% Recap

num = exp(2)*cos(pi/6)+1;
den = 4 + log(3);
disp(num/den);

%%
a = 8;
disp((a+nthroot(a,3))/(2*a+4));

%%
x = 3;
y = exp(-2*x)*cos(3*x) - 3*sqrt(x+1);
disp(y);

%%
z = (-7)^(1/5);
disp(z);
disp(real(z));
disp(imag(z));
disp(abs(z));

%%
disp(-13:2:75);
disp(-2.7:1.5:8.3);
disp(linspace(-2, 3, 150));

%%
x = linspace(0, 1, 11);
x2 = (0:0.1:1);

disp(x);
disp(x2);
disp(all(abs(x-x2) < 1e-10));



