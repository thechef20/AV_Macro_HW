%last edited 2/9/21
%Matthew Chistolini


%% Question 2
clear 
capital_val(1)=67.32;
output_vals(1) = 10*capital_val(1)^.4;
consumption_values = output_vals(1)*(1-.15);
for jj=2:11
    capital_val(jj,1)=(0.9*capital_val(jj-1,1)+1.5*capital_val(jj-1,1)^(0.4))/1.02;
    output_vals(jj,1) =10*capital_val(jj-1,1)^.4;
    consumptuion(jj,1) = output_vals(jj,1)*(1-.15);
end
for jj=11:100
    capital_val(jj,1)=(0.9*capital_val(jj-1,1)+3*capital_val(jj-1,1)^(0.4))/1.02;
    output_vals(jj,1) =10*capital_val(jj-1,1)^.4;
    consumptuion(jj,1) = output_vals(jj,1)*(1-.3);
end
plot(capital_val)
ylabel('k')
xlabel('Peroids')
title("Capital per worker")
saveas(gcf,'pics/HW1_Q2_a.png')
clf
plot(output_vals)
ylabel('Output')
xlabel('Peroids')
title("Output per worker")
saveas(gcf,'pics/HW1_Q2_b.png')
clf
plot(consumptuion)
ylabel('Consumption')
xlabel('Peroids')
title("Consumption per worker")
saveas(gcf,'pics/HW1_Q2_c.png')
%% Question 3

clear

%Steady state value
kss=84.1078;

%Pre-defining matrices
capital_val=zeros(100,1);
yval=zeros(100,1);

%Loop to simulate

capital_val(1)=kss;
z_values(1) = exp(0.1*normrnd(0,1)) ;
yval(1)=5*kss^0.4*z_values;

for j=2:100
    z_values(j) = z_values(j-1)^0.6* exp(0.1*normrnd(0,1));
    capital_val(j)=(1/1.01)*(0.975*capital_val(j-1)+0.1*yval(j-1));
    yval(j)=5*z_values(j)*capital_val(j)^0.4;
end

clf
plot(capital_val)
ylabel('Capital')
xlabel('peroids')
title("Capital per Worker")
saveas(gcf,'pics/HW1_Q3_b1.png')

clf
plot(yval)
ylabel('Output')
xlabel('Peroids')
title("Consumption per worker")
saveas(gcf,'pics/HW1_Q3_b2.png') 
%%

clear

%Steady state value
kss=84.1078/2;

%Pre-defining matrices
capital_val=zeros(100,1);
yval=zeros(100,1);

%Loop to simulate

capital_val(1)=kss;
z_values(1) = exp(0.1*normrnd(0,1));
yval(1)=5*z_values*kss^0.4;

for j=2:100
    z_values(j) = z_values(j-1)^0.6* exp(0.1*normrnd(0,1));
    capital_val(j)=(1/1.01)*(0.975*capital_val(j-1)+0.1*yval(j-1));
    yval(j)=5*z_values(j)*capital_val(j)^0.4;
end

clf
plot(capital_val(2:end))
ylabel('Consumption')
xlabel('peroids')
title("Consumption per worker")
saveas(gcf,'pics/HW1_Q3_c1.png')

clf
plot(yval(2:end))
ylabel('Output')
xlabel('Peroids')
title("Output per worker")
saveas(gcf,'pics/HW1_Q3_c2.png') 

%% Question 4
clear 
sub_divisions = 1/100;
n = 10
delta = .1
A_bar = .5
k_plus_valus= [];
k_values = [];
for i=sub_divisions:sub_divisions:n
kvals(round(i*(1/sub_divisions)))= i;
sigma= 1/(1+.25*i^(-0.75));
k_plus_valus(round(i*(1/sub_divisions))) = ((1-delta)*i +sigma*A_bar*i^.4)*(1/1.02);
end

plot(kvals',k_plus_valus')
xlabel("k_t Values")
ylabel("k_{t+1} Values")
saveas(gcf,'pics/HW1_Q4.png') 




