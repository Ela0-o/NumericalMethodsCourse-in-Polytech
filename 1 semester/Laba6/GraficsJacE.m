arrEps = []; %точность
arrErr = []; %нормы разности
arrNev = []; %нормы невязки
arrIt = [];  %количество итераций
arr_It = []; %количество итераций со сдвигом

n = 10;
L = 10*rand(1,n)
% L = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
A = matrixCreation(L,n);
eps = 0.1;

while eps > 10^(-15)
    eps = eps*0.1;
    [X,L1,it] = Jakobi(A,n,eps);
    [X_,L1_,it_] = Jakobi(A+(eye(n)),n,eps); % со сдвигом
    arrEps = [arrEps eps];
    arrErr = [arrErr norm(sort(L)-sort(L1))];
    arrNev = [arrNev norm(A*X - X*diag(L1))];
    arrIt = [arrIt it];
    arr_It = [arr_It it_];
end
norm(sort(L)-sort(L1))
norm(A*X - X*diag(L1))
L
L1

figure
subplot(2,1,1)
semilogx(arrEps, arrIt, 'y-')
hold on
grid on
semilogx(arrEps, arr_It, 'b:');
hold on
grid on
ylabel("Число итераций");
xlabel("Точность");
legend('Без сдвига', 'Cо сдвигом');
title("good sep");
subplot(2,1,2)
loglog(arrEps,arrNev, 'b')
hold on
grid on
loglog(arrEps,arrErr, 'g') 
hold on
grid on
xlabel("Точность")
legend('Норма невязки','Норма разницы точ. и выч')