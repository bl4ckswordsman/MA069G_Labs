%L4_1
clc
clear

hold on
axis([0 115 0 65])
x1 = [0:1:115];
% Investment constraint:
% 110.5x + 198.5y <= 12000
y1 = -291/397*x1 + 24000/397;

% Labour constraint:
% 11x + 32y <= 1250
y2 = -11/32*x1 + 625/16;

% Objective function:
% Z = max(51.5x + 119.5y)

plot(x1, y1, 'r', x1, y2, 'b')