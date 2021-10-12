function AMADEUS()
%% Константы
I = 9.81*321;


%% Масса сухой нагрузки
M_polezn = 0;
%M_polezn = M_polezn + 0; % Узкоугольная камера
%M_polezn = M_polezn + 0; % Широкоугольная камера
M_polezn = M_polezn + 10; % УФ-спектрограф
M_polezn = M_polezn + 37; % ИК-спектрограф
M_polezn = M_polezn + 5; % Магнитометр
M_polezn = M_polezn + 15; % Детектор радиоволн
M_polezn = M_polezn + 13; % Плазма-спектрометр
M_polezn = M_polezn + 8; % Лазерный альтиметр
M_polezn = M_polezn + 16; % Детектор высокоэнергетических частиц

M_polezn = M_polezn + 15; % Узкоправленная антенна
%M_polezn = M_polezn + 0; % Ненаправленная антенна
%M_polezn = M_polezn + 0; % Звёздные датчики
%M_polezn = M_polezn + 0; % Маховики
%M_polezn = M_polezn + 0; % 


%M_polezn = M_polezn + 0; % Зонд


M_sluzhebn = 0;
M_sluzhebn = M_sluzhebn + 2*50; % РТГ
M_sluzhebn = M_sluzhebn + 15*0.04; % РНБ
M_sluzhebn = M_sluzhebn + 2*110 + 6.4; % Баки
%M_sluzhebn = M_sluzhebn + 0; % Двигатели, клапаны



%M_skelet = (M_polezn + M_sluzhebn)/0.5;
M_skelet = M_polezn/0.3;


%% Масса полного аппарата
% Самый большой хер
m_tank = 110  ; 
v_tank = 2100; %litres;
m_fuel = v_tank*0.875*2.65;
% Средний добрячок
%m_tank = 61  ;
%v_tank = 1450; %litres;
%m_fuel = v_tank*0.875;

m_all = M_sluzhebn + M_polezn + m_fuel + M_skelet
m_clean = m_all - m_fuel
dV = I*log(m_all/m_clean)


%% Камеры
L_pix_N = 10000;
L_pix_T = 100;
disp('___________________WIDE CAMERAS');

disp('Mastcam-Z');
pix = 1200;
angle = 19.1;
H_N = 5*L_pix_N/sin(angle*pi/180/pix)/1000

disp('RadCam');
pix = 1000;
angle = 92;
H_N = 5*L_pix_N/sin(angle*pi/180/pix)/1000


disp('___________________NARROW CAMERAS');

disp('LROC');
H_N = L_pix_N/0.5*50

disp('Dragon Fly');
H_N = L_pix_N/1.4*500

disp('Mastcam-Z');
pix = 1200;
angle = 4.6;
H_N = L_pix_N/sin(angle*pi/180/pix)/1000

%% Температурные режимы

disp('____________TANKS');
P_lim = 25;
P_proof = 31.25;
T_simp = 40+273;
T_proof = T_simp/P_lim*P_proof - 273
P_work = P_lim/T_simp*(15+273)

%% Передача информации





end