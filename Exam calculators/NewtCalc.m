func = inline('(x.^3).*2 - (x.^2).*9 - x.*60 + 1'); %������� ���� �������
dfunc = inline('(x.^2).*6 - x.*18 - 60'); %������� ����������� ���� �������
it = 0;
xk_1 = 0; %������� �0
xk = 1;
eps = 10^(-1); %������� ��������
while (abs(xk - xk_1) > eps*abs(xk))
    xk_1 = xk;
    xk = xk - (func(xk)/dfunc(xk))
    it = it + 1
    abs(xk - xk_1)
end
ksi = xk