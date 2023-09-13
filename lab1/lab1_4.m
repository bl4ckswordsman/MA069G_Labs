%L1.4 a
clc
clear
format long

f = @(x) ((sqrt((x-5)^5) + 2*cos(pi*sqrt(x))) / (sqrt(x+4*log(x-pi))-1));

x = 7;
h = 0.04;

D3 = ((f(x-h) - 2*f(x) + f(x+h)) / h^2);

