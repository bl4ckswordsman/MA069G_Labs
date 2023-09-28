%L4_1
clc
clear

hold on
axis([95 120 0 15])
x1 = [95:0.1:120];

% Area constraint:
% x + y <= 110
y1 = -x1 + 110;

% Investment constraint:
% 110.5x + 198.5y <= 12000
y2 = (-110.5*x1+12000)/198.5; 

% Labour constraint:
% 11x + 32y <= 1250
y3 = (-11*x1+1250)/32;

% Non-negative constraint:
% x, y >= 0

% Objective function:
% Z = max(51.5x + 119.5y)

%Find intersections
syms t
x23 = solve((-110.5*t+12000)/198.5==(-11*t+1250)/32,0);
y23 = (-110.5*x23+12000)/198.5;
x13 = solve(-t+110==(-11*t+1250)/32,0);
y13 = -x13+110;

% Define the feasible region
[X,Y] = meshgrid(x1,0:0.01:15);
cond1 = X+Y<=110;
cond2 = 110.5*X+198.5*Y<=12000;
cond3 = 11*X+32*Y<=1250;
cond4 = X>=0;
cond5 = Y>=0;
Z = cond1 & cond2 & cond3 & cond4 & cond5;

%Find the largest value of the vertex of the feasible region
f=@(x,y) 51.5.*x + 119.5.*y;
M=[f(x23,y23), f(13,y13)]
[max_val,idx]=max(M);
disp(vpa(max_val(idx),6))

% Plot the feasible region
imagesc(x1, [0 15], Z);
colormap(flipud(gray));

plot(x1, y1, 'g', x1, y2, 'r', x1, y3, 'b', 'LineWidth',2)
plot(x23, y23, 'ro', x13, y13, 'ro')
legend('Land area: x+y <= 110', ...
    'Budget: 110.5x + 198.5y <= 12000', ...
    'Labour: 11x + 32y <= 1250');


% Define the objective function coefficients
f = [-51.5; -119.5]; % Negative because linprog does minimization

% Define the inequality constraints matrix A and vector b
A = [110.5, 198.5; 11, 32; 1, 1];
b = [12000; 1250; 110];

% Define the lower and upper bounds for x and y
lb = [0; 0];
ub = [110; 110];

% Solve the linear programming problem
[x_opt, max_profit] = linprog(f, A, b, [], [], lb, ub);

% Display the results
fprintf('Optimal Wheat (x): %.2f hectares\n', x_opt(1));
fprintf('Optimal Barley (y): %.2f hectares\n', x_opt(2));
fprintf('Maximum Profit: %.2f krs\n', -max_profit);

plot(x_opt(1), x_opt(2), '*')

hold off
