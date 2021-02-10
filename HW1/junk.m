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