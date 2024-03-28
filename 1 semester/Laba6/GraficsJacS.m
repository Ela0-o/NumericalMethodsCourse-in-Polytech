arrSep = []; % ��������
arrErr = []; %����� ��������
arrNev = []; %����� �������
arrIt = [];% ���������� ��������
arr_It = []; % ���������� �������� �� �������

eps = 10^(-6); % �������� ��������
n = 10;
l = 5;
L = zeros(1,n);
for i = 1:n
    L(i) = l+randn(); 
end
Lo = L;
% ���� ����������
for i = 0:25 
    L(:) = l + Lo(:)/2^i;
    A = matrixCreation(L,n)
    
    [X,L1,it] = Jakobi(A,n,eps);
    [X_,L1_,it_] = Jakobi(A+(eye(n)),n,eps); % �� �������
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
ylabel("����� ��������");
xlabel("�����������");
legend({'��� ������', 'C� �������'},'Location','northwest');
title("fixed eps");
subplot(2,1,2)
loglog(arrSep,arrNev, 'b')
hold on
grid on
loglog(arrSep,arrErr, 'g') 
hold on
grid on
xlabel("�����������")
legend({'����� �������','����� ������� ���. � ���'},'Location','northwest')