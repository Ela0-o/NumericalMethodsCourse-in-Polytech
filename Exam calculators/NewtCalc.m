func = inline('(x.^3).*2 - (x.^2).*9 - x.*60 + 1'); %введите свою функцию
dfunc = inline('(x.^2).*6 - x.*18 - 60'); %введите производную этой функции
it = 0;
xk_1 = 0; %введите Х0
xk = 1;
eps = 10^(-1); %введите точность
while (abs(xk - xk_1) > eps*abs(xk))
    xk_1 = xk;
    xk = xk - (func(xk)/dfunc(xk))
    it = it + 1
    abs(xk - xk_1)
end
ksi = xk