function [residual, g1, g2] = dynamic_resid_g1_g2(T, y, x, params, steady_state, it_, T_flag)
% function [residual, g1, g2] = dynamic_resid_g1_g2(T, y, x, params, steady_state, it_, T_flag)
%
% Wrapper function automatically created by Dynare
%

    if T_flag
        T = Hansen_Simple_LL.dynamic_g2_tt(T, y, x, params, steady_state, it_);
    end
    [residual, g1] = Hansen_Simple_LL.dynamic_resid_g1(T, y, x, params, steady_state, it_, false);
    g2       = Hansen_Simple_LL.dynamic_g2(T, y, x, params, steady_state, it_, false);

end
