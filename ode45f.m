function [ output ] = ode45f( t,input )
%input = [rx; ry; rz; vx; vy; vz];
% output =[rdotx; rdoty; rdotz; vdotx; vdoty; vdotz];
% %reducing order
% rdot=v;
% vdot=r2dot;

%r=[8226.364 397.787 6887.480];
%v=[-0.706 6.6 -0.601]
r=[input(1), input(2), input(3)];
R=norm(r);

mu = 398574.405096;

output = zeros(6,1);
output(1) = input(4);
output(2) = input(5);
output(3) = input(6);
output(4) = -(mu/R^3).*input(1);
output(5) = -(mu/R^3).*input(2);
output(6) = -(mu/R^3).*input(3);
output
end

