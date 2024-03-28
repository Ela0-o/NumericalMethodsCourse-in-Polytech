A = [3, 1, 2;
     1, 2, 1;
     2, 1, 3];
eps = 10^(-6);
n = length(A);
i_0 = 0; 
j_0 = 0;
key = 0;
%ищем ключевой элемент и фиксируем его индексы
for k = 1:n
    for l = (k+1):n
        if(abs(A(k,l))> key)
            key = abs(A(k,l));
            i_0 = k;
            j_0 = l;
        end
    end
end 
i_0
j_0

M = 1;
it = 0;
%итерационный процесс
while(M^2 > eps)
    it
    % вычисляем косинус и синус
    alpha = 0.5*atan(2*A(i_0,j_0)/(A(i_0,i_0)-A(j_0,j_0)))
    c = cos(alpha)
    s = sin(alpha)

    T = eye(n);
    for i=1:n
        for j=1:n
            if(((i == i_0 &&  j == i_0)) || (i == j_0 &&  j == j_0))
                T(i,j) = c;
            end
            if(i == j_0 &&  j == i_0)
                T(i,j) = s;
            end
            if(i == i_0 &&  j == j_0)
                T(i,j) = -s;
            end
        end
    end
    B = T'* A * T;
    T
    B

    %вычисляем собственные векторы
    if (it==0)
        X = T;
    else 
        X = X * T;
    end
    X

    %ещё раз находим максимальное по модулю число
    key = 0;
    for k = 1:n
        for l = (k+1):n
            if(abs(B(k,l)) > key)
                key = abs(B(k,l));
                i_0 = k;
                j_0 = l;
            end
        end
    end
    M = key

    A = B;     
    it = it + 1;
end
%собственные числа
L1 = zeros(1,n);
for h = 1:n
    L1(h) = A(h,h);
end
X
L1
it