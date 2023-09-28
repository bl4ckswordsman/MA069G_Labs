%L4_4
clc
clear

hold on
axis([0 120 0 40])
x1 = [0:0.1:120];

% Area constraint:
% x + y <= 110
y1 = -x1 + 110;

% Investment constraint:
% 110.5x + 198.5y <= 12000
y2 = (-110.5*x1+12000)/198.5; 

% Labour constraint:
% 11x + 32y <= 1250
y3 = (-11*x1+1250)/32;

% Tax constraint:
% -x + y <= 50

% Non-negative constraint:
% x, y >= 0

% Objective function with extra tax:
% Z = max(51.5x + 119.5y - 2(x-50) - 2(y-50))
% Z = max(49.5x + 117.5y - 200)

%Find intersections
syms t
x23 = solve((-110.5*t+12000)/198.5==(-11*t+1250)/32,0);
y23 = (-110.5*x23+12000)/198.5;
x13 = solve(-t+110==(-11*t+1250)/32,0);
y13 = -x13+110;

% Define the feasible region
[X,Y] = meshgrid(x1,0:0.01:40);
cond1 = X+Y<=110;
cond2 = 110.5*X+198.5*Y<=12000;
cond3 = 11*X+32*Y<=1250;
cond4 = X>=0;
cond5 = Y>=0;
Z = cond1 & cond2 & cond3 & cond4 & cond5;

%Find the largest value of the vertex of the feasible region
%f = @(x,y) -(51.5 - 2*min(x,50)).*x - (119.5 - 2*min(y,50)).*y;
%M=[f(x23,y23), f(13,y13)]
%[max_val,idx]=max(M);
%disp(vpa(max_val(idx),6))

% Plot the feasible region
imagesc(x1, [0 40], Z);
colormap(flipud(gray));

plot(x1, y1, 'g', x1, y2, 'r', x1, y3, 'b', 'LineWidth',2)
plot(x23, y23, 'ro', x13, y13, 'ro')
legend('Land area: x+y <= 110', ...
    'Budget: 110.5x + 198.5y <= 12000', ...
    'Labour: 11x + 32y <= 1250');


% Define the new objective function coefficients
f_new = [-49.5; -117.5]; % Negative because linprog does minimization

% Define the lower and upper bounds for x and y
lb = [0; 0];
ub = [110; 110];

% Define the new inequality constraints matrix A_new and vector b_new
A_new = [110.5, 198.5; 11, 32; 1, 1; -1, 1];
b_new = [12000; 1250; 110; 50];

% Solve the linear programming problem with the updated objective function and constraints
[x_opt_new, max_profit_new] = linprog(f_new, A_new, b_new, [], [], lb, ub);

% Display the results with the extra tax
fprintf('Optimal Wheat (x) with extra tax: %.2f hectares\n', x_opt_new(1));
fprintf('Optimal Barley (y) with extra tax: %.2f hectares\n', x_opt_new(2));
fprintf('Maximum Profit with extra tax: %.2f krs\n', -(max_profit_new - 120));


plot(x_opt_new(1), x_opt_new(2), '*')

hold off