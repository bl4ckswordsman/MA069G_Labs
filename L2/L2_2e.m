%L2_2e
clear
clc


p = [0.46 0.27 0.35 0.4 0.3 0.8];

p = p / sum(p);
F = cumsum(p);

n = 10000; % Antal slumptal att generera
u = rand(1, n); % Slumptal mellan 0 och 1
%u = u *0.5;

% Använd inverse transform sampling för att generera fördelade slumptal
samples = sum(u < F') + 1;
samp_r = flip(samples);

% Define custom bins
bin_edges = 1.5:7.5;

figure;
%histogram(samples-1, 'Normalization', 'probability', 'EdgeColor', 'w');

hist(samples-1,6);
hold on;
stem( p, 'r', 'LineWidth', 1.5);
xlabel('Utfall');
ylabel('Sannolikhet');
legend('Simulerad Fördelning', 'Teoretisk Fördelning');