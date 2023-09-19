%L3_3
clc
clear

P = [0.8, 0.15, 0.05;
    0.10, 0.75, 0.15;
    0.25, 0.25, 0.5];

it_count = 1e4;
f = [0, 0, 0];
k = randi([1,3]);

for i = 1:it_count
    % Beräkna nästa tillstånd baserat på nuvarande tillstånd k
    next_state = randsample(1:3, 1, true, P(k,:));
    
    % Uppdatera frekvensen för nästa tillstånd
    f(next_state) = f(next_state) + 1;
    
    % Uppdatera nuvarande tillstånd k
    k = next_state;
end

% Beräkna de relativa frekvenserna
rel_freq = f / sum(f);

disp('Stationära sannolikheter efter Monte Carlo-simulering:');
disp(rel_freq);