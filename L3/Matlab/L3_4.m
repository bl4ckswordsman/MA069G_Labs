%L3_4a
clc
clear

%a) Periodisk Markov kedja
P = [0 1 0;
     0 0 1;
     1 0 0];

%L3_4b
%b) Reducibel stokastisk process
P2 = [0.8   0.1     0.1;
      0.15  0.75    0.1;
      0     0       1];

%L3_4c
%c) Icke-minnesfri process
% En icke-minnesfri process innebär att övergångssannolikheterna påverkas
% av det tidigare tillståndet. Till exempel kan om man var i Bull förra
% veckan, sannolikheten att vara i Bull denna vecka vara högre än om man
% var i Recession förra veckan. Detta innebär att övergångssannolikheterna
% varierar baserat på historiken, vilket strider mot Markov-egenskapen som
% säger att framtiden endast beror på nuet och inte på det förflutna.
