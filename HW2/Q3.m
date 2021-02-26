%%Question 3
clc;clf;clear
theta = 0.33; beta =0.98; n=.01;labor_0 = 1000; capital_0 = 5;
cons = (beta/(1+beta))*(1-theta)/(1+n);

capital = [];
cap_one = [];

for i = 0:.001:.4
    capital = [capital;i];
    next_cap = cons*i^theta;
    cap_one = [cap_one; next_cap];

end

plot(capital,cap_one,'LineWidth',3)
hold on
plot(capital,capital,'LineWidth',3)
ylabel('k(t+1)')
xlabel('k(t)')
title("Question 3 part b finding stable stread state solution for capital per worker")
saveas(gcf,'pics/HW1_Q3_b.png')


output = [];
Labor=[labor_0];
capital=[capital_0];
consumption=[];
peroid = [1:1:20];
for i =peroid
    current_peroid_output = ((capital(end)*Labor(end))^theta*Labor(end)^(1-theta))/Labor(end);
    output = [output; current_peroid_output];
    current_peroid_consumption = cons*output(end)^theta;
    consumption = [consumption; current_peroid_consumption];
    next_peroid_capital = cons*capital(end)^theta;
    next_peroid_labor = Labor(end)*(1+n);
    Labor = [Labor; next_peroid_labor];
    capital = [capital; next_peroid_capital];
end

clf;
plot(peroid,output,'LineWidth',3)
ylabel('output per person')
xlabel('time(in peroids)')
title("Question 3 part C output per Worker")
saveas(gcf,'pics/HW1_Q3_c_output.png')


clf
plot(peroid,consumption,'LineWidth',3)
ylabel('consumption per person')
xlabel('time(in peroids)')
title("Question 3 part C Consumption per Worker")
saveas(gcf,'pics/HW1_Q3_c_consumption.png')