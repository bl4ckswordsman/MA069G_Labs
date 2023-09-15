%L2_4
clc
clear

%bs = blackjacksim(100);

total = 0;
balance = zeros(1, 365);
% Loop over 365 days
for day = 1:365
    bs = blackjacksim(100);
    daily = bs(end);
    total = total + daily;
    balance(day) = total;
end
plot(balance);
%plot(cumsum(bs));
disp(['Total vinst/förlust: ', num2str(total), ' kr.'])