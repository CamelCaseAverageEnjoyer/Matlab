function X = simple_2sat_HKW()
%% Constans
m_sat = 10;
m = 50;
R_earth = 6370e3;
h = 400e3;
r = R_earth + h;
M_earth = 5.9742e24;
G = 6.67408e-11;
mu = G*M_earth/R_earth;
omega = sqrt(mu/r^3);

l = 4; % meter
b = l/(m/m_sat + 1);
a = l - b;

%% Strike it!

tt = [1:1:100];
N_t = length(tt);
dV = zeros(1,N_t);

hold on;
for i = 1:N_t
    t = tt(i);
    %vx = (m*omega*(a*sin(omega*t) + b*sin(omega*t)))/((m + m_sat)*(4*cos(omega*t)^2 - 8*cos(omega*t) + 4*sin(omega*t)^2 - 3*omega*t*sin(omega*t) + 4));
    %vy = 0;
    %vz = (2*m*omega*(cos(omega*t) - 1)*(a + b))/(4*m + 4*m_sat - 8*m*cos(omega*t) - 8*m_sat*cos(omega*t) + 4*m*cos(omega*t)^2 + 4*m_sat*cos(omega*t)^2 + 4*m*sin(omega*t)^2 + 4*m_sat*sin(omega*t)^2 - 3*m*omega*t*sin(omega*t) - 3*m_sat*omega*t*sin(omega*t));
    vx = (m*omega*(a*sin(omega*t) + b*sin(omega*t)))/((m + m_sat)*(4*cos(omega*t)^2 - 8*cos(omega*t) + 4*sin(omega*t)^2 - 3*omega*t*sin(omega*t) + 4));
    vy = 0;
    vz = (2*m*omega*(cos(omega*t) - 1)*(a + b))/(4*m + 4*m_sat - 8*m*cos(omega*t) - 8*m_sat*cos(omega*t) + 4*m*cos(omega*t)^2 + 4*m_sat*cos(omega*t)^2 + 4*m*sin(omega*t)^2 + 4*m_sat*sin(omega*t)^2 - 3*m*omega*t*sin(omega*t) - 3*m_sat*omega*t*sin(omega*t));
    dV(i) = sqrt(vx^2 + vy^2 + vz^2);
    N_for_plot = 100;
    t_for_plot = 0:(t/(N_for_plot-1)):t;
    R_sat = zeros(N_for_plot,3);
    R_station = zeros(N_for_plot,3);
    for j = 1:N_for_plot
        t = t_for_plot(j);
        %R_sat(j,1) = sin(omega*t)*(6*h + (4*vx)/omega + 38220000) - (2*vz)/omega - a - omega*t*(6*h + (3*vx)/omega + 38220000) + (2*vz*cos(omega*t))/omega;
        %R_sat(j,2) = (vy*sin(omega*t))/omega;
        %R_sat(j,3) = 4*h + (2*vx)/omega - cos(omega*t)*(3*h + (2*vx)/omega + 19110000) + (vz*sin(omega*t))/omega + 25480000;
        %R_station(j,1) = b + sin(omega*t)*(6*h - (4*m_sat*vx)/(m*omega) + 38220000) - omega*t*(6*h - (3*m_sat*vx)/(m*omega) + 38220000) + (2*m_sat*vz)/(m*omega) - (2*m_sat*vz*cos(omega*t))/(m*omega);
        %R_station(j,2) = -(m_sat*vy*sin(omega*t))/(m*omega);
        %R_station(j,3) = 4*h - cos(omega*t)*(3*h - (2*m_sat*vx)/(m*omega) + 19110000) - (2*m_sat*vx)/(m*omega) - (m_sat*vz*sin(omega*t))/(m*omega) + 25480000;
        R_sat(j,1) = (2*vz*cos(omega*t))/omega - 3*t*vx - (2*vz)/omega - a + (4*vx*sin(omega*t))/omega;
        R_sat(j,2) = (vy*sin(omega*t))/omega;
        R_sat(j,3) = (2*vx)/omega - (2*vx*cos(omega*t))/omega + (vz*sin(omega*t))/omega;
        R_station(j,1) = b + (3*m_sat*t*vx)/m + (2*m_sat*vz)/(m*omega) - (2*m_sat*vz*cos(omega*t))/(m*omega) - (4*m_sat*vx*sin(omega*t))/(m*omega);
        R_station(j,2) = -(m_sat*vy*sin(omega*t))/(m*omega);
        R_station(j,3) = (2*m_sat*vx*cos(omega*t))/(m*omega) - (2*m_sat*vx)/(m*omega) - (m_sat*vz*sin(omega*t))/(m*omega);
    
    end
    plot(R_sat(:,1),R_sat(:,3),'c');
    plot(R_station(:,1),R_station(:,3),'m');
end
hold off;

X = [tt', dV'];

%% Goot trajectories

    %vx = 
    %vy = 
    %vz = 

        %R_sat(j,1) = 
        %R_sat(j,2) = 
        %R_sat(j,3) = 
        %R_station(j,1) = 
        %R_station(j,2) = 
        %R_station(j,3) = 
        