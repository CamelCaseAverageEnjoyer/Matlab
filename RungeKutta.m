function X_1 = RungeKutta(X,h)
k_1 = f_tmp(X);
k_2 = f_tmp(X+h/2*k_1);
k_3 = f_tmp(X+h/2*k_2);
k_4 = f_tmp(X+h*k_3);
X_1 = X + h/6*(k_1 + 2*k_2 + 2*k_3 + k_4);