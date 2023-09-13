%L1.7
%clc
clear

F = @(x) (-(cos(x) + x/5));
fp = @(x) (sin(x) - 1/5);

tolerans = 0.5;

% VAL AV x0 och x1
n = 1;
x0 = input('Ange ett startvärde(x_n) i [-4,4]: ');   
x1 = input('Ange ett sluttvärde(x_n+1) i [-4,4]: ');  

% SEKANTMETODEN
while abs(x1-x0) >= tolerans
    x2 = x1 - ((F(x1)*(x1-x0))/(F(x1)-F(x0)));
    x0 = x1;
    x1=x2;
    n = n + 1;
end

fprintf('approximation av nollstället: %s \n',num2str(x1,16))  
fprintf('antal genomförda iterationer: %s \n',num2str(n)) 

