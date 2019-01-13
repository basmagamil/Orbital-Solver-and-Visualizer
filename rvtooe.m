function [ a,e,E,i,raan,w,u,tp ] = rvtooe( r,v )
%This function returns the orbital elements from r and v vectors

% r=[7016 5740 638]; 
% v=[0.24 -0.79 -7.11]; 

R=norm(r);
V=norm(v);
mu=398574.405096;
ii=[1 0 0]; j=[0 1 0]; k=[0 0 1];
I=norm(ii); J=norm(j); K=norm(k);
e=(1/mu).*(((V^2-(mu/R)).*r)-(dot(r,v).*v)) %eccentricity vector
E=norm(e) %eccentricity value
h=cross(r,v); H=norm(h);
a=(H^2)/(mu.*(1-E^2)) %semimajor axis
n=cross(k,h); N=norm(n);
i=acosd(dot(k,h)/(K*H)); %inclination
u=acosd(dot(e,r)/(E*R)); %true anomaly
if dot(r,v)<0
    u=360-u
end
tp=2*pi*sqrt(a^3/mu); %period
raan=acosd(dot(ii,n)/N); %right ascension of ascending node
if n(2)<0
    raan=360-raan;
end 
w=acosd(dot(e,n)/(E*N)); %argument of perigee
if e(3)<0
    w=360-w;
end 
phi=atand((e*sind(u))/(1+e*cosd(u))); %flight path angle

end

