function val=question_1(k)
global vlast BETTA k0 kt theta delta
%smooth out the previous value function
g=interp1(k0,vlast,k,'linear');
%Calculate consumption with given paraameters
c=kt^theta -k + kt*(1-delta);
if c <= 0
    %to keep values from going negative
    val=-888-800*abs(c);
else
    %calculate the value of the value function at k
    val=log(c)+BETTA*g;
end
%change value to negative since program finds minimum
val=-val;