function J = call_inertion(M_all, tmp_mass, X)
J = zeros(3,3);

N_points_m = 10;
N = length(X(:,1));
N_m = N_points_m*N;
m = zeros(1, N_m);
r = zeros(N_m, 3);

%% Mass and {x,y,z} distribution
for n = 1 : N
    if (X(12,n) + X(13,n))> 0
        x_1 = X(6,n);
        y_1 = X(7,n);
        z_1 = X(8,n);
        x_2 = X(9,n);
        y_2 = X(10,n);
        z_2 = X(11,n);
    else
        x_1 = 0;
        y_1 = 0;
        z_1 = 0;
        x_2 = -X(3,n);
        y_2 = 0;
        z_2 = 0;
    end
    for i = 1 : N_points_m
        m((n-1)*N_points_m + i) = X(2,n)/N_points_m;
        r((n-1)*N_points_m + i, 1) = x_1 + (x_2-x_1)*(i-1)/N_points_m;
        r((n-1)*N_points_m + i, 1) = y_1 + (y_2-y_1)*(i-1)/N_points_m;
        r((n-1)*N_points_m + i, 1) = z_1 + (z_2-z_1)*(i-1)/N_points_m;
    end
end

%% Calc center of mass and correct {x}
tmp_chislitel = 0;
tmp_znamenatel = 0;
for k = 1 : N_m
    tmp_chislitel = tmp_chislitel + r(k,1);
    tmp_znamenatel = tmp_znamenatel + m(k);
end
x_center_mass = tmp_chislitel/tmp_znamenatel;
for k = 1 : N_m
    r(k,1) = r(k,1) - x_center_mass;
end


%% Calc inertion tensor
for k = 1 : N_m
    for i = 1 : 3
        for j = 1 : 3
            J(i,j) = J(i,j) + m(k)*(kronoker(i,j)*sqrt(r(k,1)^2+r(k,2)^2+r(k,3)^2) - r(k,i)*r(k,j));
        end
    end
end
