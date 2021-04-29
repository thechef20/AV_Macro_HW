%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'Hansen_Simple_LL';
M_.dynare_version = '4.6.3';
oo_.dynare_version = '4.6.3';
options_.dynare_version = '4.6.3';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('Hansen_Simple_LL.log');
M_.exo_names = cell(1,1);
M_.exo_names_tex = cell(1,1);
M_.exo_names_long = cell(1,1);
M_.exo_names(1) = {'epsilon'};
M_.exo_names_tex(1) = {'epsilon'};
M_.exo_names_long(1) = {'epsilon'};
M_.endo_names = cell(8,1);
M_.endo_names_tex = cell(8,1);
M_.endo_names_long = cell(8,1);
M_.endo_names(1) = {'y'};
M_.endo_names_tex(1) = {'y'};
M_.endo_names_long(1) = {'y'};
M_.endo_names(2) = {'c'};
M_.endo_names_tex(2) = {'c'};
M_.endo_names_long(2) = {'c'};
M_.endo_names(3) = {'k'};
M_.endo_names_tex(3) = {'k'};
M_.endo_names_long(3) = {'k'};
M_.endo_names(4) = {'h'};
M_.endo_names_tex(4) = {'h'};
M_.endo_names_long(4) = {'h'};
M_.endo_names(5) = {'r'};
M_.endo_names_tex(5) = {'r'};
M_.endo_names_long(5) = {'r'};
M_.endo_names(6) = {'lambda'};
M_.endo_names_tex(6) = {'lambda'};
M_.endo_names_long(6) = {'lambda'};
M_.endo_names(7) = {'i'};
M_.endo_names_tex(7) = {'i'};
M_.endo_names_long(7) = {'i'};
M_.endo_names(8) = {'w'};
M_.endo_names_tex(8) = {'w'};
M_.endo_names_long(8) = {'w'};
M_.endo_partitions = struct();
M_.param_names = cell(12,1);
M_.param_names_tex = cell(12,1);
M_.param_names_long = cell(12,1);
M_.param_names(1) = {'BETTA'};
M_.param_names_tex(1) = {'BETTA'};
M_.param_names_long(1) = {'BETTA'};
M_.param_names(2) = {'GAMMA'};
M_.param_names_tex(2) = {'GAMMA'};
M_.param_names_long(2) = {'GAMMA'};
M_.param_names(3) = {'RBAR'};
M_.param_names_tex(3) = {'RBAR'};
M_.param_names_long(3) = {'RBAR'};
M_.param_names(4) = {'HBAR'};
M_.param_names_tex(4) = {'HBAR'};
M_.param_names_long(4) = {'HBAR'};
M_.param_names(5) = {'KBAR'};
M_.param_names_tex(5) = {'KBAR'};
M_.param_names_long(5) = {'KBAR'};
M_.param_names(6) = {'YBAR'};
M_.param_names_tex(6) = {'YBAR'};
M_.param_names_long(6) = {'YBAR'};
M_.param_names(7) = {'CBAR'};
M_.param_names_tex(7) = {'CBAR'};
M_.param_names_long(7) = {'CBAR'};
M_.param_names(8) = {'DELTA'};
M_.param_names_tex(8) = {'DELTA'};
M_.param_names_long(8) = {'DELTA'};
M_.param_names(9) = {'THETA'};
M_.param_names_tex(9) = {'THETA'};
M_.param_names_long(9) = {'THETA'};
M_.param_names(10) = {'A'};
M_.param_names_tex(10) = {'A'};
M_.param_names_long(10) = {'A'};
M_.param_names(11) = {'SIGMA'};
M_.param_names_tex(11) = {'SIGMA'};
M_.param_names_long(11) = {'SIGMA'};
M_.param_names(12) = {'IBAR'};
M_.param_names_tex(12) = {'IBAR'};
M_.param_names_long(12) = {'IBAR'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 8;
M_.param_nbr = 12;
M_.orig_endo_nbr = 8;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.linear_decomposition = false;
M_.orig_eq_nbr = 8;
M_.eq_nbr = 8;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 3 0;
 0 4 11;
 1 5 0;
 0 6 0;
 0 7 12;
 2 8 0;
 0 9 0;
 0 10 0;]';
M_.nstatic = 4;
M_.nfwrd   = 2;
M_.npred   = 2;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 2;
M_.ndynamic   = 4;
M_.dynamic_tmp_nbr = [0; 0; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , '1' ;
  2 , 'name' , '2' ;
  3 , 'name' , '3' ;
  4 , 'name' , '4' ;
  5 , 'name' , 'lambda' ;
  6 , 'name' , 'y' ;
  7 , 'name' , '7' ;
  8 , 'name' , 'w' ;
};
M_.mapping.y.eqidx = [2 3 4 6 7 8 ];
M_.mapping.c.eqidx = [1 2 3 7 ];
M_.mapping.k.eqidx = [3 4 6 ];
M_.mapping.h.eqidx = [2 6 8 ];
M_.mapping.r.eqidx = [1 4 ];
M_.mapping.lambda.eqidx = [5 6 ];
M_.mapping.i.eqidx = [7 ];
M_.mapping.w.eqidx = [8 ];
M_.mapping.epsilon.eqidx = [5 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [3 6 ];
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(8, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(12, 1);
M_.endo_trends = struct('deflator', cell(8, 1), 'log_deflator', cell(8, 1), 'growth_factor', cell(8, 1), 'log_growth_factor', cell(8, 1));
M_.NNZDerivatives = [26; -1; -1; ];
M_.static_tmp_nbr = [0; 0; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
close all;
M_.params(2) = 0.95;
GAMMA = M_.params(2);
M_.params(9) = 0.36;
THETA = M_.params(9);
M_.params(1) = 0.99;
BETTA = M_.params(1);
M_.params(8) = 0.025;
DELTA = M_.params(8);
M_.params(10) = 1.72;
A = M_.params(10);
M_.params(11) = 0.00322;
SIGMA = M_.params(11);
M_.params(3) = 1/M_.params(1)+M_.params(8)-1;
RBAR = M_.params(3);
M_.params(4) = 1/M_.params(10)*(1-M_.params(9))/(1/M_.params(10)*(1-M_.params(9))+1-M_.params(8)*M_.params(9)/M_.params(3));
HBAR = M_.params(4);
M_.params(5) = M_.params(4)*(M_.params(9)/(1/M_.params(1)-(1-M_.params(8))))^(1/(1-M_.params(9)));
KBAR = M_.params(5);
M_.params(6) = M_.params(5)^M_.params(9)*M_.params(4)^(1-M_.params(9));
YBAR = M_.params(6);
M_.params(7) = M_.params(6)-M_.params(8)*M_.params(5);
CBAR = M_.params(7);
M_.params(12) = M_.params(6)-M_.params(7);
IBAR = M_.params(12);
steady;
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = M_.params(11)^2;
options_.order = 1;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
save('Hansen_Simple_LL_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('Hansen_Simple_LL_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('Hansen_Simple_LL_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('Hansen_Simple_LL_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('Hansen_Simple_LL_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('Hansen_Simple_LL_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('Hansen_Simple_LL_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
disp('Note: 1 warning(s) encountered in the preprocessor')
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
