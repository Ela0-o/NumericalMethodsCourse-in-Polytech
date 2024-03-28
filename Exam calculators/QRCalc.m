A = [];
n = [];
Q = eye(n);
for i = 1 : (n-1)
    v = zeros(1,n);
    v(i) = A(i,i) + sign(A(i,i)) * Sum(A(:,i), i);
    for j = i + 1 : n
        v(j) = A(j,i);
    end
    H = eye(n) - 2 * ( (v' * v) / (v * v'));
    Q = Q * H;
    A = H * A;
end
R = A;