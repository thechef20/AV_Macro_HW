function val=function_for_q2_e(k)
global vlast BETTA k0 kt theta delta sigma EE
%smooth out the previous value function
g=interp1(k0,vlast,k,'linear');
%Calculate consumption with given paraameters
% I am unsruee if k= kt+1 or k =kt
c=kt^theta -k + kt*(1-delta)+EE;
if c <= 0
    %to keep values from going negative
    val=-888-800*abs(c);
else
    %calculate the value of the value function at k
    val=(c^(1-sigma)-1)/(1-sigma)+BETTA*g;
end
%change value to negative since program finds minimum
val=-val;