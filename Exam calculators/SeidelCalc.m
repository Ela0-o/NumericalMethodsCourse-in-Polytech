A = [12,1,2;1,16,1;2,1,10]; %������� ���� �������
det(A); %������� ������������ ������� (~=0)
% x = [2;2;2];
% b = A*x
b = [30;36;26]; %������� ������ ������ ����� �������
eps = 10^(-1); %������� ��������, � ������� ����������� �������
n=3; % ������ ������� �

it = 0; 
% �������������� ������� � ���� x = alpha*x+betta
alpha = zeros(n,n); % ������� �����
beta = zeros(n,1);% ������� ����
% ���� ���������� ������� ����� � ���a
for i = 1:n 
    for j = 1:n
        if i~=j
            alpha(i,j) = -A(i,j)/A(i,i);
        end
        beta(i) = b(i)/A(i,i);
    end
end
alpha
beta
err = 1 + eps;
x = beta;
a=0;
% ���������� (3.12) �� �����������
while err > eps
    newX = zeros(n,1); 
    for i = 1:n
        for j = 1:n
            if j<i
                newX(i) = newX(i) + alpha(i,j)*newX(j);
            end
            if j>i
                newX(i) = newX(i) + alpha(i,j)*x(j);
            end
        end
        newX(i) = newX(i) + beta(i);
    end
    it = it + 1
    err = norm(newX-x)
    x = newX
end