%L1.3
clc
clear
format long

f = @(x) (sqrt((x-5)^5) + 2*cos(pi*sqrt(x))) / (sqrt(x+4*log(x-pi))-1);

x0 = 7;
h = 0.02;

k1 = (2*(2*f(x0 + h/2)-f(x0+h) - f(x0))) / (h^2);

f_prim_fram = ((f(x0+h) - f(x0))/h) + k1*h;

f_prim_cent = (f(x0 + h/2) - f(x0))/(h/2) + k1*h/2;