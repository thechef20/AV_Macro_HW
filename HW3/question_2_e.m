clear;clc;clf;
global vlast BETTA k0 kt theta delta sigma EE


%Calibration
EE = 20;
BETTA=0.95;
theta = 0.3;
delta = 0.025;
sigma = 1.5;
%Number of gridpoints
numgrid=100;

%For this, I will set the max to 1.5*steady state
steady=(((1/BETTA)-(1-delta))/(theta))^(1/(theta-1));
maxk=1.5*steady;
mink = 0.5*steady;
%setting grid, we will start one grid value above 0
k0=linspace(mink,maxk,numgrid);


%set initial guess of value function
vlast=zeros(1,numgrid);
%define value function for next iterations and k in order to save time
v=vlast;

%Maximum iterations and tolerance level
maxits=5000;
tol=0.001;
kt_plus_one_vector = [];
%begin the recursive calculations
jk=1;
while jk<=maxits
    for j=1:numgrid
        kt=k0(j);
        %find the maximum of the value function (minus the minimum)
        ktp1=fminbnd(@function_for_q2_e,0,maxk);
        %Note: valfun calculates the negative of the value function since
        %fminbnd finds a minimum
        kt_plus_one_vector(j)=ktp1;
        v(j)=-function_for_q2_e(ktp1);
    end
    
%if norm of difference vector is less than tolerance level, stop
%otherwise, continue
    if norm(v-vlast)<tol
        jk=maxits+1;
    else
        jk=jk+1;
    end
    vlast=v; 

end
%%
subplot(2,1,1)
%Plot the final value function
plot(k0,vlast, 'lineWidth',2)
title('Value function','Fontsize',16)
subplot(2,1,2)
plot(k0,k0)
hold on
plot(k0,kt_plus_one_vector)
title('Capital Evolution','Fontsize',16)
legend('straight line','K_{t+1}')
saveas(gcf,'pics/HW3_Q2_e_figure.png')
