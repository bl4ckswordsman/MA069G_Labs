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
% Här beräknas nollrummet för matrisen P' - eye(5),
%  där P är en 5x5 matris. P' betyder transponeringen av P,
%  och eye(5) är en 5x5 identitetsmatris 
% Nollrummet för en matris är mängden av alla vektorer som
%  multiplicerat med matrisen ger nollvektorn. Resultatet
%  av denna operation är en vektor pi som innehåller stationära
%  fördelningar för en Markov-kedja.
pi = null(P' - eye(5));
pi = pi / sum(pi); % Normalisera för att få en sannolikhetsfördelning
disp('Den stationära fördelningen:');
disp(pi);

%L3_5e
%riktat medelvärde
% Beräkna det genomsnittliga antalet kunder i butiken (L)
L = sum((0:4) .* pi);
disp(['Genomsnittligt antal kunder i butiken: ' num2str(L)]);