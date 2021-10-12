function X = sat_mass()

v_1 = 1000;
v_2 = 10000;
N = 50;
m_p = 500;
%V = zeros(1,N);
I = 9.81*321;
%M = zeros(1,N);
%M_real = zeros(1,N);
%M_f = zeros(1,N);
dV = 0;

M_pol = 10+37+5+15+13+8+15+16+2+2.7+1.7;
M_pol = 150; %Приблизительный вариант
M_sluzh = 2100*0.875*2.65 + 2*110 + 4.3 + 10 + 10 + 800;
M_sluzh = 6000; %Приблизительный вариант
M_fuel = 2100*0.875*2.65 + 777;
m_all = M_sluzh + M_pol+500;
m_clean = m_all - M_fuel;
%% Самый большой хер
m_tank = 110  ; 
v_tank = 2100 %litres;
m_fuel = v_tank*0.875;
%% Средний добрячок
%m_tank = 61  ;
%v_tank = 1450; %litres;
%m_fuel = v_tank*0.875;
%% Мелкий хер
%m_tank = 31.7  ;
%v_tank = 769 %litres;
%m_fuel = v_tank*0.875;


m = m_p + 2*m_tank;
%for i = 1:N
   %V(i) = v_1 + (v_2 - v_1)/(N-1)*(i-1);
   %M(i) = m*exp(V(i)/I) - 1;
   %M_real(i) = m + 2.65*m_fuel;
   %M_f(i) = 2*m_fuel;
%end

dV = I*log(m_all/m_clean);

X = [m_all, m_clean, dV];