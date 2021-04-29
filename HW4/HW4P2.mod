%The basic Hansen model from section 6.1 of ABCs of RBCs by McCandless (2008)

%Closes all figure windows

close all;

%Define variables (var are endogenous parameters, varexo denotes the exogenous
%shocks (technically the innovations to the shocks, i.e. the random numbers),
%paremters are self explanatory)

var y w c k h a;
varexo epsilon;
parameters WBAR ROW BETTA GAMMA RBAR HBAR KBAR YBAR ABAR CBAR DELTA THETA A SIGMA IBAR;

%Calibration (defining parameters)
GAMMA=0.95;
ABAR = 0.01; %added this, ask higgins
WBAR = 0.01; %added this, ask higgins
THETA=0.35; %updated
BETTA=0.99; %updated
DELTA=0.025; %updated
A=1.75; %updated
SIGMA=1; %0.00322 replaced this value with 1
ROW = 0.8; %we are very unsure

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

% EQUATION 1
    y = THETA*k(-1) + (1-THETA)*h; %updated EQ1
% EQUATION 2
    (1-THETA)*(1-((1+h)*HBAR))*((KBAR)^THETA*HBAR^(-THETA)*(1+THETA*k(-1)-THETA*h))-A*ABAR*CBAR*(1+a+c); %updated EQ2
% EQUATION 3
    c - c(+1) + RBAR*BETTA*THETA*(y(+1)/k); %updated EQ3
% EQUATION 4
    a = ROW*a(-1)+epsilon; %updated EQ4      %lambda=GAMMA*lambda(-1)+epsilon;
% EQUATION 5
    (1-THETA)*KBAR^THETA*HBAR^(-THETA)*((1+THETA*k(-1)-THETA*h)-(WBAR*(1+(y-h)))); %updated EQ5
% EQUATION 6
    w=y-h; %added this to make it 6-6
end;
%k theta, h , c

%Calculates steady states
%All values are 0 since the model is log linearized
steady_state_model;
c = 0;
h = 0;
% r = 0;
y = 0;
a = 0; %set a steady state value to 0
k=0;
% lambda=0;
w=0;
% i=0;
end;


%Dynare checks the steady state to make sure it is correct
steady;

%Define the variance of the innovations to the shocks
shocks;
var epsilon; stderr 0.01;
end;

%Complete the first-order approximation
%Can modify to include certain calculations or exclude (moments, IRFs, etc.)
stoch_simul( order = 1);
