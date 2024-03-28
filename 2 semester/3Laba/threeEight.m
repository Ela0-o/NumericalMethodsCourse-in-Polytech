function S = threeEight(a,b,n)
    h = (b-a)/(3*n);
    S = func(a)+func(b);
    for i = 1:3*n-1
        xk = a+i*h;
        if mod(i,3)==0
            S = S + 2*func(xk);
        else 
            S = S + 3*func(xk);
        end
    end
    S = S*h*3/8;
end
%  S = (3/8)*h*(func(a)+ func(b)+2*(func(a+3*h)+func(a+6*h)+func(a+9*h)+3*(func(a+2*h)+func(a+4*h)+func(a+8*h)));