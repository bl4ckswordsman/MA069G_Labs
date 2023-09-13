%L1.8
clc
clear

x_start = -4;

x_0 = fzero('-cos(x)-0.2*x',x_start);

x0 = @(x) (fzero('-cos(x)-0.2*x',x));
