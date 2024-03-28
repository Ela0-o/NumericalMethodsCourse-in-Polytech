function [N, arrGE,arrFE] = Runge(a,b,exactVal)
    arrFE = [];
    arrGE = [];
    N = [];
    for i = 1:10
        eps = 10^(-i);
        arrFE = [arrFE,eps];
        m = 1;
        I2m = threeEight(a,b,m);
        Im=0;
        k=0;
        while abs(I2m - Im)/15 > eps
            m = m*2;
            Im = I2m;
            I2m = threeEight(a,b,m);
            k=k+1;
        end
        N = [N,k];
        givenErr = abs(exactVal-I2m);
        arrGE = [arrGE,givenErr];
    end
end