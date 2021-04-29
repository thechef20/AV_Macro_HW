function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = Hansen_Simple_LL.static_g1_tt(T, y, x, params);
end
g1 = zeros(8, 8);
g1(1,5)=params(1)*params(3);
g1(2,1)=1;
g1(2,2)=(-1);
g1(2,4)=(-(1/(1-params(4))));
g1(3,1)=params(6);
g1(3,2)=(-params(7));
g1(3,3)=params(5)*(1-params(8)-1);
g1(4,1)=1;
g1(4,3)=(-1);
g1(4,5)=(-1);
g1(5,6)=1-params(2);
g1(6,1)=1;
g1(6,3)=(-params(9));
g1(6,4)=(-(1-params(9)));
g1(6,6)=(-1);
g1(7,1)=(-params(6));
g1(7,2)=params(7);
g1(7,7)=params(12);
g1(8,1)=(-1);
g1(8,4)=1;
g1(8,8)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
