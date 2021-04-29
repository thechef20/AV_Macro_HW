function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
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
%   residual
%

if T_flag
    T = HW4P2.static_resid_tt(T, y, x, params);
end
residual = zeros(6, 1);
lhs = y(1);
rhs = params(12)*y(4)+(1-params(12))*y(5);
residual(1) = lhs - rhs;
residual(2) = (1-params(12))*(1-(1+y(5))*params(6))*T(1)*T(2)*(1+params(12)*y(4)-params(12)*y(5))-params(13)*params(9)*params(10)*(1+y(6)+y(3));
residual(3) = params(12)*params(5)*params(3)*y(1)/y(4);
lhs = y(6);
rhs = y(6)*params(2)+x(1);
residual(4) = lhs - rhs;
residual(5) = T(2)*(1-params(12))*T(1)*(1+params(12)*y(4)-params(12)*y(5)-params(1)*(1+y(1)-y(5)));
lhs = y(2);
rhs = y(1)-y(5);
residual(6) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
