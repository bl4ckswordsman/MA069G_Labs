%L2_2e
clear
clc


p = [0.46 0.27 0.35 0.4 0.3 0.8];

p = p / sum(p);
F = cumsum(p);

n = 10000; % Antal slumptal att generera
u = rand(1, n); % Slumptal mellan 0 och 1

% inverse transform sampling
samples = sum(u > F') + 1;

figure;
histogram(samples, 'Normalization', 'probability', 'EdgeColor', 'w');

%hist(samples-1,6);
hold on;
stem( p, 'r', 'LineWidth', 1.5);
xlabel('Utfall');
ylabel('Sannolikhet');
legend('Simulerad Fördelning', 'Teoretisk Fördelning');