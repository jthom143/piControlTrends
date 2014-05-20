%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Trend Comparison
% CMIP5 Models
% SAM Timeseries
%
% Jordan Thomas
% May 8, 2014
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Good Matlab Housekeeping

close all
clear all

addpath /Users/jordanthomas/Desktop/Research/NCEPReanalysis1
addpath /Users/jordanthomas/Desktop/Research/NCEPReanalysis2
addpath /Users/jordanthomas/Documents/MATLAB/GeneralFunctions

%% Trend Analysis

[ ccsm4_sam_f         , ccsm4_sam_xi         , ccsm4_mean_sam         , ccsm4_std_sam         , ccsm4_time_year         , ccsm4_SAM_unnormalized          ] = CCSM4;
[ cmcc_cesm_sam_f     , cmcc_cesm_sam_xi     , cmcc_cesm_mean_sam     , cmcc_cesm_std_sam     , cmcc_cesm_time_year     , cmcc_cesm_SAM_unnormalized      ] = CMCC_CESM;
[ cmcc_cm_sam_f       , cmcc_cm_sam_xi       , cmcc_cm_mean_sam       , cmcc_cm_std_sam       , cmcc_cm_time_year       , cmcc_cm_SAM_unnormalized        ] = CMCC_CM;
[ cmcc_cms_sam_f      , cmcc_cms_sam_xi      , cmcc_cms_mean_sam      , cmcc_csm_std_sam      , cmcc_csm_time_year      , cmcc_csm_SAM_unnormalized       ] = CMCC_CMs;
[ cnrm_cm5_sam_f      , cnrm_cm5_sam_xi      , cnrm_cm5_mean_sam      , cnrm_cm5_std_sam      , cnrm_cm5_time_year      , cnrm_cm5_SAM_unnormalized       ] = CNRM_CM5;
[ cnrm_cm52_sam_f     , cnrm_cm52_sam_xi     , cnrm_cm52_mean_sam     , cnrm_cm52_std_sam     , cnrm_cm52_time_year     , cnrm_cm52_SAM_unnormalized      ] = CNRM_CM52;
[ ipsl_cm5a_lr_sam_f  , ipsl_cm5a_lr_sam_xi  , ipsl_cm5a_lr_mean_sam  , ipsl_cm5a_lr_std_sam  , ipsl_cm5a_lr_time_year  , ipsl_cm5a_lr_SAM_unnormalized   ] = IPSL_CM5a_LR;
[ ipsl_cm5a_mr_sam_f  , ipsl_cm5a_mr_sam_xi  , ipsl_cm5a_mr_mean_sam  , ipsl_cm5a_mr_std_sam  , ipsl_cm5a_mr_time_year  , ipsl_cm5a_mr_SAM_unnormalized   ] = IPSL_CM5a_MR;
[ ipsl_cm5b_lr_sam_f  , ipsl_cm5b_lr_sam_xi  , ipsl_cm5b_lr_mean_sam  , ipsl_cm5b_lr_std_sam  , ipsl_cm5b_lr_time_year  , ipsl_cm5b_lr_SAM_unnormalized   ] = IPSL_CM5b_LR;
[ miroc_esm_sam_f     , miroc_esm_sam_xi     , miroc_esm_mean_sam     , miroc_esm_std_sam     , miroc_esm_time_year     , miroc_esm_SAM_unnormalized      ] = MIROC_ESM;
[ miroc_esm_chem_sam_f, miroc_esm_chem_sam_xi, miroc_esm_chem_mean_sam, miroc_esm_chem_std_sam, miroc_esm_chem_time_year, miroc_esm_chem_SAM_unnormalized ] = MIROC_ESM_CHEM;
[ mpi_cgcm3_sam_f     , mpi_cgcm3_sam_xi     , mpi_cgcm3_mean_sam     , mpi_cgcm3_std_sam     , mpi_cgcm3_time_year     , mpi_cgcm3_SAM_unnormalized      ] = MPI_CGCM3;
[ mpi_esm_lr_sam_f    , mpi_esm_lr_sam_xi    , mpi_esm_lr_mean_sam    , mpi_esm_lr_std_sam    , mpi_esm_lr_time_year    , mpi_esm_lr_SAM_unnormalized     ] = MPI_ESM_LR;
[ mpi_esm_mr_sam_f    , mpi_esm_mr_sam_xi    , mpi_esm_mr_mean_sam    , mpi_esm_mr_std_sam    , mpi_esm_mr_time_year    , mpi_esm_mr_SAM_unnormalized     ] = MPI_ESM_MR;
[ nor_esm1m_m_sam_f   , nor_esm1m_m_sam_xi   , nor_esm1m_m_mean_sam   , nor_esm1m_m_std_sam   , nor_esm1m_m_time_year   , nor_esm1m_m_SAM_unnormalized    ] = NOR_ESM1m_M;
[ nor_esm1m_me_sam_f  , nor_esm1m_me_sam_xi  , nor_esm1m_me_mean_sam  , nor_esm1m_me_std_sam  , nor_esm1m_me_time_year  , nor_esm1m_me_SAM_unnormalized   ] = NOR_ESM1m_ME;

[ cm2mc_sam_f         , cm2mc_sam_xi         , cm2mc_mean_sam         , cm2mc_std_sam         , cm2mc_time_year         , cm2mc_SAM_unnormalized          ] = CM2Mc;
[ cm21_sam_f          , cm21_sam_xi          , cm21_mean_sam          , cm21_std_sam          , cm21_time_year          , cm21_SAM_unnormalized           ] = CM21;


% NCEP Reanalyses 

trend_period = 30;

[ taux_trend_30, taux_difference, lat_trend_30, lat_difference, sam_trend_30, sam_difference ] = NCEP1_trends(trend_period);
[ taux_trend_30_2, taux_difference_2, lat_trend_30_2, lat_difference_2, sam_trend_30_2, sam_difference_2 ] = NCEP2_trends(trend_period);



figure(1)
plot(ccsm4_sam_xi, ccsm4_sam_f, 'b-o' )
hold on
plot(cmcc_cesm_sam_xi, cmcc_cesm_sam_f, 'g-o')
plot(cmcc_cm_sam_xi, cmcc_cm_sam_f, 'r-o')
plot(cmcc_cms_sam_xi, cmcc_cms_sam_f, 'c-o')
plot(cnrm_cm5_sam_xi, cnrm_cm5_sam_f, 'k-o')
plot(cnrm_cm52_sam_xi, cnrm_cm52_sam_f, 'm-o')
plot(ipsl_cm5a_lr_sam_xi, ipsl_cm5a_lr_sam_f, 'b-*')
plot(ipsl_cm5a_mr_sam_xi, ipsl_cm5a_mr_sam_f, 'g-*')
plot(ipsl_cm5b_lr_sam_xi, ipsl_cm5b_lr_sam_f, 'r-*')
plot(miroc_esm_sam_xi, miroc_esm_sam_f,'c-*')
plot(miroc_esm_chem_sam_xi, miroc_esm_chem_sam_f, 'k-*')
plot(mpi_cgcm3_sam_xi, mpi_cgcm3_sam_f, 'b-s')
plot(mpi_esm_lr_sam_xi, mpi_esm_lr_sam_f,'g-s')
plot(mpi_esm_mr_sam_xi, mpi_esm_mr_sam_f,'r-s')
plot(nor_esm1m_m_sam_xi, nor_esm1m_m_sam_f,'c-s')
plot(nor_esm1m_me_sam_xi, nor_esm1m_me_sam_f,'k-s')
plot(cm2mc_sam_xi, cm2mc_sam_f, 'b')
plot(cm21_sam_xi, cm21_sam_f, 'g')
hR1 = vline(sam_trend_30, '-k');
hR2 = vline(sam_trend_30_2, '-.k');
legend('CCSM4', 'CMCC CESM','CMCC CM', 'CMCC CMs', 'CNRM CM5', 'CNRM CM5-2', 'IPSL CM5a LR',...
       'IPSL CM5a MR', 'IPSL CM5b LR', 'MIROC ESM', 'MIROC ESM CHEM', 'MPI CGCM3', ...
       'MPI ESM LR', 'MPI ESM MR', 'NOR ESM1m M', 'NOR ESM1m ME', 'CM2Mc', 'CM2.1')