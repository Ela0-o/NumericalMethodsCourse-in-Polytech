arrSep = []; % точность
arrErr = []; %нормы разности
arrNev = []; %нормы невязки
arrIt = [];% количество итераций
arr_It = []; % количество итераций со сдвигом

eps = 10^(-6); % заданная точность
n = 10;
l = 5;
L = zeros(1,n);
for i = 1:n
    L(i) = l+randn(); 
end
Lo = L;
% цикл заполнения
for i = 0:25 
    L(:) = l + Lo(:)/2^i;
    A = matrixCreation(L,n)
    
    [X,L1,it] = Jakobi(A,n,eps);
    [X_,L1_,it_] = Jakobi(A+(eye(n)),n,eps); % со сдвигом
    max(L1)-min(L1)
    arrSep = [arrSep max(L1)-min(L1)];
    arrErr = [arrErr norm(sort(L)-sort(L1))];
    arrNev = [arrNev norm(A*X - X*diag(L1))];
    arrIt = [arrIt it];
    arr_It = [arr_It it_];
end

figure
subplot(2,1,1)
semilogx(arrSep, arrIt, 'y-')
hold on
grid on
semilogx(arrSep, arr_It, 'b:');
hold on
grid on
ylabel("Число итераций");
xlabel("Отделимость");
legend({'Без сдвига', 'Cо сдвигом'},'Location','northwest');
title("fixed eps");
subplot(2,1,2)
loglog(arrSep,arrNev, 'b')
hold on
grid on
loglog(arrSep,arrErr, 'g') 
hold on
grid on
xlabel("Отделимость")
legend({'Норма невязки','Норма разницы точ. и выч'},'Location','northwest')