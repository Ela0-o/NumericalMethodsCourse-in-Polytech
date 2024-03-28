function A = matrixCreation(L,n)
    D = diag(L);
    w = rand(n,1);
    E = eye(n,n);
    s = norm(w*w');
    Q = E - 2*(w*w')/s;
    A = Q*D*Q';
end