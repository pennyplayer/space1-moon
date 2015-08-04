%angle to moon
function theta = thetaangle(vx,vy,x,y,xm,ym)
    dx = x-xm;
    dy = y-ym;
    s = sqrt(dx^2+dy^2);
    v = sqrt(vx^2+vy^2);
    theta = acos((dx*vx+dy*vy)/(s*v));
end