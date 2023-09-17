%L3_1a
clc
clear

P = [0.8, 0.15, 0.05;
    0.75, 0.10, 0.15;
    0.5, 0.25, 0.25];

%L3_1b
v0 = [0.2 0.3 0.5];
tol = 1e-6;

err = inf;
it = 0;
while (err > tol)
    v_new = v0*P;
    % Två-normen
    err = norm(v_new - v0);
    v0 = v_new;
    it = it + 1;
end

disp(v0);
%L3_1c
disp(['Toleransnivå: ', num2str(tol)]);
disp(['Antal iterationer: ', num2str(it)]);

%Startvektorn har ingen betyd. för stat.result -> ergodisk

