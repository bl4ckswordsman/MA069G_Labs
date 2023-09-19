%L3_2
clc
clear

P = [0.8, 0.15, 0.05;
    0.10, 0.75, 0.15;
    0.25, 0.25, 0.5];

%1. Wolfram Alpha:
% P={{0.8,0.15,0.05},{0.75,0.10,0.15},{0.5, 0.25, 0.25}}, x = {0.5, 0.25, 0.25}
%solve x1+x2+x3=1,
%x1=0.8x1+0.75x2+0.5x3,
%x2=0.15x1+0.1x2+0.25x3,
%x3=0.05x1+0.15x2+0.25*x3

%1. eig funkt. för egenvärde och egenvekt.
%[V, D] = eig(P');
%stationar_losning = V(:,1) / sum(V(:,1));

%2. Vänster matrisdivision
%A = P' - eye(size(P));
%b = zeros(size(P, 1), 1);
%stationar_losning = A \ b;
%stationar_losning = stationar_losning / sum(stationar_losning);

%3. Symboliska beräkningar:
syms x1 x2 x3;
eq1 = x1 * P(1,1) + x2 * P(2,1) + x3 * P(3,1) == x1;
eq2 = x1 * P(1,2) + x2 * P(2,2) + x3 * P(3,2) == x2;
eq3 = x1 * P(1,3) + x2 * P(2,3) + x3 * P(3,3) == x3;
eq4 = x1 + x2 + x3 == 1;

solution = solve([eq1, eq2, eq3, eq4], [x1, x2, x3]);
stationar_losning = [solution.x1, solution.x2, solution.x3];

disp(vpa(stationar_losning,6));