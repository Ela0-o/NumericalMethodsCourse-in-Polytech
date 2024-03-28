function [N, arrGE,arrFE] = Runge(a,b,exactVal)
    arrFE = [];
    arrGE = [];
    N = [];
    X = [];
    for i = 1:10
        eps = 10^(-i);
        arrFE = [arrFE,eps];
        m = 1;
        I2m = Cheb(a,b);
        Im=0;
        k=0;
        p = 6;
        while abs(I2m - Im)/(2^p-1) > eps
            m = m*2;
            for i = 0 : m
                x = a + i*(b-a)/m;
                X = [X,x];
            end
            Im = I2m;
            I2m = 0;
            for i = 1:length(X)-1
                I2m = I2m + Cheb(X(i),X(i+1));
            end
            X = [];
            k=k+1;
        end
        N = [N,k];
        givenErr = abs(exactVal-I2m);
        arrGE = [arrGE,givenErr];
    end
end