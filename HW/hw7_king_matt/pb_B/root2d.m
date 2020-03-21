function F = root2d(v1)
    I0 = 10E-12;
    n = 1;
    VT = ((1.3806488E-23)*300)/(1.602176565E-19);
    R = 10E3;
    Vs = 3;

    F(1) = I0*(exp(v1/(n*VT))-1);
    F(2) = (Vs-v1)/R;
end