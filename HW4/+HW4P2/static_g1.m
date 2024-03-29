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
    T = HW4P2.static_g1_tt(T, y, x, params);
end
g1 = zeros(6, 6);
g1(1,1)=1;
g1(1,4)=(-params(12));
g1(1,5)=(-(1-params(12)));
g1(2,3)=(-(params(13)*params(9)*params(10)));
g1(2,4)=(1-params(12))*(1-(1+y(5))*params(6))*params(12)*T(1)*T(2);
g1(2,5)=T(1)*T(2)*(1+params(12)*y(4)-params(12)*y(5))*(1-params(12))*(-params(6))+(1-params(12))*(1-(1+y(5))*params(6))*(-params(12))*T(1)*T(2);
g1(2,6)=(-(params(13)*params(9)*params(10)));
g1(3,1)=params(12)*params(5)*params(3)*1/y(4);
g1(3,4)=params(12)*params(5)*params(3)*(-y(1))/(y(4)*y(4));
g1(4,6)=1-params(2);
g1(5,1)=T(2)*(1-params(12))*T(1)*(-params(1));
g1(5,4)=params(12)*T(2)*(1-params(12))*T(1);
g1(5,5)=T(2)*(1-params(12))*T(1)*(params(1)-params(12));
g1(6,1)=(-1);
g1(6,2)=1;
g1(6,5)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
