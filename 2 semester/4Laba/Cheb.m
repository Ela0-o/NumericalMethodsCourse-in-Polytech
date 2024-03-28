function S = Cheb(a,b)
    A = 2/5;
    t(1) = ((-1/2)*sqrt((1/3)*(5+sqrt(11))));
    t(2) = ((-1/2)*sqrt((1/3)*(5-sqrt(11))));
    t(3) = 0;
    t(4) = ((1/2)*sqrt((1/3)*(5-sqrt(11))));
    t(5) = ((1/2)*sqrt((1/3)*(5+sqrt(11))));
    t
    S = 0;
    Fx = 0;
    for i = 1:5
        Fx = Fx+func(((a+b)/2)+((b-a)/2)*t(i));
    end
    S = S + A*Fx*(b-a)/2;
end