% a = 1;
% b = 3;
% y0 = 1;
a = -1;
b = 1;
y0 = exp(1);
%
n1 = 20;
[X1,Y1] = ElerKoshi(a,b,y0,n1);
%
n2 = 10;
[X2,Y2] = ElerKoshi(a,b,y0,n2);
%точное решение
xx =a:0.1:b;
TY1 =[];
for i=1:length(xx)
    TY1(i) = tochnY(xx(i))
end

arrOsh1 = [];
arrOsh2 = [];
for i = 1:n1+1
    osh1 = abs(tochnY(X1(i))-Y1(i));
    arrOsh1 = [arrOsh1,osh1];
end
for i = 1:n2+1
    osh2 = abs(tochnY(X2(i))-Y2(i));
    arrOsh2 = [arrOsh2,osh2];
end

FT3 = [];
TY3 =[];
H = [];
for n = 10:10:10000
    [X3,Y3,h] = ElerKoshi(a,b,y0,n);
    for i=1:length(X3)
        TY3(i) = tochnY(X3(i));
    end
    factT3 = norm(TY3-Y3, inf);
    FT3 = [FT3, factT3];
    H = [H, h];
end

n4=1000;
delta=10^(-10);
arrD=[]; 
FT4=[];
while delta<0.001
    y0=y0+delta;
    delta=delta*5;
    [X4,Y4] = ElerKoshi(a,b,y0,n4);
    for i=1:length(X4)
        TY4(i) = tochnY(X4(i));
    end
    arrD=[arrD, delta];
    FT4=[FT4, norm(TY4-Y4, inf)];
end

figure
hold on
grid on
plot(xx,TY1,'r')
plot(X1,Y1,'g')
plot(X2,Y2,'b')
legend('точное решение','для h=0.1','для h=0.2')
title('Графики точного и полученных решений на отрезке')

figure
hold on
grid on
plot(X1,arrOsh1)
plot(X2,arrOsh2)
legend('для h=0.1','для h=0.2')
title('Графики ошибки на заданном отрезке')

%
figure
loglog(H, FT3, 'g', H, H.^2, 'r')
hold on
grid on
legend('фактическая точность', 'h^2')
title('График зависимости фактической точности от величины шага')

figure
loglog(arrD,FT4)
hold on 
grid on
legend('фиксированный шаг h = 0,002')
title('График зависимости нормы ошибки от величины возмущения')