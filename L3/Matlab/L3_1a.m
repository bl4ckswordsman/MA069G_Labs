%L3_1a
clc
clear

P = [0.8, 0.15, 0.05;
    0.75, 0.10, 0.15;
    0.5, 0.25, 0.25];

%L3_1b
v0 = [0.1 0.1 0.2];
tol = 1e-6;
v = v0;

err = inf;
it = 0;
while (err > tol)
    v_new = v*P;
    % Ett-normen
    err = norm(v_new - v, 1);
    % Två-normen
    %err = norm(v_new - v, 2);
    v = v_new;
    it = it + 1;
end

disp('Stationär lösning:');
disp(v);
%L3_1c
disp(['Toleransnivå: ', num2str(tol)]);
disp(['Antal iterationer: ', num2str(it)]);

%Startvektorn har betyd. för stat.result -> ergodisk
%Startvekt. påverkar konvergenstiden
