function [ r,v ] = tletorv( tle )
%This function returns r and v vectors from a two line element set for a
%satellite

%Get the string from the GUI, example:
% tle='1 25544U 98067A   16364.61781196  .00002076  00000-0  38857-4 0  9999 2 25544  51.6421 163.6170 0006865  30.4055  72.7161 15.53959296 35384';

mu=398574.405096;

le1=tle(1:69);
le2=tle(71:139);
i=str2num(le2(9:16));   %Inclination
raan=str2num(le2(18:25));   %Right Ascension of Ascending node
ecc = str2num(strcat('0.',le2(27:33)));               % Eccentricity
aop=str2num(le2(35:42));    %Argument of Perigee
M=str2num(le2(44:51));   %Mean Anomaly
n=str2num(le2(53:63))/(24*3600);  %Mean Motion [revs per second
sma = ( mu/(str2num(le2(53:63))*2*pi/86400)^2 )^(1/3); %semi major axis

syms E
eqn= M==E-ecc*sin(E);
E=solve(eqn,E);
u=acosd(double((cos(E)-ecc)/(1-(ecc*cos(E)))));
if double(E)>pi
    u=360-u;
end


[r,v]=oetorv(sma,ecc,i,raan,aop,u);

end

