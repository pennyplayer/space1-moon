%plot sphere
function circle3D(xm,ym)
    Re = 6371000;
    Rm = 1737000;
    figure
    [x,y,z] = sphere;
    surf(Re*x,Re*y,Re*z)  % earth centered at origin
    hold on
    surf(Rm*x+xm,Rm*y+ym,Rm*z)% moon centered at (3,-2,0)
    hold on
    daspect([1 1 1])
end
