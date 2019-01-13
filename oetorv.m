function [ r,v ] = oetorv(a,E,i,raan,w,u)
%This function returns r and v vectors after inputting the orbital elements

% a = input('semimajor axis a = ');
% e = input('eccentricity e = ');
% inc = input('incination i =');
% raan = input('raan = ');
% w = input('argument of perigee = ');
% u = input('true anomaly = ');

mu = 398574.405096;

p = a*(1-E^2);
k_1=(p)/(1+E*cosd(u)); %r constant
k_2=sqrt(mu/(p)); %v constant
r_pqw=[k_1*cosd(u) k_1*sind(u) 0]; %r in perifocal coordinate system
v_pqw=[-k_2*sind(u) k_2*(E+cosd(u)) 0]; %v in perifocal coordinate system
%transformation matrix elements (from perifocal to geocentric coordinate system)
A11=cosd(raan)*cosd(w)-sind(raan)*sind(w)*cosd(i);
A12=-cosd(raan)*sind(w)-sind(raan)*cosd(w)*cosd(i);
A13=sind(raan)*sind(i);
A21=sind(raan)*cosd(w)+cosd(raan)*sind(w)*cosd(i);
A22=-sind(raan)*sind(w)+cosd(raan)*cosd(w)*cosd(i);
A23=-cosd(raan)*sind(i);
A31=sind(w)*sind(i);
A32=cosd(w)*sind(i);
A33=cosd(i);
%transformation matrix(from perifocal to geocentric coordinate system)
A=[A11 A12 A13 ; A21 A22 A23 ; A31 A32 A33];
%r and v in geocentric coordinate system
r=(A*r_pqw')';
v=(A*v_pqw')';


end

