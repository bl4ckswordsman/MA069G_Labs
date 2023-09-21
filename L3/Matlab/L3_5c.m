%L3_5c
clc
clear

% Definiera ankomst- och serviceintensiteter (enligt problembeskrivningen)
lambda = 0.3; % Ankomstintensitet (kunder per minut)
mu = 0.2; % Serviceintensitet (avslutade ärenden per minut)

% Skapa en nollmatris för övergångsmatrisen (5x5)
P = zeros(5);

% Fyll i sannolikheterna baserat på problemets beskrivning
P(1,2) = lambda; % Från tillstånd 0 till 1
P(2,3) = lambda; % Från tillstånd 1 till 2
P(3,4) = lambda; % Från tillstånd 2 till 3
P(4,4) = lambda; % Från tillstånd 3 till 4 (stannar i samma tillstånd)

P(2,1) = mu; % Från tillstånd 1 till 0 (service av en kund)
P(3,2) = 2 * mu; % Från tillstånd 2 till 1 (service av två kunder)
P(4,3) = 2 * mu; % Från tillstånd 3 till 2 (service av två kunder)

% Sätt sannolikheten att stanna i samma tillstånd
for i = 1:5
    P(i,i) = 1 - sum(P(i,:)); 
end

disp('Övergångsmatrisen:');
disp(P);
