%L2_3a
clc
clear

D1 = [-5 5];
D2 = [-5 5; -5 5];

N = [1000; 10000; 100000; 1000000];
[N, mu, err] = mcconv(D1, N); 
[N1, mu1, err1] = mcconv(D2, N);