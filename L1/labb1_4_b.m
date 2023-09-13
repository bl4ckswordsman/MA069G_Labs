%L1.4 b
clc
clear

f = str2sym('((sqrt((x-5)^5) + 2*cos(pi*sqrt(x))) / (sqrt(x+4*log(x-pi))-1))');

f_prim = diff(f);
f_biss = diff(f_prim);


x = 7; % punkten x = x_0
f_prim_x_0 = subs(f_prim); % värdet på derivatan i x = x_0

f_biss_x_0 = subs(f_biss)