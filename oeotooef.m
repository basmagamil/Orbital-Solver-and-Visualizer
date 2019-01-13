function [ u ] = oeotooef( a,E,uo,tof )
%This function returns true anomaly after propagating tof from the initial
%true anomaly uo given the elements of the orbit (semimajor axis and
%eccentricity)

% a = input('semimajor axis a = ');
% E = input('eccentricity E = ');
% uo = input('true anomaly = ');
% tof = input('time of flight tof = ');

mu = 398574.405096;

n = sqrt(mu/(a^3)); %mean motion
T = 2*pi*sqrt((a^3)/mu); %period
k = floor(tof/T);

%eccentric anomaly intial
Euo = acos((cosd(uo)+E)/(1+(E*cosd(uo))));
if uo>180
    Euo=(2*pi)-Euo;
end
%mean anomaly initial
Muo=Euo-E*sin(Euo);
%mean anomaly final
Muf=Muo+n*tof-2*pi*k;

% if Muf>2*pi
%     Muf=Muf-k*2*pi;
% end

tofp=(1/n)*Muo;
if tofp<tof
    k=k+1;
end


syms Euf;
eqn = Euf==Muf+E*sin(Euf);
Eu=solve(eqn, Euf);

u = acosd(double((cos(Eu)-E)/(1-(E*cos(Eu)))));

if double(Eu)>pi
    u=360-u;
end

end

