function plot_kepler4( r,v,tof )
%This function returns a plot using the kepler method for
%given r in km, v in kmpersec, and time of propagation.

% Constant parameters
mu = 398574.405096;  % Planetary gravitational constant for Earth
earth_r=6371.000; % radiusof the earth in km


%%Getting the orbital elements from the given r and v%%
[ a,e,E,i,raan,w,u,tp ] = rvtooe( r,v );
b=a*(1-E^2);
c=E*a;

%%plotting the main graph axis%%
set(gcf,'Menubar','default','Name','Visualization', ... 
    'NumberTitle','off','Position',[10,350,750,750], ... 
    'Color',[0.38 0.26 0.67]); 
lim=(1+E)*a;%Setting the limits of the graph
clf
axis([-lim, lim, -lim, lim, -lim, lim])	
xlabel('X');
ylabel('Y');
zlabel('Z');
view(150,15) 
axis equal
shg
hold on
grid on
title('Visualization');

%%Plotting the Earth%%
equat_r=6378.137;
polar_r=6356.752;
[xx, yy, zz]=ellipsoid (0,0,0,equat_r, equat_r, polar_r);
load('topo.mat','topo','topomap1');
topo2 = [topo(:,181:360) topo(:,1:180)];
pro.FaceColor= 'texture';
pro.EdgeColor = 'none';
pro.FaceLighting = 'phong';
pro.Cdata = topo2;
earth= surface(xx,yy,zz,pro)
colormap(topomap1)

%%Plotting the earth inertial axes%%
Xi = line([0 lim],[0 0],[0 0],'Color', 'yellow', 'Marker','.','LineStyle','-','LineWidth',1);
text(lim,0,0,'i','Color','r','FontSize',15)
Yj = line([0 0],[0 lim],[0 0],'Color', 'yellow', 'Marker','.','LineStyle','-','LineWidth',1);
text(0,lim,0,'j','Color','r','FontSize',15)
Zk = line([0 0],[0 0],[0 lim],'Color', 'yellow', 'Marker','.','LineStyle','-','LineWidth',1);
text(0,0,lim,'k','Color','r','FontSize',15)

%%setting the background black and removing the axes%%
set(gcf,'color','black');
axis off
axis equal
view (150,15)

%%plotting the orbit%%
tspano=linspace(0,tp,100);
outputo=zeros(100,7);
ri=r;
vi=v;
outputo(1,:)=[tspano(1) ri vi];

l=2;
for l=2:length(tspano)   
    [ rf,vf ] = kepler_time( ri,vi,tspano(l));
    outputo(l,:)=[tspano(l) rf vf];
    l=l+1;
end
[rowo colo]=size(outputo);

m=2;
for m=2:rowo
    line([outputo(m-1,2) outputo(m,2)],[outputo(m-1,3) outputo(m,3)], [outputo(m-1,4) outputo(m,4)],'Color', 'red', 'LineWidth', 2);
    if m==rowo
        line([outputo(m,2) outputo(1,2)],[outputo(m,3) outputo(1,3)], [outputo(m,4) outputo(1,4)],'Color', 'red', 'LineWidth', 2);
    end
    hold on
m=m+1;
end

%%plotting the satellite%%
tspans=linspace(0,tof,100);
outputs=zeros(100,7);
ri=r;
vi=v;
outputs(1,:)=[tspans(1) ri vi];

l=2;
for l=2:length(tspans)   
    [ rf,vf ] = kepler_time( ri,vi,tspans(l));
    outputs(l,:)=[tspans(l) rf vf];
    l=l+1;
end
[rows cols]=size(outputs);

hold on

k=1;
for k=1:rows
    rotate(earth,[0,0,1],2,[0,0,0]); %rotating the earth
    array(k,:)=plot3 (outputs(k,2), outputs(k,3), outputs(k,4),'o', 'MarkerEdgeColor', 'red','MarkerFaceColor','yellow','MarkerSize', 8);
    if k>1 
      set (array(k-1,:), 'Visible', 'off');
    end
   
    pause (0.001);
    k=k+1;
end

hold off

%%displaying the final r and v on the plot%%
rf=outputs(rows,2:4);
vf=outputs(rows,5:7);
rfstr=['r final is ',num2str(rf);];
vfstr=['v final is ',num2str(vf)];
text(-lim,-lim,-lim*0.9,rfstr,'Color','white','FontSize',11)
text(-lim,-lim,-lim,vfstr,'Color','white','FontSize',11)


end

