%L2_3b
clc
clear

D1 = [-5 5];
D2 = [-5 5; -5 5];
N = [10000; 100000; 500000; 1000000];

[N,mu, err] = mcconv(D1,N); 
a = polyfit(log(N),log(err),1)

[N2,mu2, err2] = mcconv(D2,N); 
a2 = polyfit(log(N2),log(err2),1)