%L1.5
clc
clear

x = -10:0.01:10 ;
F = @(x) (-(cos(x) + x/5));


plot(x,F(x));
xline(0)
yline(0)
grid
shg