A = [];
B = [];
size = ;
for i = 1 : size %заполняем правую и левую треугольные матрицы еденицами по диагонали и обнуляем диагональную
    for j = 1 : size
        if (i > j || i < j)
            L(i, j) = 0;
            R(i, j) = 0;
        else
            L(i, j) = 1;
            R(i, j) = 1;
        end
            D(i, j) = 0;
    end
end

for k = 1 : size%Приравниваем диагональные элементы соотв элементам из основной матрицы
    D(k, k) = A(k, k);
    for s = 1 : k - 1%Вычисляем окончательно диагональную матрицу с конца диагонали
        D(k, k) = D(k, k) - L(k, s) * D(s, s) * R(s, k);
    end
    %Работаем с правой матрицей
    for j = k + 1 : size %Приравниваем элемент соотв элементу исходной матрицы
        R(k, j) = A(k, j);
        for s = 1 : k - 1%Вычитаем в соотв с формулой
            R(k, j) = R(k, j) - L(k, s) * D(s, s) * R(s, j);
        end
        R(k, j) = R(k, j) ./ D(k, k);%финальное деления на соотв элемент диагональной
    end
    %работаем с левой матрицей (аналогично)
    for i = k + 1 : size
        L(i, k) = A(i, k);
        for s = 1 : k - 1
            L(i, k) = L(i, k) - L(i, s) * D(s, s) * R(s, k);
        end
        L(i, k) = L(i, k) ./ D(k, k);
    end
end
%Вычисляем СЛАУ сведенную к трем уравнениям
%Lz=b
%Dy=z
%Rx=y
B1=B';
%z=L\B1;
%y=D\z;
%X=R\y;

for i=1:size
    z(i)=0;
end
z(1)=B(1)/L(1,1);
for i=2:size
    for j=1:i-1
        z(i)=z(i)+L(i,j)*z(j);
    end
    z(i)=(B(i)-z(i))/L(i,i);
end
for i=1:size
    y(i)=z(i)/D(i,i);
end
for i=1:size
    X(i)=0;
end
X(size) = y(size)/R(size, size);

for i = 2 : size
    for j = 1 : i - 1
    X(size + 1 - i) = X(size + 1 - i) + R(size + 1 - i, size + 1 - j) * X(size + 1 - j);
    end

    X(size + 1 - i) = (y(size + 1 - i) - X(size + 1 - i)) / R(size + 1 - i, size + 1 - i);
end 
