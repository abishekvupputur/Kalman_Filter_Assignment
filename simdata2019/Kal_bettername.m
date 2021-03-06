syms u v w px py pz phi theta psi lambda_x lambda_y lambda_z lambda_p lambda_q lambda_r u_wind v_wind w_wind;
syms Ax Ay Az p q r;
syms y1 y2 y3 y4 y5 y6 y7 y8 y9 y10 y11 y12 y13 y14 y15 y16 y17 y18;
g=9.81;

y1 = (Ax - lambda_x) -g*sin(theta) + (r - lambda_r)*v - (q - lambda_q)*w;
y2 = (Ay - lambda_y) +g*cos(theta)*sin(phi) + (p - lambda_p)*w - (r - lambda_r)*u;
y3 = (Az - lambda_z) +g*cos(theta)*cos(phi) + (q - lambda_q)*u - (p - lambda_p)*v;
y4 = (u*cos(theta) + (v*sin(phi) + w*cos(phi))*sin(theta))*cos(psi) - (v*cos(phi) - w*sin(phi))*sin(psi) + u_wind;
y5 = (u*cos(theta) + (v*sin(phi) + w*cos(phi))*sin(theta))*sin(psi) + (v*cos(phi) - w*sin(phi))*cos(psi) + v_wind;
y6 = -u*sin(theta) + (v*sin(phi) + w*cos(phi))*cos(theta) + w_wind;
y7 = (p - lambda_p) + (q - lambda_q)*sin(phi)*tan(theta) + (r - lambda_r)*cos(phi)*tan(theta);
y8 = (q - lambda_q)*cos(phi) - (r - lambda_r)*sin(phi);
y9 = (q - lambda_q)*sin(phi)/cos(theta) + (r - lambda_r)*cos(phi)/cos(theta);
y10 = 0;
y11 = 0;
y12 = 0;
y13 = 0;
y14 = 0;
y16 = 0;
y17 = 0;
y18 = 0;
JFx = jacobian([y1 y2 y3 y4 y5 y6 y7 y8 y9 y10 y11 y12 y13 y14 y15 y16 y17 y18]',[u v w px py pz phi theta psi lambda_x lambda_y lambda_z lambda_p lambda_q lambda_r u_wind v_wind w_wind]);
%save('Jacobian_F','JFx');
%clear all;