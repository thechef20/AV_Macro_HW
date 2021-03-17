syms kt kt1 delta sigma theta k beta
clc;
L = ((kt^theta -kt1 +(1-delta)*kt)^(1-sigma)-1)/(1-sigma);
pretty(L);
LL = diff(L,kt1);
pretty(LL);

LLL = -(k^theta +(1-delta)*k-k)^sigma +beta*(-(k^theta-(1-delta)*k-k)^(-sigma)*(k^(theta-1)*theta+(1-delta)));
pretty(LLL)
solve(LLL==0)