clear; clc;clf;


% goal to find y_t=y_t+1

yt=[];
kt=[];
delta = .25

%For loop to define values for k_t and k_{t+1} for plot
%Calculate every 1/100 in order to plot

for jj=1:100
    val = jj/100
    yt[jj] = 5*kt[jj]^.2*ht^.8
    ktvals1[jj] = 
    kt[jj+1] = ((1-cig)kt[jj]+val
end
