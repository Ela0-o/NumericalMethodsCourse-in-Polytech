%метод Ньютона для алгебраической функции
func1 = inline('(x.^3).*2 - (x.^2).*9 - x.*60 + 1');
dfunc1 = inline('(x.^2).*6 - x.*18 - 60');

arrE1 = [];
arrIt1 = [];
arrL1 = [];

for i = 1:10
    
    it1 = 0;
    xk_1 = 0;
    xk= 1;
    eps1 = 10^(-i);
    
    while (abs(xk - xk_1) > eps1*abs(xk))
        xk_1 = xk;
        xk = xk - (func1(xk)/dfunc1(xk));
        it1 = it1 + 1;
    end
    ksi1 = xk;
    
    arrIt1 = [arrIt1, it1];
    arrE1 = [arrE1, eps1];
    arrL1 = [arrL1, abs(xk - xk_1)];
    
end

%метод Ньютона для трансцендентной функции
func2 = inline('((2.^x).*x) - 1');
dfunc2 = inline('(2.^x).*(x.*log(2) + x)');

arrE2 = [];
arrIt2 = [];
arrL2 = [];

for i = 1:10
    
    xn_1 = 0;
    xn = 1;
    eps2 = 10^(-i);
    it2 = 0;
    
    while (abs(xn - xn_1) > eps2*abs(xn))
        xn_1 = xn;
        xn = xn - (func2(xn)/dfunc2(xn));
        it2 = it2 + 1;
    end
    ksi2 = xn;
    
    arrIt2 = [arrIt2, it2];
    arrE2 = [arrE2, eps2];
    arrL2 = [arrL2, abs(xn - xn_1)];
    
end

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
semilogx(arrE2, arrIt2, 'b');
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
semilogx(arrL2, arrIt2, 'b')
hold on
grid on
legend('algebraic','transcendental')
title('Graph N_i(length)');
xlabel('length');
ylabel('N');
