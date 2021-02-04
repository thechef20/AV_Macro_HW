clear;clc;


kgolden=(1.5/.12)^(1/.6);
LLL = (1.5/.12);
pow = .6;
sig=.26*kgolden/(5*kgolden^0.2);

sigval=zeros(101,1);
cssval=zeros(101,1);
tech = 10;
for jj=1:100001
    val=(jj-1)/1000;
    sigval(jj)=val;
    kss=(tech*val/LLL)^pow;
    cssval(jj)=(1-val)*tech*kss^(1-pow);
end

plot(cssval)

[a,b]=max(cssval);
'maximum steady state consumption per worker';
a
'saving rate to maximize steady state consumption per worker'
sigval(b)