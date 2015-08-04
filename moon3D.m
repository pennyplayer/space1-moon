%moon3D movement
function [xm,ym,zm] = moon3D(t, Dem, sp)
    %velocity of the moon
    vm = 1023; %m/s
    xm=Dem*cos(vm*t/Dem + sp);
    ym=Dem*sin(vm*t/Dem + sp);
    zm=0;
end
