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
    T = Hansen_Simple_LL.static_resid_tt(T, y, x, params);
end
residual = zeros(8, 1);
residual(1) = params(1)*params(3)*y(5);
residual(2) = y(1)-y(4)/(1-params(4))-y(2);
residual(3) = y(1)*params(6)-y(2)*params(7)+params(5)*((1-params(8))*y(3)-y(3));
residual(4) = y(1)-y(3)-y(5);
lhs = y(6);
rhs = y(6)*params(2)+x(1);
residual(5) = lhs - rhs;
lhs = y(1);
rhs = y(6)+y(3)*params(9)+y(4)*(1-params(9));
residual(6) = lhs - rhs;
lhs = params(12)*y(7);
rhs = y(1)*params(6)-y(2)*params(7);
residual(7) = lhs - rhs;
lhs = y(8);
rhs = y(1)-y(4);
residual(8) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
