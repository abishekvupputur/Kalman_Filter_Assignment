%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% H = kf_calcDHx(x) Calculates the Jacobian of the output dynamics equation f(x,u,t) 
%   
%   Author: C.C. de Visser, Delft University of Technology, 2013
%   email: c.c.devisser@tudelft.nl
%   Version: 1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Hx = kf_calcDHx(t, x, U , JHx)
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

    Hx=[[                                                                                                                                                                                                                                                                 cos(conj(psi))*cos(conj(theta)),                                      cos(conj(psi))*sin(conj(phi))*sin(conj(theta)) - cos(conj(phi))*sin(conj(psi)),                                                                                                                                                                                                                  sin(conj(phi))*sin(conj(psi)) + cos(conj(phi))*cos(conj(psi))*sin(conj(theta)), 0, 0, 0, sin(conj(psi))*(cos(conj(phi))*conj(w) + sin(conj(phi))*conj(v)) + cos(conj(psi))*sin(conj(theta))*(cos(conj(phi))*conj(v) - sin(conj(phi))*conj(w)), -cos(conj(psi))*(sin(conj(theta))*conj(u) - cos(conj(theta))*(cos(conj(phi))*conj(w) + sin(conj(phi))*conj(v))), - sin(conj(psi))*(cos(conj(theta))*conj(u) + sin(conj(theta))*(cos(conj(phi))*conj(w) + sin(conj(phi))*conj(v))) - cos(conj(psi))*(cos(conj(phi))*conj(v) - sin(conj(phi))*conj(w)), 0, 0, 0, 0, 0, 0, 1, 0, 0];
[                                                                                                                                                                                                                                                                 cos(conj(theta))*sin(conj(psi)),                                      cos(conj(phi))*cos(conj(psi)) + sin(conj(phi))*sin(conj(psi))*sin(conj(theta)),                                                                                                                                                                                                                  cos(conj(phi))*sin(conj(psi))*sin(conj(theta)) - cos(conj(psi))*sin(conj(phi)), 0, 0, 0, sin(conj(psi))*sin(conj(theta))*(cos(conj(phi))*conj(v) - sin(conj(phi))*conj(w)) - cos(conj(psi))*(cos(conj(phi))*conj(w) + sin(conj(phi))*conj(v)), -sin(conj(psi))*(sin(conj(theta))*conj(u) - cos(conj(theta))*(cos(conj(phi))*conj(w) + sin(conj(phi))*conj(v))),   cos(conj(psi))*(cos(conj(theta))*conj(u) + sin(conj(theta))*(cos(conj(phi))*conj(w) + sin(conj(phi))*conj(v))) - sin(conj(psi))*(cos(conj(phi))*conj(v) - sin(conj(phi))*conj(w)), 0, 0, 0, 0, 0, 0, 0, 1, 0];
[                                                                                                                                                                                                                                                                               -sin(conj(theta)),                                                                                     cos(conj(theta))*sin(conj(phi)),                                                                                                                                                                                                                                                                 cos(conj(phi))*cos(conj(theta)), 0, 0, 0,                                                                                   cos(conj(theta))*(cos(conj(phi))*conj(v) - sin(conj(phi))*conj(w)),                 - cos(conj(theta))*conj(u) - sin(conj(theta))*(cos(conj(phi))*conj(w) + sin(conj(phi))*conj(v)),                                                                                                                                                                                   0, 0, 0, 0, 0, 0, 0, 0, 0, 1];
[                                                                                                                                                                                                                                                                                               0,                                                                                                                   0,                                                                                                                                                                                                                                                                                               0, 1, 0, 0,                                                                                                                                                    0,                                                                                                               0,                                                                                                                                                                                   0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
[                                                                                                                                                                                                                                                                                               0,                                                                                                                   0,                                                                                                                                                                                                                                                                                               0, 0, 1, 0,                                                                                                                                                    0,                                                                                                               0,                                                                                                                                                                                   0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
[                                                                                                                                                                                                                                                                                               0,                                                                                                                   0,                                                                                                                                                                                                                                                                                               0, 0, 0, 1,                                                                                                                                                    0,                                                                                                               0,                                                                                                                                                                                   0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
[                                                                                                                                                                                                                                                                                               0,                                                                                                                   0,                                                                                                                                                                                                                                                                                               0, 0, 0, 0,                                                                                                                                                    1,                                                                                                               0,                                                                                                                                                                                   0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
[                                                                                                                                                                                                                                                                                               0,                                                                                                                   0,                                                                                                                                                                                                                                                                                               0, 0, 0, 0,                                                                                                                                                    0,                                                                                                               1,                                                                                                                                                                                   0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
[                                                                                                                                                                                                                                                                                               0,                                                                                                                   0,                                                                                                                                                                                                                                                                                               0, 0, 0, 0,                                                                                                                                                    0,                                                                                                               0,                                                                                                                                                                                   1, 0, 0, 0, 0, 0, 0, 0, 0, 0];
[                                                                                                                                                                                                                                                           conj(u)/conj((u^2 + v^2 + w^2)^(1/2)),                                                                               conj(v)/conj((u^2 + v^2 + w^2)^(1/2)),                                                                                                                                                                                                                                                           conj(w)/conj((u^2 + v^2 + w^2)^(1/2)), 0, 0, 0,                                                                                                                                                    0,                                                                                                               0,                                                                                                                                                                                   0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
[                                                                                                                                                                                                                            -(imag(u) + real(w))/((imag(u) + real(w))^2 + (imag(w) - real(u))^2),                                                                                                                   0,                                                                                                                                                                                                                            -(imag(w) - real(u))/((imag(u) + real(w))^2 + (imag(w) - real(u))^2), 0, 0, 0,                                                                                                                                                    0,                                                                                                               0,                                                                                                                                                                                   0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
[ ((real((u^2 + w^2)^(1/2)) - imag(v))^2*(imag(u/(u^2 + w^2)^(1/2))/(real((u^2 + w^2)^(1/2)) - imag(v)) - (real(u/(u^2 + w^2)^(1/2))*(imag((u^2 + w^2)^(1/2)) + real(v)))/(real((u^2 + w^2)^(1/2)) - imag(v))^2))/((imag((u^2 + w^2)^(1/2)) + real(v))^2 + (real((u^2 + w^2)^(1/2)) - imag(v))^2), (real((u^2 + w^2)^(1/2)) - imag(v))/((imag((u^2 + w^2)^(1/2)) + real(v))^2 + (real((u^2 + w^2)^(1/2)) - imag(v))^2), ((real((u^2 + w^2)^(1/2)) - imag(v))^2*(imag(w/(u^2 + w^2)^(1/2))/(real((u^2 + w^2)^(1/2)) - imag(v)) - (real(w/(u^2 + w^2)^(1/2))*(imag((u^2 + w^2)^(1/2)) + real(v)))/(real((u^2 + w^2)^(1/2)) - imag(v))^2))/((imag((u^2 + w^2)^(1/2)) + real(v))^2 + (real((u^2 + w^2)^(1/2)) - imag(v))^2), 0, 0, 0,                                                                                                                                                    0,                                                                                                               0,                                                                                                                                                                                   0, 0, 0, 0, 0, 0, 0, 0, 0, 0]];
end