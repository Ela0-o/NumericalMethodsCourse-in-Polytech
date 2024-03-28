function dY = func(x,y)
%     dY = -(1+x.*y)/x.^2;
    dY = (y.^2).*exp(x)-2*y;
end