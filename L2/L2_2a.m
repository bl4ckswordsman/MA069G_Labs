%L2_2a
clc
clear

D = [1 6];
n = [10e3; 10e4; 10e5];
n1 = 10e3;
n2 = 10e4;
n3 = 10e5;

y = @(n) (floor(1+6*rand(1,n)));
y1 = y(n1);
y2 = y(n2);
y3 = y(n3);

mean_y1 = mean(y1);
mean_y2 = mean(y2);
mean_y3 = mean(y3);
[N, val, err] = mcconv(D,n1);

