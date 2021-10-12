clc
clear all
close all

syms x y z vx vy vz omega t a b m_sat m R h

R = 6370e3 + h;

c1_sat = 2*z + vx/omega;
c2_sat = vz/omega*cos(omega*t) - (2*vx/omega + 3*z)*sin(omega*t);
c3_sat = -vz/omega*sin(omega*t) - (2*vx/omega + 3*z)*cos(omega*t);
c4_sat = x - 2*vz/omega + 3*omega*(vx/omega + 3*z)*t;
c5_sat = y*sin(omega*t) + vy/omega*cos(omega*t);
c6_sat = y*cos(omega*t) - vy/omega*sin(omega*t);
t = 0; 
x = -a; 
%z = R; 
z = 0; 
y = 0;
c1_sat = subs(c1_sat);
c2_sat = subs(c2_sat);
c3_sat = subs(c3_sat);
c4_sat = subs(c4_sat);
c5_sat = subs(c5_sat);
c6_sat = subs(c6_sat);

syms t x z y

c1_station = 2*z + (-vx*m_sat/m)/omega;
c2_station = (-vz*m_sat/m)/omega*cos(omega*t) - (2*(-vx*m_sat/m)/omega + 3*z)*sin(omega*t);
c3_station = -(-vz*m_sat/m)/omega*sin(omega*t) - (2*(-vx*m_sat/m)/omega + 3*z)*cos(omega*t);
c4_station = x - 2*(-vz*m_sat/m)/omega + 3*omega*((-vx*m_sat/m)/omega + 3*z)*t;
c5_station = y*sin(omega*t) + (-vy*m_sat/m)/omega*cos(omega*t);
c6_station = y*cos(omega*t) - (-vy*m_sat/m)/omega*sin(omega*t);
%c1_station = 2*z + (vx*m_sat/m)/omega;
%c2_station = (vz*m_sat/m)/omega*cos(omega*t) - (2*(vx*m_sat/m)/omega + 3*z)*sin(omega*t);
%c3_station = -(vz*m_sat/m)/omega*sin(omega*t) - (2*(vx*m_sat/m)/omega + 3*z)*cos(omega*t);
%c4_station = x - 2*(vz*m_sat/m)/omega + 3*omega*((vx*m_sat/m)/omega + 3*z)*t;
%c5_station = y*sin(omega*t) + (vy*m_sat/m)/omega*cos(omega*t);
%c6_station = y*cos(omega*t) - (vy*m_sat/m)/omega*sin(omega*t);
t = 0; 
x = b; 
%z = R; 
z = 0;
y = 0;
c1_station = subs(c1_station);
c2_station = subs(c2_station);
c3_station = subs(c3_station);
c4_station = subs(c4_station);
c5_station = subs(c5_station);
c6_station = subs(c6_station);

syms t x z y

x_hkw_sat = -3*c1_sat*omega*t + 2*c2_sat*cos(omega*t) - 2*c3_sat*sin(omega*t) + c4_sat
y_hkw_sat = c5_sat*sin(omega*t) + c6_sat*cos(omega*t)
z_hkw_sat = 2*c1_sat + c2_sat*sin(omega*t) + c3_sat*cos(omega*t)

x_hkw_station = -3*c1_station*omega*t + 2*c2_station*cos(omega*t) - 2*c3_station*sin(omega*t) + c4_station
y_hkw_station = c5_station*sin(omega*t) + c6_station*cos(omega*t)
z_hkw_station = 2*c1_station + c2_station*sin(omega*t) + c3_station*cos(omega*t)

func = [x_hkw_station-x_hkw_sat;y_hkw_station-y_hkw_sat;z_hkw_station-z_hkw_sat];
S=solve(func,vx,vy,vz);
S.vx
S.vy
S.vz
