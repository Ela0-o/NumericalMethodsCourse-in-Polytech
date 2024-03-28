function A = matrixCreation(det,n)
    v = ones(n,1);
    D = diag(v);
    D(1,1) = det;
    w = rand(n,1);
    E = eye(n,n);
    s = norm(w*w');
    Q = E - 2*(w*w')/s;
    A = Q*D*Q';
end