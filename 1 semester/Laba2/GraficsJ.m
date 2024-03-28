n = 10;
m = 1;
cond = 10; %good condition number
badCond = 10^13; %bad condition number

%������ ������� ����
x = rand(n,1);
xNorm = norm(x);
x
xNorm

mWgC = matrixCreation(n, cond); %matrix with good cond
mWbC = matrixCreation(n, badCond); %matrix with bad cond
cWgC = bColumnCreation(mWgC, x); %column b with good cond
cWbC = bColumnCreation(mWbC, x); %column b with bad cond
cWgCnorm = norm(cWgC);
cWbCnorm= norm(cWbC);

arrCond = [];
arrNorm = [];
normX = []; 
arrNgC = [];
arrNbC = []; 
arrCgC = []; 
arrCbC = []; 

%������� ����� �������� ������� � ������������ ������� � ����������� �� ������ ����� ���������������
while cond <= 10^15
    A = matrixCreation(n, cond);     
    b = bColumnCreation(A, x);         
    %����������� ������� ����
    x1 = Jordan(A, b);  
    
    arrNorm = [arrNorm, norm(x-x1)];
    arrCond = [arrCond, cond];
    
    cond = cond*10;
end

%���������� ������������� ������ � ������� �� �������������� ���������� ������ �����
for i = 0.0001:0.0001:0.05
    %��� ������� ����� ���������������
    c1WgC = cWgC + rand(n,1)*i;
    x1WgC = Jordan(mWgC, c1WgC); 
    arrNgC = [arrNgC, norm(x1WgC - x)/xNorm];
    arrCgC = [arrCgC, norm(c1WgC - cWgC)/cWgCnorm];
    
    %��� ������ ����� ���������������
    c1WbC = cWbC + rand(n,1)*i;
    x1Wbc = Jordan(mWbC, c1WbC);
    arrNbC = [arrNbC, norm(x1Wbc - x)/xNorm];
    arrCbC = [arrCbC, norm(c1WbC - cWbC)/cWbCnorm];
end

%____���������� �������� ������������:

% ����� �������� ������� � ������������ ������� �� ����� ���������������
figure
loglog(arrCond, arrNorm);
hold on
grid on
xlabel('cond(A)');
ylabel('norm(x-x1)');

%������������� ������ � ������� �� �������������� ���������� ������ �����
%��� ������� ����� ���������������
figure
loglog(arrCgC, arrNgC, 'pg');
hold on
grid on
xlabel('norm(b-b1) / norm(b)');
ylabel('norm(x-x1) / norm(x)');
title('Good condition');

%������������� ������ � ������� �� �������������� ���������� ������ �����
%��� ������ ����� ���������������
figure
loglog(arrCbC, arrNbC, 'pr');
hold on
grid on
xlabel('norm(b-b1) / norm(b)');
ylabel('norm(x-x1) / norm(x)');
title('Bad condition');