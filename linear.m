clear
clf
c0 = (1 + 2*sqrt(2) + 2)/(2*1*2);
c1 = -0.5;
bits = 4;
step=2^(-bits);
x = 1:step:2;
y = 1./x;
yapprox = c1*x + c0;
plot(x,y)
hold on
plot(x,yapprox,'x')
title('Linear Approximation of 1/x')
xlabel('x')
ylabel('y')
grid