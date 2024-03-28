% a = 0.05;
% b = 0.3;
a = 1;
b = 4;
n1 = 2;
n2 = 3;
n3 = 4;

xx=a:0.001:b;

[x1,y1]=Cheb(n1,a,b);
[x2,y2]=Cheb(n2,a,b);
[x3,y3]=Cheb(n3,a,b);

arrEK1=[];
arrEK2=[];
arrEK3=[];
for i=1:n1+1
    errKnot1=(func(xx)-newton(x1,y1,xx)); 
    arrEK1=[arrEK1;errKnot1];
end
for i=1:n2+1
    errKnot2=(func(xx)-newton(x2,y2,xx)); 
    arrEK2=[arrEK2;errKnot2];
end
for i=1:n3+1
    errKnot3=(func(xx)-newton(x3,y3,xx)); 
    arrEK3=[arrEK3;errKnot3];
end
%максимальная ошибка в узлах
maxEK1=max(arrEK1);
maxEK2=max(arrEK2);
maxEK3=max(arrEK3);

arrEM1=[];
arrEM2=[];
arrEM3=[];
for i=2:n1+1
    mid1(i-1) = (x1(i-1)+x1(i))/2;
    errMid1=(func(xx)-newton(mid1,func(mid1),xx)); 
    arrEM1=[arrEM1;errMid1];
end
for i=2:n2+1
    mid2(i-1) = (x2(i-1)+x2(i))/2;
    errMid2=(func(xx)-newton(mid2,func(mid2),xx)); 
    arrEM2=[arrEM2;errMid2];
end
for i=2:n3+1
    mid3(i-1) = (x3(i-1)+x3(i))/2;
    errMid3=(func(xx)-newton(mid3,func(mid3),xx)); 
    arrEM3=[arrEM3;errMid3];
end
%максимальная ошибка в серединах узлов
maxEM1=max(arrEM1);
maxEM2=max(arrEM2);
maxEM3=max(arrEM3);

figure
hold on
grid on
plot(xx,func(xx),'black')
plot(xx,newton(x1,y1,xx),'r')
plot(xx,newton(x2,y2,xx),'g')
plot(xx,newton(x3,y3,xx),'b')
plot(x1,y1,'or')
plot(x2,y2,'og')
plot(x3,y3,'ob')
legend("сама функция","для 3 узлов","для 4 узлов","для 5 узлов")
title("Графики функций 3-х полиномов")

figure
hold on
grid on
plot(xx,arrEK1,'r')
plot(xx,arrEK2,'g')
plot(xx,arrEK3,'b')
legend("для 3 узлов","для 4 узлов","для 5 узлов")
title("Графики ошибки в узлах")

figure
hold on
grid on
plot(xx,arrEM1,'r')
plot(xx,arrEM2,'g')
plot(xx,arrEM3,'b')
legend("для 3 узлов","для 4 узлов","для 5 узлов")
title("Графики ошибки в серединах узлов")