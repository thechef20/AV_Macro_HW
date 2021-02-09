%last edited 3/2/21
%Matthew Chistolini

%% Question 1 and 2

%part b
%Pre-define vectors for k_t and k_{t+1}
num_of_peroids = 100;
data_points_per_peroid = 10;
total_num_points = num_of_peroids*data_points_per_peroid;
ktvals=zeros(total_num_points,1);
kt1vals=zeros(total_num_points,1);

for jj=1:total_num_points
    val=jj/data_points_per_peroid-1/data_points_per_peroid;% why -.1
    ktvals(jj,1)=val;
    kt1vals(jj,1)=(0.9*val+1.5*val^(0.4))/1.02;
end

plot(ktvals,ktvals)
hold on
plot(ktvals,kt1vals)
hold off
ylabel('k_{t+1}')
xlabel('k_t')
[a,b] =min(abs(ktvals(2:end,1)-kt1vals(2:end,1)))
saveas(gcf,'stedy_state_1_.png')

%part c
%% Question 2
clear 
capital_val(1)=67.32;
output_vals(1) = 10*capital_val(1)^.4
consumption_values = output_vals(1)*(1-.15)
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
%%

clear

%Steady state value
kss=84.1078;

%Pre-defining matrices
capital_val=zeros(100,1);
yval=zeros(100,1);

%Loop to simulate

capital_val(1)=kss;
z_values(1) = exp(0.1*normrnd(0,1)) 
yval(1)=5*kss^0.4*z_values;

for j=2:100
    z_values(j) = z_values(j-1)^0.6* exp(0.1*normrnd(0,1));
    capital_val(j)=(1/1.01)*(0.975*capital_val(j-1)+0.1*yval(j-1));
    yval(j)=5*z_values(j)*capital_val(j)^0.4;
end

clf
plot(capital_val(2:end))
ylabel('Capital')
xlabel('peroids')
title("Capital per Worker")
saveas(gcf,'pics/HW1_Q3_b1.png')

clf
plot(yval(2:end))
ylabel('Output')
xlabel('Peroids')
title("Consumption per worker")
saveas(gcf,'pics/HW1_Q3_b2.png') 
%%

clear

%Steady state value
kss=84.1078/2

%Pre-defining matrices
capital_val=zeros(100,1);
yval=zeros(100,1);

%Loop to simulate

capital_val(1)=kss;
z_values(1) = exp(0.1*normrnd(0,1)) 
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



