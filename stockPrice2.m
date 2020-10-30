function stockPrice2()
x = xlsread('BA10years.xlsx', 'BA10years', 'B3:B19');
s0=x(1);
[n ~]=size(x);
rata_mean=0.0001916;
standar_deviation=0.03143;
tao =  1/n;
myu=(rata_mean/tao)+(standar_deviation^2/2);
sigma = standar_deviation/sqrt(tao);
h=252;
dt=1/h;
S(1)=s0;
t(1)=0;
figure, 
for i=1:1000
    for j=1:1:n
        S(j+1)=S(j)*exp((myu-sigma^2/2)*dt+sigma*sqrt(dt)*randn);
        t(j+1)=j;
    end;
plot(t,S, '-b');
[b a]=size(S);
temp(i)=S(a);
hold on;
end
x1=1:n;
plot(x1,x,'-r');
xlabel('Day')
ylabel('Price')
title('The Boeing Company Stock Price in 2018')
hold off;
temp
l=mean(temp)