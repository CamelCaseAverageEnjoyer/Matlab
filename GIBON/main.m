function main()
%% Initialization X
N = 11;
N_nodes = 7;
r = zeros(N_nodes,3);
r(1,1) = 0; r(1,2) = 0; r(1,3) = 0;
r(2,1) = 3; r(2,2) = 0; r(2,3) = 5;
r(3,1) = 3; r(3,2) = 0; r(3,3) = -3;
r(4,1) = 6; r(4,2) = 0; r(4,3) = 2;
r(5,1) = 6; r(5,2) = 0; r(5,3) = -5;
r(6,1) = 11; r(6,2) = 0; r(6,3) = 5;
r(7,1) = 18; r(7,2) = 0; r(7,3) = 0;
m_initial = 6;
% X =  id | mass | length | id_node_1 | id_node_2 | x1 | y1 | z1 | x2 | y2 | z2 | flag_1 | flag_2
X = [1,m_initial, 0,   1, 2,     r(1,1),r(1,2),r(1,3),    r(2,1),r(2,2),r(2,3),     0, 0;
    2, m_initial, 0,   1, 3,     r(1,1),r(1,2),r(1,3),    r(3,1),r(3,2),r(3,3),     0, 0;
    3, m_initial, 0,   2, 3,     r(2,1),r(2,2),r(2,3),    r(3,1),r(3,2),r(3,3),     0, 0;
    4, m_initial, 0,   2, 4,     r(2,1),r(2,2),r(2,3),    r(4,1),r(4,2),r(4,3),     0, 0;
    5, m_initial, 0,   3, 4,     r(3,1),r(3,2),r(3,3),    r(4,1),r(4,2),r(4,3),     0, 0;
    6, m_initial, 0,   3, 5,     r(3,1),r(3,2),r(3,3),    r(5,1),r(5,2),r(5,3),     0, 0;
    7, m_initial, 0,   4, 5,     r(4,1),r(4,2),r(4,3),    r(5,1),r(5,2),r(5,3),     0, 0;
    8, m_initial, 0,   4, 6,     r(4,1),r(4,2),r(4,3),    r(6,1),r(6,2),r(6,3),     0, 0;
    9, m_initial, 0,   5, 6,     r(5,1),r(5,2),r(5,3),    r(6,1),r(6,2),r(6,3),     0, 0;
    10,m_initial, 0,   5, 7,     r(5,1),r(5,2),r(5,3),    r(7,1),r(7,2),r(7,3),     0, 0;
    11,m_initial, 0,   6, 7,     r(6,1),r(6,2),r(6,3),    r(7,1),r(7,2),r(7,3),     0, 0];

hold on;
for i = 1 : N
    % Calc lenght of lines
    X(i,3) = sqrt((r(X(i,4),1)-r(X(i,5),1))^2 + (r(X(i,4),2)-r(X(i,5),2))^2 + (r(X(i,4),3)-r(X(i,5),3))^2);
    % Ready construction, Oxz
    plot([r(X(i,4),1),r(X(i,5),1)], [r(X(i,4),3),r(X(i,5),3)], 'c');
end
hold off;

%% Iteration is frozen = 1
%for iter = 1 to N
hold on;
for i = 1 : N
    % Ready construction, Oxz
    if (X(i,12) + X(i,13))> 0
        x_1 = X(i,6);
        y_1 = X(i,7);
        z_1 = X(i,8);
        x_2 = X(i,9);
        y_2 = X(i,10);
        z_2 = X(i,11);
    else
        x_1 = 0;
        y_1 = 0;
        z_1 = 0;
        x_2 = -X(i,3);
        y_2 = 0;
        z_2 = 0;
    end
    plot([x_1,x_2], [z_1,z_2], 'm');
end
hold off;




%% Possible transoprt



%% Matrix S {spacecraft -> orbit}
%T = T + t
