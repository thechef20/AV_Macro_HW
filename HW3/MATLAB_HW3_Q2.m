clear;clc;clf;
global vlast BETTA k0 kt theta delta sigma e


%Calibration
BETTA=0.95;
theta = 0.3;
delta = 0.025;
sigma = 1.5;
e = 20;
%Number of gridpoints
numgrid=100;
disp(" need to fix")
steady=1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% need to fix
maxk=1.5*steady;
mink = 0.5*steady;
%setting grid, we will start one grid value above 0
k0=linspace(mink,maxk,numgrid);