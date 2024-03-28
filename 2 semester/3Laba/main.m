a = 0.1;
b = 2.9;
f = @(x) x.^5-9.2*x.^3+2.5*x.^2-7*x+1.4;
exactVal = integral(@func,a,b);

I1 = threeEight(a,b,1)
I2 = threeEight(a,b,2)
I4 = threeEight(a,b,4)
[N, arrGE, arrFE] = Runge(a,b,exactVal);

figure
loglog(arrFE,arrGE,'r', arrFE, arrFE,'g')
hold on
grid on
title("График зависимости фактической точности от заданной")

figure
semilogx(arrFE,N,'g')
hold on
grid on
ylabel('2^n')
title("График зависимости числа итераций от заданной точности")