function a = acc(t)
    Mi = 6850; %initial mass in kg
    Th = 40000; %thrust is 400kN
    ISP = 300;
    g0 = 9.81;
    m = Mi - Th*t/(g0*ISP);
    if m < 2500
        a = 0;
    else 
        a = Th/m;
    end
end
%NOTE: mass cannot go below 1970 kg as this is structure
%and payload