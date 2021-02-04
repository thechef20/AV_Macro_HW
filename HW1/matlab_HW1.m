%last edited 3/2/21
%Matthew Chistolini

%% Queston 2


%Pre-define vectors for k_t and k_{t+1}
ktvals=zeros(1001,1);
kt1vals=zeros(1001,1);

for jj=1:1001
    val=jj/10-0.1;
    ktvals(jj,1)=val;
    kt1vals(jj,1)=(0.9*val+1.5*val^(0.4))/1.02;
end

a=figure;
plot(ktvals,ktvals)
hold on
plot(ktvals,kt1vals)
ylabel('k_{t+1}')
xlabel('k_t')
[a,b] =min(abs(ktvals(2:end,1)-kt1vals(2:end,1)))
saveas(gcf,'stedy_state_1.png')