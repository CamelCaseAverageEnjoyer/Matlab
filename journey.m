function RV = journey(r0,v0,N, dT)
R_e = 6370e3;
G = 6.67408e-11;
M = 5.972e24;
mu = G*M;
T = zeros(1,N);
X = zeros(1,N);
Y = zeros(1,N);
Z = zeros(1,N);
V_X = zeros(1,N);
V_Y = zeros(1,N);
V_Z = zeros(1,N);
X(1) = r0(1);
Y(1) = r0(2);
Z(1) = r0(3);
V_X(1) = v0(1);
V_Y(1) = v0(2);
V_Z(1) = v0(3);
for i = 1:N
    T(i) = (i-1)*dT;
end

for i = 2:N
    XXX = RungeKutta([V_X(i-1);V_Y(i-1);V_Z(i-1);X(i-1);Y(i-1);Z(i-1)],dT);
    V_X(i)=XXX(1);
    V_Y(i)=XXX(2);
    V_Z(i)=XXX(3);
    X(i)=XXX(4);
    Y(i)=XXX(5);
    Z(i)=XXX(6);
    
end



RV = [X', Y', Z', V_X', V_Y', V_Z', T'];