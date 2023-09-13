%L2_2d
clear
clc
format long

n = 200; %antal kast per medelvärde
N = [10^5]; %antal upprepningar
for i=1:length(N)
    figure;
    hold on
    r = zeros(1,N(i));
    for j=1:N(i)
        y = floor(1+6*rand(1,n));
        r(j) = mean(y);
    end
    hist(r,100); % Rita ett histogram med 100 intervall
    title([num2str(n),' st kast per medelvärde med ', num2str(N(i)), ' upprepningar'])
    xlabel('Medelvärden')
    ylabel('Frekvensen')
    shg

end

hold on

x = 3.2:0.01:3.8;
mu = 3.5;
sigma = sqrt(35/(12*n)); 
f = @(x) (1/(sigma * sqrt(2*pi))) * exp(-(x-mu).^2 / (2*sigma^2));
plot(x,1000*f(x))