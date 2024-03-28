function [x] = Setka(a,h,n)
    x = [];
%     y = [];
    for i = 0:n
        xi=a+h*i;
        x=[x,xi];
    end
%     x = sort(x);
%     for i = 1:(n+1)
%         yi=tochnY(x(i));
%         y=[y,yi];
%     end
end