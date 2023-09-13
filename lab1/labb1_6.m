%L1.6
%clc
%clear

F = @(x) (-(cos(x) + x/5));
fp = @(x) (sin(x) - 1/5);

tolerans = 0.5;

% Cornelia Schiebold "NewtonRaphson_med_Visualisering.m"

% VAL AV STARTVÄRDET

x = input('Ange ett startvärde i [-4,4]: ');   

% NEWTON

d = F(x)/fp(x);
xnew = x-d;                 % första iterationen
n = 1;                      % räknare för antalet iterationer initialiseras

x = xnew;

while abs(d) >= tolerans
     
      d = F(x)/fp(x);
      xnew = x-d;           % nästa iteration
      n = n+1;              % räknaren för antalet iterationer höjs med 1 
      x = xnew;
      if n>1000
            disp('För många iterationer. Eventuell oändlig loop. Avbrott')
          break
      end
      
end

fprintf('approximation av nollstället: %s \n',num2str(x,16))  
fprintf('antal genomförda iterationer: %s \n',num2str(n)) 
