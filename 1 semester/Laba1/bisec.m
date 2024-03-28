%метод половинного деления для алгебраической функции
func1 = inline('(x.^3).*2 - (x.^2).*9 - x.*60 + 1');

arrE1 = [];
arrIt1 = [];
arrL1 = [];

for i = 1:10
    
    it1 = 0;
    a1 = -1;
    b1 = 1;
    eps1 = 10^(-i);
    delta1 = 0.000000000001;
    
    while (abs(b1-a1) > 2*eps1)
        c1 = (a1+b1)/2;
        
        if ((b1-a1) < 2*eps1)
            break
        end
        
        if ((abs(func1(c1))) < delta1)
            break
        end
        
        if ((func1(a1))*(func1(c1)) < 0)
            b1 = c1;
        else
            a1 = c1;
        end
        it1 = it1 + 1;
        
    end
    
    arrIt1 = [arrIt1, it1];
    arrE1 = [arrE1, eps1];
    arrL1 = [arrL1, abs(b1-a1)];
    
end
ksi1 = c1;

%метод половинного деления для трансцендентной функции
func2 = inline('((2.^x).*x) - 1');

arrE2 = [];
arrIt2 = [];
arrL2 = [];

for i = 1:10
    
    it2 = 0;
    a2 =-1;
    b2 = 4;
    eps2 = 10^(-i);
    delta2 = 0.000000000001;
    
    while (abs(b2-a2) > 2*eps2)
        c2 = (a2+b2)/2;
        
        if ((b2-a2) < 2*eps2)
            break
        end
        
        if ((abs(func2(c2))) < delta2)
            break
        end
        
        if ((func2(a2))*(func2(c2)) < 0)
            b2 = c2;
        else
            a2 = c2;
        end
        
        it2 = it2 + 1;
        
    end
    arrIt2 = [arrIt2, it2];
    arrE2 = [arrE2, eps2];
    arrL2 = [arrL2, abs(b2-a2)];
end
ksi2 = c2;

disp([ksi1 ksi2]);
disp([arrIt1 arrIt2]);
disp([arrE1 arrE2]);
disp([arrL1 arrL2]);

%Графики

X = -10:0.01:10;
func1 = F(X);
func2 = G(X);

%
figure
subplot(2,1,1)
hold on
grid on
axis([-3,3,-10,10])
plot(X, func1, 'g');
plot(ksi1, 0, 'p');
title('Graph of an algebraic function');
xlabel('X');
ylabel('Y');
legend('function','root')

subplot(2,1,2)
hold on
grid on
axis([-3,3,-10,10])
plot(X, func2, 'b');
plot(ksi2, 0, 'p');
title('Graph of a transcendental function');
xlabel('X');
ylabel('Y');
legend('function','root')

%
figure
semilogx(arrE1, arrIt1, 'g')
hold on
grid on
semilogx(arrE2, arrIt2, 'b')
hold on
grid on
legend('algebraic','transcendental')
title('Graph N_i(eps)');
xlabel('eps');
ylabel('N');

%
figure
semilogx(arrL1, arrIt1, 'g')
hold on
grid on
semilogx(arrL2, arrIt2, 'b');
hold on
grid on
legend('algebraic','transcendental')
title('Graph N_i(length)');
xlabel('length');
ylabel('N');

