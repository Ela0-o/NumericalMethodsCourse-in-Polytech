n = 5;
m=1;
A = matrixCreation(0.4,n);
x0 = rand(n,m);
b = A*x0;

eps = 0.1;
eps1 = 10^(-5);

arrErr = [];
arrErr1 = [];
arrNev = [];
arrNev1 = [];
arrIt = [];
arrIt1 = [];
arrEps = [];
arrDet = [];

%det = const
while eps > 10^(-15)
    [x, it] = Seidel(A, b, eps);
    arrErr = [arrErr norm(x-x0)];
    arrNev = [arrNev norm(A*x-b)];
    arrIt = [arrIt it];
    arrEps = [arrEps eps];
    eps = eps*0.1;
end

%eps = const
det = 0.1;
while det > eps1
    A1 = matrixCreation(det,n);
    x1 = rand(n,m);
    b1 = A1*x1;
    [x, it1] = Seidel(A1, b1, eps1);
    arrDet = [arrDet det];
    arrIt1 = [arrIt1 it1];
    arrNev1 = [arrNev1 norm(A1*x-b1)];
    arrErr1 = [arrErr1 norm(x-x1)];
    det = det*0.1;
end

figure
subplot(2,1,1)
semilogx(arrEps,arrIt,'-p')
hold on
grid on
xlabel("Точность")
ylabel("Число итераций")
title('fixed det')
subplot(2,1,2)
loglog(arrEps,arrNev, 'b')
hold on
grid on
xlabel("Точность")
loglog(arrEps,arrErr, 'g') 
hold on
grid on
xlabel("Точность")
legend('Норма невязки','Норма разницы точ. и выч')

figure
subplot(2,1,1)
semilogx(arrDet,arrIt1,'-p')
hold on
grid on
xlabel("Определитель")
ylabel("Число итераций")
title('fixed eps')
subplot(2,1,2)
loglog(arrDet,arrNev1, 'b')
hold on
grid on
loglog(arrDet,arrErr1,'g')
hold on
grid on
xlabel("Определитель")
legend('Норма невязки','Норма разницы точ. и выч.')