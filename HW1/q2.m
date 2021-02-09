clear
%set parameters
delta = .1;
sigma = .15;
Abar = 10;
n = .02;
f=@(k) k^(.4);
ss = 67.326;
%initalize
kt1=@(k) (((1-delta)*k)+(sigma*Abar*f(k)))/(1+n);
y=@(k) Abar*f(k);
ktvals=zeros(101,1);
ktvals(1) = ss;
%insert simulation below
yvals=zeros(101,1);
yvals(1)=y(ktvals(1));
cvals=zeros(101,1);
cvals(1)=(1-sigma)*yvals(1);
for i=2:11
    ktvals(i) = kt1(ktvals(i-1));
    yvals(i) = y(ktvals(i));
    cvals(i) = (1-sigma)*yvals(i);
end
sigma = .3;
kt1=@(k) (((1-delta)*k)+(sigma*Abar*f(k)))/(1+n);
for i=12:101
    ktvals(i) = kt1(ktvals(i-1));
    yvals(i)=y(ktvals(i));
    cvals(i) = (1-sigma)*yvals(i);
end
c=figure;
plot(ktvals)
ylabel('k')
print(c,'-dpdf','Q2_kvals.pdf')
%output
d=figure;
plot(yvals)
ylabel('y')
print(d,'-dpdf','Q2_yvals.pdf')
%consumption
e=figure;
plot(cvals)
ylabel('c')
print(e,'-dpdf','Q2_cvals.pdf')


