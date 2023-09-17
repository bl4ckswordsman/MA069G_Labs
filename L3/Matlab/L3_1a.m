%L3_1a
clc
clear

P = [0.8, 0.15, 0.05;
    0.75, 0.10, 0.15;
    0.5, 0.25, 0.25];

%L3_1b
v0 = [0.1 0.4 0.2];
tol = 1e-5;

err = inf;
while (err > tol)
    v_new = v0*P;
    % Två-normen
    err = norm(v_new - v0);
    v0 = v_new;
end

disp(v0);
