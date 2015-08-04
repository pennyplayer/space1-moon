
format long
%tracker3D
%assumes a circularly orbiting moon at 1km/s 
%at a constant distance of 384400 km from the earth
%currently does a loop around the moon - looks awesome
%consider animation

%incriments distance and velocity to track satellite

%needs to consider new masses as rocket looses mass
%air resistance when launching from earth

%constants
Re = 6371000; %m
Rm = 1737000; %m
Dem = 384400e3; %m %distance from the earth to moon
G = 6.67*10^-11;
Me = 5.972*10^24; %kg
Mm = 7.25*10^22; %kg
alt = 310000;
    
%initial conditions
%time
dt = 1;
time = 250000;

%preallocation
x = zeros(time,1);
y = zeros(time,1);
z = zeros(time,1);
vx = zeros(time,1);
vy = zeros(time,1);
vz = zeros(time,1);
xm = zeros(time,1);
ym = zeros(time,1);
zm = zeros(time,1);
xs = zeros(time,1);
ys = zeros(time,1);
zs = zeros(time,1);

%velocities
vx(1) = sqrt(G*Me/(Re+alt));
vy(1) = 0;
vz(1) = 0;
%positions
sp = 1.1398; %starting point of the moon where rad = 0 when x = 0 %1.1398
x(1) = 0;
y(1) = -alt - Re; %orbital height from previous section
z(1) = 0;

xm(1) = Dem*cos(sp);
ym(1) = Dem*sin(sp);
zm(1) = 0;

xs(1) = 0;
ys(1) = 149600000000;
zs(1) = 2213000;

%gravity
[gx,gy,gz] = gravity3D(x(1),y(1),z(1),xm(1),ym(1),zm(1),xs(1),ys(1),zs(1));

%thrust
ax = gx + acc(1);
ay = gy + 0;
az = gz + 0;

for i = 2:time
    
    %new velocities satellite
    vx(i) = vx(i-1) + ax*dt;
    vy(i) = vy(i-1) + ay*dt;
    vz(i) = vz(i-1) + az*dt;
    
    %new positions satellite
    x(i) = x(i-1) + vx(i-1)*dt+(1/2)*ax*dt^2;
    y(i) = y(i-1) + vy(i-1)*dt+(1/2)*ay*dt^2;
    z(i) = z(i-1) + vz(i-1)*dt+(1/2)*az*dt^2;
    
    %new positions moon
    [xm(i),ym(i),zm(i)] = moon3D(i,Dem,sp);
    
    %new positions sun
    [xs(i),ys(i),zs(i)] = sun(i,sp);
    
    %new gravity
    [gx,gy,gz] = gravity3D(x(i-1),y(i-1),z(i-1),xm(i-1),ym(i-1),zm(i-1),xs(i-1),ys(i-1),zs(i-1));
    
    %new acceleration
    ax = gx + acc(i)*vx(i)/sqrt(vx(i)^2+vy(i)^2+vz(i)^2);
    ay = gy + acc(i)*vy(i)/sqrt(vx(i)^2+vy(i)^2+vz(i)^2);
    az = gz + acc(i)*vy(i)/sqrt(vx(i)^2+vy(i)^2+vz(i)^2);
    
end



%find the position where the spaceship is closest to the moon
[i,d] = closest(x,y,z,xm,ym,zm,time);
v = sqrt(vx(i)^2+vy(i)^2+vz(i)^2);
vlo = sqrt(G*Mm/d); %m/s %necessary velocity for lunar orbit consider linking this to the distance from the moon using closest
disp(v);
theta = thetaangle(vx(i),vy(i),x(i),y(i),xm(i),ym(i));
disp(theta);

%plot a picture of the position where the ship is closest to the moon

circle3D(xm(i),ym(i));
hold on
plot3(x(1:i),y(1:i),z(1:i), 'LineStyle','--');
hold on
circle(xm(i),ym(i),Rm+50000);
axis equal
