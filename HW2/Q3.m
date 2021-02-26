%%Question 3
clc;clf;clear
theta = 0.33; beta =0.98; n=.01;
cons = (beta/(1+beta))*(1-theta)/(1+n);

capital = []
cap_one = []

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
