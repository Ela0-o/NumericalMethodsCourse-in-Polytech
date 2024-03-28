func = inline('(x.^3).*2 - (x.^2).*9 - x.*60 + 1'); %введите свою функцию
dfunc = inline('(x.^2).*6 - x.*18 - 60'); %введите производную этой функции
it = 0;
a = -1; %введите левую границу
b = 1; %введите правую границу
eps = 10^(-3);
delta = 0.000000000001;

while (abs(b-a) > 2*eps)
    c = (a+b)/2
    if ((1-a) < 2*eps)
        break
    end
    if ((abs(func(c))) < delta)
        break
    end
    if ((func(a))*(func(c)) < 0)
        b = c
    else
        a = c
    end
    it = it + 1;
    abs(b-a)
end
c