function [n,d] = closest(x,y,z,xm,ym,zm,i)
    d = sqrt((x(1)-xm(1))^2+(y(1)-ym(1))^2+(z(1)-zm(1))^2);
    n = 1;
    for a = 2:i
        d2 = sqrt((x(a)-xm(a))^2+(y(a)-ym(a))^2+(z(a)-zm(a))^2);
        if d2 < d
            d = d2;
            n = a;
        else
            return
        end
    end
end
