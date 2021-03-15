function val=valfun(k)
global vlast BETTA ALFA k0 kt
%smooth out the previous value function
g=interp1(k0,vlast,k,'linear');
%Calculate consumption with given paraameters
c=kt^ALFA-k;
if c <= 0
    %to keep values from going negative
    val=-888-800*abs(c);
else
    %calculate the value of the value function at k
    val=log(c)+BETTA*g;
end
%change value to negative since program finds minimum
val=-val;