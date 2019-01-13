function [ output ] = num_int( tspan, r, v)

% tspan = [0 21600];
% r=[8226.364 397.787 6887.480];
% v=[-0.706 6.6 -0.601];

rx=r(1,1);
ry=r(1,2);
rz=r(1,3);
vx=v(1,1);
vy=v(1,2);
vz=v(1,3);
[t,sol] = ode45(@ode45f, tspan, [rx; ry; rz; vx; vy; vz]);
output = [t, sol]; 
end

