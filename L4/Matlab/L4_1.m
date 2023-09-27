%L4_1
clc
clear

hold on
axis([95 120 0 100])
x1 = [95:0.1:120];

% Area constraint:
% x + y <= 110
y1 = -x1 + 110;

% Investment constraint:
% 110.5x + 198.5y <= 12000
y2 = -221/397*x1 + 24000/397;

% Labour constraint:
% 11x + 32y <= 1250
y3 = -11/32*x1 + 625/16;

% Non-negative constraint:
% x, y >= 0

% Objective function:
% Z = max(51.5x + 119.5y)

% Define the feasible region
[X,Y] = meshgrid(x1,0:0.01:15);
cond1 = X+Y<=110;
cond2 = 110.5*X+198.5*Y<=12000;
cond3 = 11*X+32*Y<=1250;
cond4 = X>=0;
cond5 = Y>=0;
Z = cond1 & cond2 & cond3 & cond4 & cond5;

% Plot the feasible region
imagesc(x1, [0 15], Z);
colormap(flipud(gray));

plot(x1, y1, 'g', x1, y2, 'r', x1, y3, 'b')
legend('x+y <= 110', '110.5x + 198.5y <= 12000', '11x + 32y <= 1250');
