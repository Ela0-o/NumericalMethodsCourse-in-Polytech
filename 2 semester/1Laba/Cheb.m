function [x,y] = Cheb(n,a,b)
    x = [];
    y = [];
    for k = 0:n
        xk=((b+a)/2)+((b-a)/2)*cos(pi*(2*k+1)/(2*(n+1)));
        x=[x,xk];
    end
%     x = sort(x);
    for k = 1:(n+1)
        yk=func(x(k));
        y=[y,yk];
    end
end