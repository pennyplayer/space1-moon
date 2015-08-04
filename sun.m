%sun movement
function [xs,ys,zs] = sun(t,sp)
    vm = 1023; %m/s
    Dem = 384400e3; %distance from the earth to moon in m
    xs=0-30000*t;
    ys=149600000000;
    zs=2213000*sin(40*pi/180+sp+vm*t/Dem);
end