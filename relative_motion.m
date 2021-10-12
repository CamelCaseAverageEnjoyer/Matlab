function relative_motion()
%% Initialize
 N = 100000;
 dT = 10;
 R_e = 6370e3;
 RV_1 = journey([R_e+1e6,0,0],[0,7e3,2e3],N,dT);
 RV_2 = journey([-R_e-1e6,0,0],[0,-7.9e3,-1.85e3],N,dT);
    
    
    
%% Relative in the end of iterations
RV_tmp = RV_1(N,:)';
V = RV_tmp(4:6);
R = RV_tmp(1:3); 
tmp = cross(R,V);
%A = [V/norm(V), tmp/norm(tmp), R/norm(R)];
A = [cross(tmp/norm(tmp),R/norm(R)), tmp/norm(tmp), R/norm(R)];

R_1=RV_1(:,1:3);
R_2=RV_2(:,1:3);
R_1_0 = R_1*A;
R_2_0 = R_2*A;


%% Graphics
grid on;
subplot(1,2,1);
[X_s,Y_s,Z_s]=sphere(40);
mesh(X_s*R_e,Y_s*R_e,Z_s*R_e);
hold on;
plot3(R_1(:,1),R_1(:,2),R_1(:,3));
plot3(R_2(:,1),R_2(:,2),R_2(:,3));
AX = 1e7;
axis([-AX AX -AX AX -AX AX]);
grid on;
hold off;


%subplot(1,3,2);
%scatter3([R_1_0(N,1);R_2_0(N,1)], [R_1_0(N,2);R_2_0(N,2)], [R_1_0(N,3);R_2_0(N,3)]);
%hold on;
%plot3(R_1_0(:,1),R_1_0(:,2),R_1_0(:,3)); 
%plot3(R_2_0(:,1),R_2_0(:,2),R_2_0(:,3));
%AX = 5e5;
%axis([-AX AX -AX AX (R_1_0(N,3)-AX) (AX+R_1_0(N,3))]);
%grid on;
%hold off;

subplot(1,2,2);
R_related = R_2_0-R_1_0;
plot3(R_related(:,1),R_related(:,2),R_related(:,3)); 
hold on;
scatter3([0;R_related(N,1)], [0;R_related(N,2)], [0;R_related(N,3)]);
AX = 2e8;
axis([-AX AX -AX AX -AX AX]);
grid on;
hold off;


end