%L3_4a
clc
clear

P = [0 1 0;
    0 0 1;
    1 0 0];
v0 = [0.1 0.6 0.3];
tol = 1e-5;
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
    if (it > 1e6)
        % oändlig loop?
        break;
    end
end

disp('Stationär lösning:');
disp(v);

disp(['Toleransnivå: ', num2str(tol)]);
disp(['Antal iterationer: ', num2str(it)]);