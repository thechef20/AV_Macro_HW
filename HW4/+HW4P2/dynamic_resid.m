function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = HW4P2.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(6, 1);
lhs = y(3);
rhs = params(12)*y(1)+(1-params(12))*y(7);
residual(1) = lhs - rhs;
residual(2) = (1-params(12))*(1-(1+y(7))*params(6))*T(1)*T(2)*(1+params(12)*y(1)-params(12)*y(7))-params(13)*params(9)*params(10)*(1+y(8)+y(5));
residual(3) = y(5)-y(10)+params(12)*params(5)*params(3)*y(9)/y(6);
lhs = y(8);
rhs = params(2)*y(2)+x(it_, 1);
residual(4) = lhs - rhs;
residual(5) = T(2)*(1-params(12))*T(1)*(1+params(12)*y(1)-params(12)*y(7)-params(1)*(1+y(3)-y(7)));
lhs = y(4);
rhs = y(3)-y(7);
residual(6) = lhs - rhs;

end
