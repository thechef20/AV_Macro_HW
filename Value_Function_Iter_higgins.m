%Based on code available from ABCs of RBCs by McCandless available here: https://ucema.edu.ar/~gtm/The_ABCs_of_RBCs/
clear;
global vlast BETTA ALFA k0 kt


%Calibration
BETTA=0.96;
ALFA=0.4;

%Number of gridpoints
numgrid=100;

%For this, I will set the max to 1.5*steady state
steady=(1/(BETTA*ALFA))^(1/(ALFA-1));
maxk=1.5*steady;
%setting grid, we will start one grid value above 0
grid=maxk/numgrid;
k0=grid:grid:maxk;


%set initial guess of value function
vlast=zeros(1,numgrid);
%define value function for next iterations and k in order to save time
v=vlast;

%Maximum iterations and tolerance level
maxits=50000;
tol=0.001;
%begin the recursive calculations
jk=1;
while jk<=maxits
    for j=1:numgrid
        kt=k0(j);
        %find the maximum of the value function (minus the minimum)
        ktp1=fminbnd(@valfun,0,maxk);
        %Note: valfun calculates the negative of the value function since
        %fminbnd finds a minimum
        v(j)=-valfun(ktp1);
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

%Plot the final value function
plot(k0,vlast)

%compare to the actual value function
%Pre-define
trueval=vlast;
%calculate true values for each k0
for jj=1:numgrid
    trueval(jj)=(log(1-ALFA*BETTA)+(BETTA*ALFA/(1-ALFA*BETTA))*log(BETTA*ALFA))/(1-BETTA)+...
        (ALFA/(1-ALFA*BETTA))*log(k0(jj));
end
hold on
plot(k0,trueval);

