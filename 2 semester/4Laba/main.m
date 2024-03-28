a = -2.3;
b = -0.5;
exactVal = integral(@func,a,b);

[N, arrGE, arrFE] = Runge(a,b,exactVal);
S = Cheb(a,b)

figure
loglog(arrFE,arrGE,'r', arrFE, arrFE,'g')
hold on
grid on
title("������ ����������� ����������� �������� �� ��������")

figure
semilogx(arrFE,N,'g')
hold on
grid on
ylabel('2^n')
title("������ ����������� ����� �������� �� �������� ��������")