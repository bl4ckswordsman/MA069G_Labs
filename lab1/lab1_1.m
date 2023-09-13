%L1.1
clc
clear
format long

f = @(x) (sqrt((x-5).^5) + 2*cos(pi*sqrt(x))) / (sqrt(x+4*log(x-pi))-1);

% Framåtdifferens D1(x,h) och centraldifferens D2(x,h)
x=7;
h=0.02;
D1 = (f(x+h)-f(x))/h;
D2 = (f(x+h)-f(x-h))/(2*h);