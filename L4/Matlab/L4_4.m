%% L4_4
clc
clear

x1 = [0:0.1:120];

% Investment constraint:
% 110.5x + 198.5y <= 12000

% Labour constraint:
% 11x + 32y <= 1250

% Non-negative constraint:
% x, y >= 0

% Tax constraint:
% x + y - s <= 50

% s <= 60

% Objective function with extra tax:
% Z = max(51.5x + 119.5y -2s)


% Define the new objective function coefficients
f_new = [-51.5; -119.5; 2]; % Negative because linprog does minimization

% Define the lower and upper bounds for x and y
lb = [0; 0];
ub = [inf; inf];

% Define the new inequality constraints matrix A_new and vector b_new
A_new = [110.5, 198.5, 0;
        11, 32, 0;
        1, 1, -1;
        0, 0, 1];
b_new = [12000; 1250; 50; 60];

% Solve the linear programming problem with the updated objective function and constraints
[x_opt_new, max_profit_new] = linprog(f_new, A_new, b_new, [], [], lb, ub);

% Display the results with the extra tax
fprintf('Optimal Wheat (x) with extra tax: %.2f hectares\n', x_opt_new(1));
fprintf('Optimal Barley (y) with extra tax: %.2f hectares\n', x_opt_new(2));
fprintf('Maximum Profit with extra tax: %.2f krs\n', -(max_profit_new ));