function [X,Y,h] = finiteDiff(a,z,y0,n)
    % xy''+y'+y = log(x);
    p=@(x)(1/x);
    q=@(x)(1/x);
    f=@(x)(log(x)./x);
    h = (z-a)/n;
    X=a+(0:n).*h;

    Y=zeros(1,n+1);
    A=zeros(n+1,n+1); 
    B=zeros(n+1,1);
    
    b(1) = 0;
    c(1) = 1;
    d(1) = 0;
    r(1) = y0;
    
    A(1,1) = c(1); 
    A(1,2) = d(1);
    B(1) = r(1);
    
    delta(1) = -d(1)/c(1);
    lambda(1) = r(1)/c(1);
    
    for i = 2:n
        b(i) = (1-(h*p(X(i))/2));
        c(i) = -(2-(h^2*q(X(i))));
        d(i) = (1+(h*p(X(i))/2));
        r(i) = (f(X(i))*h^2);
        
        A(i,i-1) = b(i);
        A(i,i) = c(i);
        A(i,i+1) = d(i);
        B(i) = r(i);
        
        delta(i) = -A(i,i+1)/(A(i,i-1)*delta(i-1)+ A(i,i));
        lambda(i) = (B(i)-A(i,i-1)*lambda(i-1))/(A(i,i-1)*delta(i-1)+A(i,i));
    end
    b(n+1) = 0;
    c(n+1) = 1;
    d(n+1) = 0;
    r(n+1) = tochnY(z);
    
    A(n+1,n+1) = c(n+1);
    A(n+1,n) = b(n+1);
    B(n+1) = r(n+1);
    
    delta(n+1) = 0;
    lambda(n+1) = (B(n+1)-A(n+1,n)*lambda(n))/(A(n+1,n)*delta(n)+A(n+1,n+1));
    Y(n+1) = lambda(n+1);
    for i = n:-1:1
        Y(i) = delta(i)*Y(i+1)+lambda(i);
    end
end
