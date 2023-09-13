
clear
clc
format long

n = 10; %antal kast per medelv�rde
N = [10^3 10^4 10^5]; %antal upprepningar
for i=1:length(N)
    figure;
    hold on
    r = zeros(1,N(i));
    for j=1:N(i)
        y = floor(1+6*rand(1,n));
        r(j) = mean(y);
    end
    hist(r,100); % Rita ett histogram med 100 intervall
    title([num2str(n),' st kast per medelv�rde med ', num2str(N(i)), ' upprepningar'])
    xlabel('Medelv�rden')
    ylabel('Frekvensen')
    shg

end
