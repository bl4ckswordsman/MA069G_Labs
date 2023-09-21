%L3_4a
clc
clear

%a) Periodisk Markov kedja
P = [0 1 0;
     0 0 1;
     1 0 0];

%L3_4b
%b) Reducibel stokastisk process
%(Två kedjor 1->2->3->4->1 och 1->2->3->4->1
% som inte kan nå varandra)
P2 = [0 1 0 0;
      0 0 1 0;
      0 0 0 1;
      1 0 0 0];

%L3_4c
%c) Icke-minnesfri process
P3 = [0.8 0.2; 0.3 0.7];
