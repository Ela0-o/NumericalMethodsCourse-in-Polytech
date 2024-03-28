eps = 0.01;
a = -1;
b = 1;
F = inline('');
x = a-(b-a)*F(a)/(F(b)-F(a));
k = 1;
xk(k) = x;
df = polyder(f);
if(F(x) ~= 0)
    while(abs(a-x)>=eps && abs(b-x)>=eps) % исправить 
        if(F(x)*F(a)< 0)
            b = x;
            x = a - (b-a)*F(a)/(F(b)-F(a));
            k = k + 1;
            xk(k) = x;
        else
            a = x;
            x = a - (b-a)*F(a)/(F(b)-F(a));
            k = k + 1;
            xk(k) = x;
        end
    end
end