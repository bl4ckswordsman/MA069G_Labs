function [] = DemoLikformf(N, r)
% Anrop: DemoLikformf(N, r);
% Funktionen skapar och ritar upp N st slumptal ur likformig f�rdelning p� 
% intervallet [0 r]. Om r utel�mnas anv�nds intervallet [0 1]. 
% Om n �r en vektor skapas flera figurer med olika antal slumptal i varje
% figur. Anropet DemoLikformf([10 10 100]) skapar t ex 3 figurer d�r 2
% av figurerna inneh�ller 10 slumptal och 1 figur inne�ller 100 slumptal.
% 

if nargin < 2
    r = 1;
end
close all;         % St�ng alla eventuella grafikf�nster


for i = 1:length(N)
    % Ber�kna slumptalen
    slumptal = r*rand(N(i),1);
    
    % Plottning
    titelstr = [num2str(N(i)), ' slumptal ur likformig f�rdelning.'];
    figure('Name',titelstr,'NumberTitle','off');
    subplot(2,1,1);
    plot(slumptal,'ro');
    subplot(2,1,2);
    title('Histogram �ver antal element i respektive stapel');
    hist(slumptal,100);
end