clear
clf
n = 4:4:64;
r = 4;
clat = 0;

for j = 1:length(n)
	for i=1:(log(n(j))/log(r))
   	clat = clat + (n(j)/(r^i));
	end
	rca_d(j) = (4*n(j) + 6);
	rca_a(j) = 9*n(j);
	cla_a(j) = 8*n(j) + ((3+r)*r)/2 * clat;
	cla_d(j) = 3 + 8 * ceil(log(n(j))/log(r));
	cska_a(j) = 9*n(j) + 2*(ceil(n(j)/r) - 2);
	cska_d(j) = 8*r + 6 + 2*ceil(n(j)/r);
	csea_a(j) = 22*n(j)  - 13*r + 2*ceil(n(j)/r) - 2;
   csea_d(j) = 4*r + 4*ceil(n(j)/r) + 2;
   
end

figure(1)
plot(n, rca_d,'+')
hold on
%plot(n, rca_d,'x')
plot(n, cla_d,'o')
%plot(n, cla_d,'x')
plot(n, cska_d,'*')
%plot(n, cska_d,'x')
plot(n, csea_d,'s')
%plot(n, csea_d,'x')
legend('RCA', 'CLA', 'CSKA', 'CSEA', 2)
title('Delay Analysis for Several Adder Algorithms')
xlabel('Size')
ylabel('Delay (Delta)')
axis([0 64 0 270])
print -deps delayadder.eps

figure(2)
plot(n, rca_a,'+')
hold on
%plot(n, rca_a,'x')
plot(n, cla_a,'o')
%plot(n, cla_a,'x')
plot(n, cska_a,'*')
%plot(n, cska_a,'x')
plot(n, csea_a,'s')
%plot(n, csea_a,'x')
legend('RCA', 'CLA', 'CSKA', 'CSEA', 2)
title('Area Analysis for Several Adder Algorithms')
xlabel('Size')
ylabel('Area (Gates)')
axis([0 64 0 3000])
print -deps areaadder.eps










