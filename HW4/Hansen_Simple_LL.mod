%The basic Hansen model from section 6.1 of ABCs of RBCs by McCandless (2008)

%Closes all figure windows

close all;

%Define variables (var are endogenous parameters, varexo denotes the exogenous
%shocks (technically the innovations to the shocks, i.e. the random numbers),
%paremters are self explanatory)

% below are the var bars
var y c k h r lambda i w;
varexo epsilon;
parameters BETTA GAMMA RBAR HBAR KBAR YBAR CBAR DELTA THETA A SIGMA IBAR;

%Calibration (defining parameters)
GAMMA=0.95;
THETA=0.36;
BETTA=0.99;
DELTA=0.025;
A=1.72;
SIGMA=0.00322;
%SIGMA=1;
%These parameters are calculated by the steady states
RBAR=(1/BETTA)+DELTA-1;
HBAR=(1/A)*(1-THETA)/(1-(DELTA*THETA/RBAR)+(1/A)*(1-THETA));
KBAR=HBAR*((THETA/((1/BETTA)-(1-DELTA)))^(1/(1-THETA)));
YBAR=KBAR^THETA*HBAR^(1-THETA);
CBAR=YBAR-DELTA*KBAR;
IBAR=YBAR-CBAR;


%Model
%Can either include an equals sign or type something that is equal to 0
%Take note of the timing of variables.  Dynare uses the time that the variable
%is determined, not when it is observed.  You will see this with k.
%Also note that the expectations operator is not needed.
model;
c-c(+1)+BETTA*RBAR*r(+1);
y-h/(1-HBAR)-c;
% use k(-1) b/c it is already determined
YBAR*y-CBAR*c+KBAR*((1-DELTA)*k(-1)-k);
y-k(-1)-r;
lambda=GAMMA*lambda(-1)+epsilon;
y=lambda+THETA*k(-1)+(1-THETA)*h;
IBAR*i=YBAR*y-CBAR*c;
w=y-h;
end;


%Calculates steady states
%All values are 0 since the model is log linearized
steady_state_model;
c = 0;
r = 0;
y = 0;
k=0;
lambda=0;
w=0;
i=0;
end;


%Dynare checks the steady state to make sure it is correct
steady;

%Define the variance of the innovations to the shocks
shocks;
var epsilon = SIGMA^2;
end;

%Complete the first-order approximation
%Can modify to include certain calculations or exclude (moments, IRFs, etc.)
stoch_simul( order = 1);
