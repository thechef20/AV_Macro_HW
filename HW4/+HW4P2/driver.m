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
M_.fname = 'HW4P2';
M_.dynare_version = '4.6.3';
oo_.dynare_version = '4.6.3';
options_.dynare_version = '4.6.3';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('HW4P2.log');
M_.exo_names = cell(1,1);
M_.exo_names_tex = cell(1,1);
M_.exo_names_long = cell(1,1);
M_.exo_names(1) = {'epsilon'};
M_.exo_names_tex(1) = {'epsilon'};
M_.exo_names_long(1) = {'epsilon'};
M_.endo_names = cell(6,1);
M_.endo_names_tex = cell(6,1);
M_.endo_names_long = cell(6,1);
M_.endo_names(1) = {'y'};
M_.endo_names_tex(1) = {'y'};
M_.endo_names_long(1) = {'y'};
M_.endo_names(2) = {'w'};
M_.endo_names_tex(2) = {'w'};
M_.endo_names_long(2) = {'w'};
M_.endo_names(3) = {'c'};
M_.endo_names_tex(3) = {'c'};
M_.endo_names_long(3) = {'c'};
M_.endo_names(4) = {'k'};
M_.endo_names_tex(4) = {'k'};
M_.endo_names_long(4) = {'k'};
M_.endo_names(5) = {'h'};
M_.endo_names_tex(5) = {'h'};
M_.endo_names_long(5) = {'h'};
M_.endo_names(6) = {'a'};
M_.endo_names_tex(6) = {'a'};
M_.endo_names_long(6) = {'a'};
M_.endo_partitions = struct();
M_.param_names = cell(15,1);
M_.param_names_tex = cell(15,1);
M_.param_names_long = cell(15,1);
M_.param_names(1) = {'WBAR'};
M_.param_names_tex(1) = {'WBAR'};
M_.param_names_long(1) = {'WBAR'};
M_.param_names(2) = {'ROW'};
M_.param_names_tex(2) = {'ROW'};
M_.param_names_long(2) = {'ROW'};
M_.param_names(3) = {'BETTA'};
M_.param_names_tex(3) = {'BETTA'};
M_.param_names_long(3) = {'BETTA'};
M_.param_names(4) = {'GAMMA'};
M_.param_names_tex(4) = {'GAMMA'};
M_.param_names_long(4) = {'GAMMA'};
M_.param_names(5) = {'RBAR'};
M_.param_names_tex(5) = {'RBAR'};
M_.param_names_long(5) = {'RBAR'};
M_.param_names(6) = {'HBAR'};
M_.param_names_tex(6) = {'HBAR'};
M_.param_names_long(6) = {'HBAR'};
M_.param_names(7) = {'KBAR'};
M_.param_names_tex(7) = {'KBAR'};
M_.param_names_long(7) = {'KBAR'};
M_.param_names(8) = {'YBAR'};
M_.param_names_tex(8) = {'YBAR'};
M_.param_names_long(8) = {'YBAR'};
M_.param_names(9) = {'ABAR'};
M_.param_names_tex(9) = {'ABAR'};
M_.param_names_long(9) = {'ABAR'};
M_.param_names(10) = {'CBAR'};
M_.param_names_tex(10) = {'CBAR'};
M_.param_names_long(10) = {'CBAR'};
M_.param_names(11) = {'DELTA'};
M_.param_names_tex(11) = {'DELTA'};
M_.param_names_long(11) = {'DELTA'};
M_.param_names(12) = {'THETA'};
M_.param_names_tex(12) = {'THETA'};
M_.param_names_long(12) = {'THETA'};
M_.param_names(13) = {'A'};
M_.param_names_tex(13) = {'A'};
M_.param_names_long(13) = {'A'};
M_.param_names(14) = {'SIGMA'};
M_.param_names_tex(14) = {'SIGMA'};
M_.param_names_long(14) = {'SIGMA'};
M_.param_names(15) = {'IBAR'};
M_.param_names_tex(15) = {'IBAR'};
M_.param_names_long(15) = {'IBAR'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 6;
M_.param_nbr = 15;
M_.orig_endo_nbr = 6;
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
M_.orig_eq_nbr = 6;
M_.eq_nbr = 6;
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
 0 3 9;
 0 4 0;
 0 5 10;
 1 6 0;
 0 7 0;
 2 8 0;]';
M_.nstatic = 2;
M_.nfwrd   = 2;
M_.npred   = 2;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 2;
M_.ndynamic   = 4;
M_.dynamic_tmp_nbr = [2; 0; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'y' ;
  2 , 'name' , '2' ;
  3 , 'name' , '3' ;
  4 , 'name' , 'a' ;
  5 , 'name' , '5' ;
  6 , 'name' , 'w' ;
};
M_.mapping.y.eqidx = [1 3 5 6 ];
M_.mapping.w.eqidx = [6 ];
M_.mapping.c.eqidx = [2 3 ];
M_.mapping.k.eqidx = [1 2 3 5 ];
M_.mapping.h.eqidx = [1 2 5 6 ];
M_.mapping.a.eqidx = [2 4 ];
M_.mapping.epsilon.eqidx = [4 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [4 6 ];
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(6, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(15, 1);
M_.endo_trends = struct('deflator', cell(6, 1), 'log_deflator', cell(6, 1), 'growth_factor', cell(6, 1), 'log_growth_factor', cell(6, 1));
M_.NNZDerivatives = [20; -1; -1; ];
M_.static_tmp_nbr = [2; 0; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
close all;
M_.params(4) = 0.95;
GAMMA = M_.params(4);
M_.params(9) = 0.01;
ABAR = M_.params(9);
M_.params(1) = 0.01;
WBAR = M_.params(1);
M_.params(12) = 0.35;
THETA = M_.params(12);
M_.params(3) = 0.99;
BETTA = M_.params(3);
M_.params(11) = 0.025;
DELTA = M_.params(11);
M_.params(13) = 1.75;
A = M_.params(13);
M_.params(14) = 1;
SIGMA = M_.params(14);
M_.params(2) = 0.8;
ROW = M_.params(2);
M_.params(5) = 1/M_.params(3)+M_.params(11)-1;
RBAR = M_.params(5);
M_.params(6) = 1/M_.params(13)*(1-M_.params(12))/(1/M_.params(13)*(1-M_.params(12))+1-M_.params(11)*M_.params(12)/M_.params(5));
HBAR = M_.params(6);
M_.params(7) = M_.params(6)*(M_.params(12)/(1/M_.params(3)-(1-M_.params(11))))^(1/(1-M_.params(12)));
KBAR = M_.params(7);
M_.params(8) = M_.params(7)^M_.params(12)*M_.params(6)^(1-M_.params(12));
YBAR = M_.params(8);
M_.params(10) = M_.params(8)-M_.params(11)*M_.params(7);
CBAR = M_.params(10);
M_.params(15) = M_.params(8)-M_.params(10);
IBAR = M_.params(15);
steady;
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (0.01)^2;
options_.order = 1;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
save('HW4P2_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('HW4P2_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('HW4P2_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('HW4P2_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('HW4P2_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('HW4P2_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('HW4P2_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
