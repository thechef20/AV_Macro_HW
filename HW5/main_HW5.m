clc;
clear
cd /Users/matt/Desktop/Advanced_Macro/HW/HW5
%set parameters (pre change)
Beta=.99;
z=.005;
SUSbar=.5;
kt=@(k) .95*k;
kBarOld = exp(1.66);

%initalize High Beta
ktm1valsC1=zeros(101,1);
SUStm1C1= zeros(101,1);
kbarNew=exp(1.78);
SUSt=@(k) .7+(.19*k);
SUSbar=.7;
ktm1valsC1(1) = (kBarOld/kbarNew)-1;
%insert simulation below
SUStm1C1(1)=SUSt(ktm1valsC1(1));
for i=2:101
    ktm1valsC1(i) = kt(ktm1valsC1(i-1));
    SUStm1C1(i)=SUSt(ktm1valsC1(i));
end

%% time for low z
clf; clc;
ktm1valsC2=zeros(101,1);
SUStm1C2= zeros(101,1);
kbarNew=exp(1.77);
SUSt=@(k) .5+(.14*k);
SUSbar=.5;
ktm1valsC2(1) = (kBarOld/kbarNew)-1;
%insert simulation below
SUStm1C2(1)=SUSt(ktm1valsC2(1));
for i=2:101
    ktm1valsC2(i) = kt(ktm1valsC2(i-1));
    SUStm1C2(i)=SUSt(ktm1valsC2(i));
end
subplot(1,2,1)
plot(SUStm1C1,'--r','linewidth',2)
hold on 
x = [0,100];
y = [0.7, 0.7];
plot(x,y,'b','lineWidth',2);
title('High \beta Graph')
ylabel('High \beta Calibration')
xlabel('Horizon')
legend('SUS_t')
axis([0 100 0.65 0.72])

subplot(1,2,2)
plot(SUStm1C2,'--r','linewidth',2)
hold on 
x = [0,100];
y = [0.5, 0.5];
plot(x,y,'b','lineWidth',2);
title('Low z Graph')
ylabel('Low \beta Calibration')
xlabel('Horizon')
legend('SUS_t')
axis([0 100 0.45 0.52])
saveas(gcf,'Q1_figure.png');

