function HKW(X)
% X = [R', V']'
M_earth = 5e24; %???????
R_earh = 6370e3;
G = 1; %??????????
mu = G*M_earth/R_earh;
r = sqrt(X(1)^2 + X(2)^2 + X(3)^2);
omega = sqrt(mu/r^3);

t = [0:1:1000];