%finds the gravity due to the earth and the moon at
%any point specified by x and y
%kurtis check
function [gx,gy,gz] = gravity3D(x,y,z,xm,ym,zm,xs,ys,zs)
    format long
    %find gravity at any point given an input of x,y and z
    %from the earth and the moon
    G = 6.67*10^-11;
    Me = 5.972*10^24; %kg
    Mm = 7.25*10^22; %kg
    Ms = 1.989*10^30; %kg
    
   
    gex = -1*G*Me/(x^2+y^2+z^2)*(x/sqrt(x^2+y^2+z^2)); %gravity of the earth in x 
    gey = -1*G*Me/(x^2+y^2+z^2)*(y/sqrt(x^2+y^2+z^2)); %gravity of the earth in y
    gez = -1*G*Me/(x^2+y^2+z^2)*(z/sqrt(x^2+y^2+z^2)); %gravity of the earth in z
    
    %location of moon is given by xm, ym and zm
    %distance to moon from satellite dx
    dx=xm-x;
    dy=ym-y;
    dz=zm-z;
    
    gmx = G*Mm/(dx^2+dy^2+dz^2)*(dx/sqrt(dx^2+dy^2+dz^2)); %gravity of the moon in x
    gmy = G*Mm/(dx^2+dy^2+dz^2)*(dy/sqrt(dx^2+dy^2+dz^2)); %gravity of the moon in y
    gmz = G*Mm/(dx^2+dy^2+dz^2)*(dz/sqrt(dx^2+dy^2+dz^2)); %gravity of the moon in z
    
    %location of sun is given by xs, yx, and zs
    
    dsx = xs-x;
    dsy = ys-y;
    dsz = zs-z;
    
    gsx = G*Ms/(dsx^2+dsy^2+dsz^2)*(dsx/sqrt(dsx^2+dsy^2+dsz^2)); %gravity of the sun in x
    gsy = G*Ms/(dsx^2+dsy^2+dsz^2)*(dsy/sqrt(dsx^2+dsy^2+dsz^2)); %gravity of the sun in y
    gsz = G*Ms/(dsx^2+dsy^2+dsz^2)*(dsz/sqrt(dsx^2+dsy^2+dsz^2)); %gravity of the sun in z
    
    %total gravity
    gx = gmx + gex + gsx;
    gy = gmy + gey + gsy;
    gz = gmz + gez + gsz;
end
