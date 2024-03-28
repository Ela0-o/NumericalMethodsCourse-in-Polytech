function x1 = Rotation(A, b)
    [n,n] = size(A);   
    [n,m] = size(b);
    for i = 1:n
        for j = i+1:n
            c = A(i,i)/sqrt((A(i,i))^2 + (A(j,i))^2 ); % cos(ф)
            s = A(j,i)/sqrt((A(i,i))^2 + (A(j,i))^2 ); % sin(ф)
            
            Ai = c*A(i,:) + s*A(j,:); % для i-той строки
            Aj = -s*A(i,:) + c*A(j,:); % для j-той строки
            A(i,:) = Ai;
            A(j,:) = Aj;
            
            bi = c*b(i)+s*b(j);
            bj = -s*b(i)+c*b(j);
            b(i) = bi;
            b(j) = bj;
        end
    end  
    %обратный ход (методом Гаусса)
    A = [A,b];
    for i = n:-1:1
       sum = 0;
       for j = i+1:n
           sum = sum + A(i,j)*x1(j);
       end
       x1(i) = (A(i,n+1) - sum)/A(i,i);
    end
    x1
end