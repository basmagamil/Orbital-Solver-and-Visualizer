function [ rf,vf ] = kepler_time( ro,vo,tof )
%This function uses other functions to return final r and v vectors from
%initial r and v vectors after propagating certain tof

[ a,e,E,i,raan,w,uo,tp ] = rvtooe( ro,vo );
[ uf ] = oeotooef( a,E,uo,tof );
[ rf,vf ] = oetorv(a,E,i,raan,w,uf);

end

