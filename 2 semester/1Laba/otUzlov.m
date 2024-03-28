a = 1;
b = 2;
xx = a:0.01:b;
Err = [];
N = [];

for n=2:46
    [x,y]=Cheb(n,a,b);
    err = max(abs(func(xx)-newton(x,y,xx)));
    Err = [Err, err];
    N = [N,n+1];
end

figure
semilogy(N,Err)
hold on
grid on
title("График зависимости максимальной ошибки от числа узлов")
