function yy = newton(x, y, xx)
    n = length(x);
    diff = y;
    for  k = 1:(n-1)
         for i = 1:(n-k)
              diff(i) = (diff(i)-diff(i+1))/(x(i)-x(i+k));
          end
    end
    yy = diff(1)*ones(size(xx));
    for k = 2:n
         yy = diff(k)+(xx - x(k)).* yy;
    end
end