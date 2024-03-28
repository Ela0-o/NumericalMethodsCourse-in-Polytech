function [x,it] = Seidel(oldA, oldB, eps)
    [n,n] = size(oldA);   
    [n,m] = size(oldB);
    b = zeros(n,1); % ����� b
    A = zeros(n,n);% ����� A
    it = 0;
    
    %b = (A_old)^T * b_old
    for i = 1:n 
        for j = 1:n
            b(i) = b(i) + (oldA(i,j)'*oldB(j));
        end
    end
    
    %A = (A_old)^T * A_old
    for i = 1:n 
        for j = 1:n
            for k = 1:n
                A(i,j) = A(i,j) + (oldA(i,k)' * oldA(k,j));
            end
        end
    end
                
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
     
    err = 1 + eps;
    x = beta;
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
        it = it + 1;   
        err = norm(newX-x);
        x = newX;
    end
end