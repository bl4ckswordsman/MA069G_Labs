function [slumptal] = DemoNormalf(N, medel, varians)
% Anrop: s = DemoNormalf(N, m, v);
% Funktionen skapar N st slumptal ur normalf�rdelning, med v�ntev�rde 
% (medelv�rde) m och varians v. Om m och/eller v utel�mnas anv�nds 
% defultv�rdena m = 0, v = 1.
% m alternativt v kan vara vektorer - funktionen ber�knar slumptal
% f�r varje v�rde p� m alternativt v och ritar flera figurer. B�de v och m
% kan inte ges som vektorer samtidigt. 
% Funktionen ritar dels upp slumptalen och skapar ett histogram med 
% 100 staplar, d�r staplarnas h�jd anger antalet slumptal i respektive
% stapels intervall.
% Exempel:
% DemoNormalf(500); => 500 slumptal, v�ntev�rde 0, varians 1
% s = DemoNormalf(100, 5, 3); => 100 slumptal, v�ntev�rde 5, varians 3. 
%                                Slumptalen lagras i s
% DemoNormalf(100, [0 10], 5); => 100 slumptal med v�ntev�rde 0 respektive
%                                 10, varians 5 i b�da fallen

if nargin < 3
    varians = 1;
end
if nargin < 2
    medel = 0;
end
close all;         % St�ng alla eventuella grafikf�nster

% Ber�kna slumptalen
if (length(medel)) == 1 & (length(varians) == 1)
   slumptal = medel + sqrt(varians)*randn(N,1); 
elseif (length(medel)) > 1 & (length(varians) == 1)
   for i = 1:length(medel)
       slumptal(:,i) = medel(i) + sqrt(varians)*randn(N,1);
   end
   varians = repmat(varians,1,length(medel));
elseif (length(medel)) == 1 & (length(varians) > 1)
   for i = 1:length(varians)
       slumptal(:,i) = medel + sqrt(varians(i))*randn(N,1);    
   end
   medel = repmat(medel,1,length(varians));
else
    error('Ej till�tet att ge flera varianser och flera v�ntev�rden samtidigt.');
end

% Utskrift
for i=1:max([length(medel) length(varians)])
    titelstr = [num2str(N), ' slumptal ur normalf�rdelning. Medelv�rde = ',...
    num2str(medel(i)), ' varians = ' num2str(varians(i))];
    figure('Name',titelstr,'NumberTitle','off');
    subplot(2,1,1);
    plot(slumptal(:,i),'ro');
    subplot(2,1,2);
    title('Histogram �ver antal element i respektive stapel');
    hist(slumptal(:,i),100);
end