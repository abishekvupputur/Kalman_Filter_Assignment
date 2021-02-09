%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% F = kf_calcDFx(x) Calculates the Jacobian of the system dynamics equation f(x,u,t) 
%   
%   Author: C.C. de Visser, Delft University of Technology, 2013
%   email: c.c.devisser@tudelft.nl
%   Version: 1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function DFx = kf_calcDFx(t, x, U , JFx)
  %Jacobian
    u = x(1);
    v = x(2);
    w = x(3);
    px = x(4);
    py = x(5);
    pz = x(6);
    phi = x(7);
    theta = x(8);
    psi = x(9);
    lambda_x = x(10);
    lambda_y = x(11);
    lambda_z = x(12);
    lambda_p = x(13);
    lambda_q = x(14);
    lambda_r = x(15);
    u_wind = x(16);
    v_wind = x(17);
    w_wind = x(18);
    
    Ax = U(1);
    Ay = U(2);
    Az = U(3);
    p = U(4);
    q = U(5);
    r = U(6);
    
    g=9.81;
DFx=[[                               0,                                                       conj(r) - conj(lambda_r),                                                       conj(lambda_q) - conj(q), 0, 0, 0,                                                                                                                                                    0,                                                                                                                                         -(981*cos(conj(theta)))/100,                                                                                                                                                                                   0, -1,  0,  0,        0,                          conj(w),                         -conj(v), 0, 0, 0];
[        conj(lambda_r) - conj(r),                                                                              0,                                                       conj(p) - conj(lambda_p), 0, 0, 0,                                                                                                            (981*cos(conj(phi))*cos(conj(theta)))/100,                                                                                                                          -(981*sin(conj(phi))*sin(conj(theta)))/100,                                                                                                                                                                                   0,  0, -1,  0, -conj(w),                                0,                          conj(u), 0, 0, 0];
[        conj(q) - conj(lambda_q),                                                       conj(lambda_p) - conj(p),                                                                              0, 0, 0, 0,                                                                                                           -(981*cos(conj(theta))*sin(conj(phi)))/100,                                                                                                                          -(981*cos(conj(phi))*sin(conj(theta)))/100,                                                                                                                                                                                   0,  0,  0, -1,  conj(v),                         -conj(u),                                0, 0, 0, 0];
[ cos(conj(psi))*cos(conj(theta)), cos(conj(psi))*sin(conj(phi))*sin(conj(theta)) - cos(conj(phi))*sin(conj(psi)), sin(conj(phi))*sin(conj(psi)) + cos(conj(phi))*cos(conj(psi))*sin(conj(theta)), 0, 0, 0, sin(conj(psi))*(cos(conj(phi))*conj(w) + sin(conj(phi))*conj(v)) + cos(conj(psi))*sin(conj(theta))*(cos(conj(phi))*conj(v) - sin(conj(phi))*conj(w)),                                                     -cos(conj(psi))*(sin(conj(theta))*conj(u) - cos(conj(theta))*(cos(conj(phi))*conj(w) + sin(conj(phi))*conj(v))), - sin(conj(psi))*(cos(conj(theta))*conj(u) + sin(conj(theta))*(cos(conj(phi))*conj(w) + sin(conj(phi))*conj(v))) - cos(conj(psi))*(cos(conj(phi))*conj(v) - sin(conj(phi))*conj(w)),  0,  0,  0,        0,                                0,                                0, 1, 0, 0];
[ cos(conj(theta))*sin(conj(psi)), cos(conj(phi))*cos(conj(psi)) + sin(conj(phi))*sin(conj(psi))*sin(conj(theta)), cos(conj(phi))*sin(conj(psi))*sin(conj(theta)) - cos(conj(psi))*sin(conj(phi)), 0, 0, 0, sin(conj(psi))*sin(conj(theta))*(cos(conj(phi))*conj(v) - sin(conj(phi))*conj(w)) - cos(conj(psi))*(cos(conj(phi))*conj(w) + sin(conj(phi))*conj(v)),                                                     -sin(conj(psi))*(sin(conj(theta))*conj(u) - cos(conj(theta))*(cos(conj(phi))*conj(w) + sin(conj(phi))*conj(v))),   cos(conj(psi))*(cos(conj(theta))*conj(u) + sin(conj(theta))*(cos(conj(phi))*conj(w) + sin(conj(phi))*conj(v))) - sin(conj(psi))*(cos(conj(phi))*conj(v) - sin(conj(phi))*conj(w)),  0,  0,  0,        0,                                0,                                0, 0, 1, 0];
[               -sin(conj(theta)),                                                cos(conj(theta))*sin(conj(phi)),                                                cos(conj(phi))*cos(conj(theta)), 0, 0, 0,                                                                                   cos(conj(theta))*(cos(conj(phi))*conj(v) - sin(conj(phi))*conj(w)),                                                                     - cos(conj(theta))*conj(u) - sin(conj(theta))*(cos(conj(phi))*conj(w) + sin(conj(phi))*conj(v)),                                                                                                                                                                                   0,  0,  0,  0,        0,                                0,                                0, 0, 0, 1];
[                               0,                                                                              0,                                                                              0, 0, 0, 0,                              sin(conj(phi))*tan(conj(theta))*(conj(lambda_r) - conj(r)) - cos(conj(phi))*tan(conj(theta))*(conj(lambda_q) - conj(q)),                           - cos(conj(phi))*(tan(conj(theta))^2 + 1)*(conj(lambda_r) - conj(r)) - sin(conj(phi))*(tan(conj(theta))^2 + 1)*(conj(lambda_q) - conj(q)),                                                                                                                                                                                   0,  0,  0,  0,       -1, -sin(conj(phi))*tan(conj(theta)), -cos(conj(phi))*tan(conj(theta)), 0, 0, 0];
[                               0,                                                                              0,                                                                              0, 0, 0, 0,                                                                sin(conj(phi))*(conj(lambda_q) - conj(q)) + cos(conj(phi))*(conj(lambda_r) - conj(r)),                                                                                                                                                                   0,                                                                                                                                                                                   0,  0,  0,  0,        0,                  -cos(conj(phi)),                   sin(conj(phi)), 0, 0, 0];
[                               0,                                                                              0,                                                                              0, 0, 0, 0,                          (sin(conj(phi))*(conj(lambda_r) - conj(r)))/cos(conj(theta)) - (cos(conj(phi))*(conj(lambda_q) - conj(q)))/cos(conj(theta)), - (cos(conj(phi))*sin(conj(theta))*(conj(lambda_r) - conj(r)))/cos(conj(theta))^2 - (sin(conj(phi))*sin(conj(theta))*(conj(lambda_q) - conj(q)))/cos(conj(theta))^2,                                                                                                                                                                                   0,  0,  0,  0,        0, -sin(conj(phi))/cos(conj(theta)), -cos(conj(phi))/cos(conj(theta)), 0, 0, 0];
[                               0,                                                                              0,                                                                              0, 0, 0, 0,                                                                                                                                                    0,                                                                                                                                                                   0,                                                                                                                                                                                   0,  0,  0,  0,        0,                                0,                                0, 0, 0, 0];
[                               0,                                                                              0,                                                                              0, 0, 0, 0,                                                                                                                                                    0,                                                                                                                                                                   0,                                                                                                                                                                                   0,  0,  0,  0,        0,                                0,                                0, 0, 0, 0];
[                               0,                                                                              0,                                                                              0, 0, 0, 0,                                                                                                                                                    0,                                                                                                                                                                   0,                                                                                                                                                                                   0,  0,  0,  0,        0,                                0,                                0, 0, 0, 0];
[                               0,                                                                              0,                                                                              0, 0, 0, 0,                                                                                                                                                    0,                                                                                                                                                                   0,                                                                                                                                                                                   0,  0,  0,  0,        0,                                0,                                0, 0, 0, 0];
[                               0,                                                                              0,                                                                              0, 0, 0, 0,                                                                                                                                                    0,                                                                                                                                                                   0,                                                                                                                                                                                   0,  0,  0,  0,        0,                                0,                                0, 0, 0, 0];
[                               0,                                                                              0,                                                                              0, 0, 0, 0,                                                                                                                                                    0,                                                                                                                                                                   0,                                                                                                                                                                                   0,  0,  0,  0,        0,                                0,                                0, 0, 0, 0];
[                               0,                                                                              0,                                                                              0, 0, 0, 0,                                                                                                                                                    0,                                                                                                                                                                   0,                                                                                                                                                                                   0,  0,  0,  0,        0,                                0,                                0, 0, 0, 0];
[                               0,                                                                              0,                                                                              0, 0, 0, 0,                                                                                                                                                    0,                                                                                                                                                                   0,                                                                                                                                                                                   0,  0,  0,  0,        0,                                0,                                0, 0, 0, 0];
[                               0,                                                                              0,                                                                              0, 0, 0, 0,                                                                                                                                                    0,                                                                                                                                                                   0,                                                                                                                                                                                   0,  0,  0,  0,        0,                                0,                                0, 0, 0, 0]];
end
    

