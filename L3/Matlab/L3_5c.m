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
P(4,5) = lambda; % Från tillstånd 3 till 4 (stannar i samma tillstånd)

P(2,1) = mu; % Från tillstånd 1 till 0 (service av en kund)
P(3,2) = 2 * mu; % Från tillstånd 2 till 1 (service av två kunder)
P(4,3) = 2 * mu; % Från tillstånd 3 till 2 (service av två kunder)
P(5,4) = 2 * mu;

% Sätt sannolikheten att stanna i samma tillstånd
for i = 1:5
    P(i,i) = 1 - sum(P(i,:)); 
end

disp('Övergångsmatrisen:');
disp(P);


%L3_5d
Q = P - eye(5); % Skapa Q-matrisen
Q(:,5) = ones(5,1); % Lägg till kolumn med 1:or för balansekvationen
b = zeros(5,1); 
b(5) = 1; % Högerledet i balansekvationen
pi = Q \ b; % Lös Q*pi = 
