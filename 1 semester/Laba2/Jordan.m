function x1 = Jordan(A, b)
    [n,n] = size(A);   
    [n,m] = size(b);
    x1 = rand(n,1);
     for k = 1:n
         b(k) = b(k)/A(k,k);
         for j = n:-1:k
             A(k,j) = A(k,j)/A(k,k);
         end
         for i = 1:n
             if (i ~= k)
                 b(i) = b(i) - A(i,k)*b(k);
             end
         end
         for j = n:-1:k
             for i = 1:n
                 if (i ~= k)
                     A(i,j) = A(i,j) - A(i,k)*A(k,j);
                 end
             end
         end
     end
    for h = 1:n
        x1(h) = b(h);
    end
end