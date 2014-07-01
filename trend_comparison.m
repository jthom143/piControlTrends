%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Trend Comparison
% CMIP5 Models
% SAM Timeseries
%
% Jordan Thomas
% May 8, 2014
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Good Matlab Housekeeping

% close all
% clear all

% addpath /Users/jordanthomas/Desktop/Research/NCEPReanalysis1
% addpath /Users/jordanthomas/Desktop/Research/NCEPReanalysis2
% addpath /Users/jordanthomas/Documents/MATLAB/GeneralFunctions

addpath /home/jthom143/Tools/Functions
addpath /home/jthom143/NCEPReanalysis1
addpath /home/jthom143/NCEPReanalysis2
addpath /data1/fesd1/jthom143/piControlTrends/surface_pressure_analysis


%% Trend Analysis

[ can_esm2_sam_f      , can_esm2_sam_xi      , can_esm2_mean_sam      , can_esm2_std_sam      , can_esm2_time_year      , can_esm2_SAM_unnormalized       , can_esm2_sam_trends_yrs      ] = CanESM2;
[ ccsm4_sam_f         , ccsm4_sam_xi         , ccsm4_mean_sam         , ccsm4_std_sam         , ccsm4_time_year         , ccsm4_SAM_unnormalized          , ccsm4_sam_trends_yrs         ] = CCSM4;
[ cmcc_cesm_sam_f     , cmcc_cesm_sam_xi     , cmcc_cesm_mean_sam     , cmcc_cesm_std_sam     , cmcc_cesm_time_year     , cmcc_cesm_SAM_unnormalized      , cmcc_cesm_sam_trends_yrs     ] = CMCC_CESM;
[ cmcc_cm_sam_f       , cmcc_cm_sam_xi       , cmcc_cm_mean_sam       , cmcc_cm_std_sam       , cmcc_cm_time_year       , cmcc_cm_SAM_unnormalized        , cmcc_cm_sam_trends_yrs       ] = CMCC_CM;
[ cmcc_cms_sam_f      , cmcc_cms_sam_xi      , cmcc_cms_mean_sam      , cmcc_csm_std_sam      , cmcc_csm_time_year      , cmcc_csm_SAM_unnormalized       , cmcc_cms_sam_trends_yrs      ] = CMCC_CMs;
[ cnrm_cm5_sam_f      , cnrm_cm5_sam_xi      , cnrm_cm5_mean_sam      , cnrm_cm5_std_sam      , cnrm_cm5_time_year      , cnrm_cm5_SAM_unnormalized       , cnrm_cm5_sam_trends_yrs      ] = CNRM_CM5;
[ cnrm_cm52_sam_f     , cnrm_cm52_sam_xi     , cnrm_cm52_mean_sam     , cnrm_cm52_std_sam     , cnrm_cm52_time_year     , cnrm_cm52_SAM_unnormalized      , cnrm_cm52_sam_trends_yrs     ] = CNRM_CM52;
[ gfdl_esm2g_sam_f    , gfdl_esm2g_sam_xi    , gfdl_esm2g_mean_sam    , gfdl_esm2g_std_sam    , gfdl_esm2g_time_year    , gfdl_esm2g_SAM_unnormalized     , gfdl_esm2g_sam_trends_yrs    ] = GFDL_ESM2G;
[ gfdl_esm2m_sam_f    , gfdl_esm2m_sam_xi    , gfdl_esm2m_mean_sam    , gfdl_esm2m_std_sam    , gfdl_esm2m_time_year    , gfdl_esm2m_SAM_unnormalized     , gfdl_esm2m_sam_trends_yrs    ] = GFDL_ESM2M;
[ ipsl_cm5a_lr_sam_f  , ipsl_cm5a_lr_sam_xi  , ipsl_cm5a_lr_mean_sam  , ipsl_cm5a_lr_std_sam  , ipsl_cm5a_lr_time_year  , ipsl_cm5a_lr_SAM_unnormalized   , ipsl_cm5a_lr_sam_trends_yrs  ] = IPSL_CM5a_LR;
[ ipsl_cm5a_mr_sam_f  , ipsl_cm5a_mr_sam_xi  , ipsl_cm5a_mr_mean_sam  , ipsl_cm5a_mr_std_sam  , ipsl_cm5a_mr_time_year  , ipsl_cm5a_mr_SAM_unnormalized   , ipsl_cm5a_mr_sam_trends_yrs  ] = IPSL_CM5a_MR;
[ ipsl_cm5b_lr_sam_f  , ipsl_cm5b_lr_sam_xi  , ipsl_cm5b_lr_mean_sam  , ipsl_cm5b_lr_std_sam  , ipsl_cm5b_lr_time_year  , ipsl_cm5b_lr_SAM_unnormalized   , ipsl_cm5b_lr_sam_trends_yrs  ] = IPSL_CM5b_LR;
[ miroc5_sam_f        , miroc5_sam_xi        , miroc5_mean_sam        , miroc5_std_sam        , miroc5_time_year        , miroc5_SAM_unnormalized         , miroc5_sam_trends_yrs        ] = MIROC5;
[ miroc_esm_sam_f     , miroc_esm_sam_xi     , miroc_esm_mean_sam     , miroc_esm_std_sam     , miroc_esm_time_year     , miroc_esm_SAM_unnormalized      , miroc_esm_sam_trends_yrs     ] = MIROC_ESM;
[ miroc_esm_chem_sam_f, miroc_esm_chem_sam_xi, miroc_esm_chem_mean_sam, miroc_esm_chem_std_sam, miroc_esm_chem_time_year, miroc_esm_chem_SAM_unnormalized , miroc_esm_chem_sam_trends_yrs] = MIROC_ESM_CHEM;
[ mpi_cgcm3_sam_f     , mpi_cgcm3_sam_xi     , mpi_cgcm3_mean_sam     , mpi_cgcm3_std_sam     , mpi_cgcm3_time_year     , mpi_cgcm3_SAM_unnormalized      , mpi_cgcm3_sam_trends_yrs     ] = MRI_CGCM3;
[ mpi_esm_lr_sam_f    , mpi_esm_lr_sam_xi    , mpi_esm_lr_mean_sam    , mpi_esm_lr_std_sam    , mpi_esm_lr_time_year    , mpi_esm_lr_SAM_unnormalized     , mpi_esm_lr_sam_trends_yrs    ] = MPI_ESM_LR;
[ mpi_esm_mr_sam_f    , mpi_esm_mr_sam_xi    , mpi_esm_mr_mean_sam    , mpi_esm_mr_std_sam    , mpi_esm_mr_time_year    , mpi_esm_mr_SAM_unnormalized     , mpi_esm_mr_sam_trends_yrs    ] = MPI_ESM_MR;
[ nor_esm1m_m_sam_f   , nor_esm1m_m_sam_xi   , nor_esm1m_m_mean_sam   , nor_esm1m_m_std_sam   , nor_esm1m_m_time_year   , nor_esm1m_m_SAM_unnormalized    , nor_esm1m_m_sam_trends_yrs   ] = NOR_ESM1m_M;
[ nor_esm1m_me_sam_f  , nor_esm1m_me_sam_xi  , nor_esm1m_me_mean_sam  , nor_esm1m_me_std_sam  , nor_esm1m_me_time_year  , nor_esm1m_me_SAM_unnormalized   , nor_esm1m_me_sam_trends_yrs  ] = NOR_ESM1m_ME;

[ cm2mc_sam_f         , cm2mc_sam_xi         , cm2mc_mean_sam         , cm2mc_std_sam         , cm2mc_time_year         , cm2mc_SAM_unnormalized ,cm2mc_sam_trends_yrs         ] = CM2Mc;
[ cm21_sam_f          , cm21_sam_xi          , cm21_mean_sam          , cm21_std_sam          , cm21_time_year          , cm21_SAM_unnormalized , cm21_sam_trends_yrs           ] = CM21;


% NCEP Reanalyses 

trend_period = 30;

[ taux_trend_30, taux_difference, lat_trend_30, lat_difference, sam_trend_30, sam_difference ] = NCEP1_trends(trend_period);
[ taux_trend_30_2, taux_difference_2, lat_trend_30_2, lat_difference_2, sam_trend_30_2, sam_difference_2 ] = NCEP2_trends(trend_period);



figure(1)
plot(can_esm2_sam_xi, can_esm2_sam_f, 'c-')
hold on
plot(ccsm4_sam_xi, ccsm4_sam_f, 'b-o' )
plot(cmcc_cesm_sam_xi, cmcc_cesm_sam_f, 'g-o')
plot(cmcc_cm_sam_xi, cmcc_cm_sam_f, 'r-o')
plot(cmcc_cms_sam_xi, cmcc_cms_sam_f, 'c-o')
plot(cnrm_cm5_sam_xi, cnrm_cm5_sam_f, 'k-o')
plot(cnrm_cm52_sam_xi, cnrm_cm52_sam_f, 'm-o')
plot(gfdl_esm2g_sam_xi, gfdl_esm2g_sam_f, 'r-')
plot(gfdl_esm2m_sam_xi, gfdl_esm2m_sam_f, 'g-')
plot(ipsl_cm5a_lr_sam_xi, ipsl_cm5a_lr_sam_f, 'b-*')
plot(ipsl_cm5a_mr_sam_xi, ipsl_cm5a_mr_sam_f, 'g-*')
plot(ipsl_cm5b_lr_sam_xi, ipsl_cm5b_lr_sam_f, 'r-*')
plot(miroc5_sam_xi, miroc5_sam_f, 'b.-')
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
legend('CanESM2','CCSM4', 'CMCC CESM','CMCC CM', 'CMCC CMs', 'CNRM CM5', 'CNRM CM5-2','GFDL ESM2G','GFDL ESM2M', 'IPSL CM5a LR',...
       'IPSL CM5a MR', 'IPSL CM5b LR','MIROC 5', 'MIROC ESM', 'MIROC ESM CHEM', 'MPI CGCM3', ...
       'MPI ESM LR', 'NOR ESM1m M', 'NOR ESM1m ME', 'CM2Mc', 'CM2.1')
set(gca, 'fontsize', 12)
set(gcf, 'position', [100, 100, 1049, 895])
xlabel('30 Year Linear Trend (Pa/30 years)', 'fontsize', 12)
ylabel('Probability density estimate', 'fontsize', 12)
   
 
can_esm2_probability       = can_esm2_sam_f      (findnearest(can_esm2_sam_xi,       sam_trend_30))*100;
ccsm4_probability          = ccsm4_sam_f         (findnearest(ccsm4_sam_xi,          sam_trend_30))*100;
cmcc_cesm_probability      = cmcc_cesm_sam_f     (findnearest(cmcc_cesm_sam_xi,      sam_trend_30))*100;
cmcc_cm_probability        = cmcc_cm_sam_f       (findnearest(cmcc_cm_sam_xi,        sam_trend_30))*100;
cmcc_cms_probability       = cmcc_cms_sam_f      (findnearest(cmcc_cms_sam_xi,       sam_trend_30))*100;
cnrm_cm5_probability       = cnrm_cm5_sam_f      (findnearest(cnrm_cm5_sam_xi,       sam_trend_30))*100;
cnrm_cm52_probability      = cnrm_cm52_sam_f     (findnearest(cnrm_cm52_sam_xi,      sam_trend_30))*100;
gfdl_esm2g_probability     = gfdl_esm2g_sam_f    (findnearest(gfdl_esm2g_sam_xi,     sam_trend_30))*100;
gfdl_esm2m_probability     = gfdl_esm2m_sam_f    (findnearest(gfdl_esm2m_sam_xi,     sam_trend_30))*100;
ipsl_cm5a_lr_probability   = ipsl_cm5a_lr_sam_f  (findnearest(ipsl_cm5a_lr_sam_xi,   sam_trend_30))*100;
ipsl_cm5a_mr_probability   = ipsl_cm5a_mr_sam_f  (findnearest(ipsl_cm5a_mr_sam_xi,   sam_trend_30))*100;
ipsl_cm5b_lr_probability   = ipsl_cm5b_lr_sam_f  (findnearest(ipsl_cm5b_lr_sam_xi,   sam_trend_30))*100;
miroc5_probability         = miroc5_sam_f        (findnearest(miroc5_sam_xi,         sam_trend_30))*100;
miroc_esm_probability      = miroc_esm_sam_f     (findnearest(miroc_esm_sam_xi,      sam_trend_30))*100;
miroc_esm_chem_probability = miroc_esm_chem_sam_f(findnearest(miroc_esm_chem_sam_xi, sam_trend_30))*100;
mpi_cgcm3_probability      = mpi_cgcm3_sam_f     (findnearest(mpi_cgcm3_sam_xi,      sam_trend_30))*100;
mpi_esm_lr_probability     = mpi_esm_lr_sam_f    (findnearest(mpi_esm_lr_sam_xi,     sam_trend_30))*100;
mpi_esm_mr_probability     = mpi_esm_mr_sam_f    (findnearest(mpi_esm_mr_sam_xi,     sam_trend_30))*100;
nor_esm1m_m_probability    = nor_esm1m_m_sam_f   (findnearest(nor_esm1m_m_sam_xi,    sam_trend_30))*100;
nor_esm1m_me_probability   = nor_esm1m_me_sam_f  (findnearest(nor_esm1m_me_sam_xi,       sam_trend_30))*100;

cm2mc_probability = cm2mc_sam_f(findnearest(cm2mc_sam_xi, sam_trend_30))*100;
cm21_probability = cm21_sam_f(findnearest(cm21_sam_xi,sam_trend_30))*100;

model_labels = {'   ';'CanESM2';'CCSM4';'CMCC CESM'; 'CMCC CM'; 'CMCC CMs'; 'CNRM CM5'; 'CNRM CM5-2';'GFDL ESM2G';'GFDL ESM2M'; 'IPSL CM5a LR'; 'IPSL CM5a MR';...
    'IPSL CM5b LR'; 'MIROC ESM'; 'MIROC ESM CHEM';'MIROC5';'MPI CGCM3';'MPI ESM LR'; 'MPI ESM MR'; 'NOR ESM1m M'; 'NOR ESM1m ME';...
    'CM2Mc'; 'CM2.1'; '   '};
std_cmip5 = {can_esm2_std_sam; ccsm4_std_sam; cmcc_cesm_std_sam; cmcc_cm_std_sam; cmcc_csm_std_sam; cnrm_cm5_std_sam; cnrm_cm52_std_sam;...
    gfdl_esm2g_std_sam; gfdl_esm2m_std_sam; ipsl_cm5a_lr_std_sam; ipsl_cm5a_mr_std_sam; ipsl_cm5b_lr_std_sam; miroc_esm_std_sam; miroc_esm_chem_std_sam;miroc5_std_sam;...
    mpi_cgcm3_std_sam; mpi_esm_lr_std_sam; mpi_esm_mr_std_sam; nor_esm1m_m_std_sam; nor_esm1m_me_std_sam; cm2mc_std_sam; cm21_std_sam};
prob_cmip5 = {can_esm2_probability; ccsm4_probability; cmcc_cesm_probability; cmcc_cm_probability; cmcc_cms_probability; cnrm_cm5_probability; cnrm_cm52_probability;...
    gfdl_esm2g_probability; gfdl_esm2m_probability; ipsl_cm5a_lr_probability; ipsl_cm5a_mr_probability; ipsl_cm5b_lr_probability; miroc_esm_probability; miroc_esm_chem_probability; miroc5_probability;...
    mpi_cgcm3_probability; mpi_esm_lr_probability; mpi_esm_mr_probability; nor_esm1m_m_probability; nor_esm1m_me_probability; cm2mc_probability; cm21_probability};


Trends = NaN*ones(22,4000);
Trends(1, 1:length(can_esm2_sam_trends_yrs)) = can_esm2_sam_trends_yrs;
Trends(2, 1:length(ccsm4_sam_trends_yrs)) = ccsm4_sam_trends_yrs;
Trends(3, 1:length(cmcc_cesm_sam_trends_yrs)) = cmcc_cesm_sam_trends_yrs;
Trends(4, 1:length(cmcc_cm_sam_trends_yrs)) = cmcc_cm_sam_trends_yrs;
Trends(5, 1:length(cmcc_cms_sam_trends_yrs)) = cmcc_cms_sam_trends_yrs;
Trends(6, 1:length(cnrm_cm5_sam_trends_yrs)) = cnrm_cm5_sam_trends_yrs;
Trends(7, 1:length(cnrm_cm52_sam_trends_yrs)) = cnrm_cm52_sam_trends_yrs;
Trends(8, 1:length(gfdl_esm2g_sam_trends_yrs)) = gfdl_esm2g_sam_trends_yrs;
Trends(9, 1:length(gfdl_esm2m_sam_trends_yrs)) = gfdl_esm2m_sam_trends_yrs;
Trends(10, 1:length(ipsl_cm5a_lr_sam_trends_yrs)) = ipsl_cm5a_lr_sam_trends_yrs;
Trends(11, 1:length(ipsl_cm5a_mr_sam_trends_yrs)) = ipsl_cm5a_mr_sam_trends_yrs;
Trends(12, 1:length(ipsl_cm5b_lr_sam_trends_yrs)) = ipsl_cm5b_lr_sam_trends_yrs;
Trends(13, 1:length(miroc_esm_sam_trends_yrs)) = miroc_esm_sam_trends_yrs;
Trends(14, 1:length(miroc_esm_chem_sam_trends_yrs)) = miroc_esm_chem_sam_trends_yrs;
Trends(15, 1:length(miroc5_sam_trends_yrs)) = miroc5_sam_trends_yrs;
Trends(16, 1:length(mpi_esm_lr_sam_trends_yrs)) = mpi_esm_lr_sam_trends_yrs;
Trends(17, 1:length(mpi_esm_mr_sam_trends_yrs)) = mpi_esm_mr_sam_trends_yrs;
Trends(18, 1:length(mpi_cgcm3_sam_trends_yrs)) = mpi_cgcm3_sam_trends_yrs;
Trends(19, 1:length(nor_esm1m_m_sam_trends_yrs)) = nor_esm1m_m_sam_trends_yrs;
Trends(20, 1:length(nor_esm1m_me_sam_trends_yrs)) = nor_esm1m_me_sam_trends_yrs;
Trends(21, 1:length(cm2mc_sam_trends_yrs)) = cm2mc_sam_trends_yrs;
Trends(22, 1:length(cm21_sam_trends_yrs)) = cm21_sam_trends_yrs;




Models = {'CanESM2';'CCSM4';'CMCC CESM'; 'CMCC CM'; 'CMCC CMs'; 'CNRM CM5'; 'CNRM CM5-2';'GFDL ESM2G';'GFDL ESM2M'; 'IPSL CM5a LR'; 'IPSL CM5a MR';...
    'IPSL CM5b LR'; 'MIROC ESM'; 'MIROC ESM CHEM';'MIROC5';'MPI CGCM3';'MPI ESM LR'; 'MPI ESM MR'; 'NOR ESM1m M'; 'NOR ESM1m ME';...
    'CM2Mc'; 'CM2.1'};

percentile = prctile(Trends, 95, 1);


figure(2)
h1 = plot(1, 2*can_esm2_std_sam, '*', 'markersize', 12);
hold on
plot(2, 2*ccsm4_std_sam, '*', 'markersize', 12)
plot(3, 2*cmcc_cesm_std_sam, '*', 'markersize', 12)
plot(4, 2*cmcc_cm_std_sam, '*', 'markersize', 12)
plot(5, 2*cmcc_csm_std_sam, '*', 'markersize', 12)
plot(6, 2*cnrm_cm5_std_sam, '*', 'markersize', 12)
plot(7, 2*cnrm_cm52_std_sam, '*', 'markersize', 12)
plot(8, 2*gfdl_esm2g_std_sam, '*', 'markersize', 12)
plot(9, 2*gfdl_esm2m_std_sam, '*', 'markersize', 12)
plot(10, 2*ipsl_cm5a_lr_std_sam, '*', 'markersize', 12)
plot(11, 2*ipsl_cm5a_mr_std_sam, '*', 'markersize', 12)
plot(12, 2*ipsl_cm5b_lr_std_sam, '*', 'markersize', 12)
plot(13, 2*miroc_esm_std_sam, '*', 'markersize', 12)
plot(14, 2*miroc_esm_chem_std_sam, '*', 'markersize', 12)
plot(15, 2*miroc5_std_sam, '*', 'markersize', 12)
plot(16, 2*mpi_esm_lr_std_sam, '*', 'markersize', 12)
plot(17, 2*mpi_esm_mr_std_sam, '*', 'markersize', 12)
plot(18, 2*mpi_cgcm3_std_sam, '*', 'markersize', 12)
plot(19, 2*nor_esm1m_m_std_sam, '*', 'markersize', 12)
plot(20, 2*nor_esm1m_me_std_sam, '*', 'markersize', 12)
plot(21, 2*cm2mc_std_sam, '*', 'markersize', 12)
plot(22, 2*cm21_std_sam, '*', 'markersize', 12)

xlim([0,23])
hR1 = hline(sam_trend_30, '-k');
hR2 = hline(sam_trend_30_2, '-.k');

h2 = plot(1, percentile(1), 'r*', 'markersize', 12);
plot(2, percentile(2), 'r*', 'markersize', 12)
plot(3, percentile(3), 'r*', 'markersize', 12)
plot(4, percentile(4), 'r*', 'markersize', 12)
plot(5, percentile(5), 'r*', 'markersize', 12)
plot(6, percentile(6), 'r*', 'markersize', 12)
plot(7, percentile(7), 'r*', 'markersize', 12)
plot(8, percentile(8), 'r*', 'markersize', 12)
plot(9, percentile(9), 'r*', 'markersize', 12)
plot(10, percentile(10), 'r*', 'markersize', 12)
plot(11, percentile(11), 'r*', 'markersize', 12)
plot(12, percentile(12), 'r*', 'markersize', 12)
plot(13, percentile(13), 'r*', 'markersize', 12)
plot(14, percentile(14), 'r*', 'markersize', 12)
plot(15, percentile(15), 'r*', 'markersize', 12)
plot(16, percentile(16), 'r*', 'markersize', 12)
plot(17, percentile(17), 'r*', 'markersize', 12)
plot(18, percentile(18), 'r*', 'markersize', 12)
plot(19, percentile(19), 'r*', 'markersize', 12)
plot(20, percentile(20), 'r*', 'markersize', 12)
plot(21, percentile(21), 'r*', 'markersize', 12)
plot(22, percentile(22), 'r*', 'markersize', 12)

set(gca, 'XTick', 0:23)
set(gca, 'XTickLabel', model_labels)
set(gca, 'fontsize', 12)
set(gcf, 'position', [100, 100, 1049, 495])
ylabel('SAM (Pa)','fontsize', 12)
legend([h1, h2, hR1, hR2], '2 x Standard Deviation', '95th Percentile','Reanalysis 1', 'Reanalysis 2')
rotateXLabels( gca(), 45 )



figure(3)
boxplot(Trends', Models)
set(gca, 'fontsize', 12)
set(gcf, 'position', [100, 100, 1049, 495])
    text_h = findobj(gca, 'Type', 'text');

    for cnt = 1:length(text_h)
        set(text_h(cnt),    'FontSize', 12,...
                            'Rotation', 45, ...
                            'HorizontalAlignment', 'right')
    end
    
    % 'VerticalAlignment', 'cap', ...
    
    % smaller box for axes, in order to un-hide the labels
    squeeze = 0.2;
    left = 0.02;
    right = 1;
    bottom = squeeze;
    top = 1-squeeze;
    set(gca, 'OuterPosition', [left bottom right top])
    
    
figure(4)
subplot(5,4,1)
plot(can_esm2_time_year, can_esm2_SAM_unnormalized)
xlim([0 996])
ylim([0 50])
title('CanESM2', 'fontsize', 12)

subplot(5,4,2)
plot(ccsm4_time_year, ccsm4_SAM_unnormalized)
xlim([0 501])
ylim([0 50])
title('CCSM4', 'fontsize', 12)

subplot(5,4,3)
plot(cmcc_cesm_time_year, cmcc_cesm_SAM_unnormalized)
xlim([0 277])
ylim([0 50])
title('CMCC CESM', 'fontsize', 12)

subplot(5,4,4)
plot(cmcc_cm_time_year, cmcc_cm_SAM_unnormalized)
xlim([0 330])
ylim([0 50])
title('CMCC CM', 'fontsize', 12)

subplot(5,4,5)
plot(cmcc_csm_time_year, cmcc_csm_SAM_unnormalized)
xlim([0 500])
ylim([0 50])
title('CMCC CMs', 'fontsize', 12)

subplot(5,4,6)
plot(cnrm_cm5_time_year, cnrm_cm5_SAM_unnormalized)
xlim([0 850])
ylim([0 50])
title('CNRM CM5', 'fontsize', 12)

subplot(5,4,7)
plot(cnrm_cm52_time_year, cnrm_cm52_SAM_unnormalized)
xlim([0 359])
ylim([0 50])
title('CNRM CM5-2', 'fontsize', 12)

subplot(5,4,8)
plot(gfdl_esm2g_time_year, gfdl_esm2g_SAM_unnormalized)
xlim([0 500])
ylim([0 50])
title('GFDL ESM2G', 'fontsize', 12)

subplot(5,4,9)
plot(gfdl_esm2m_time_year, gfdl_esm2m_SAM_unnormalized)
xlim([0 500])
ylim([0 50])
title('GFDL ESM2M', 'fontsize', 12)

subplot(5,4,10)
plot(ipsl_cm5a_lr_time_year, ipsl_cm5a_lr_SAM_unnormalized)
xlim([0 1000])
ylim([0 50])
title('IPSL CM5a LR', 'fontsize', 12)

subplot(5,4,11)
plot(ipsl_cm5a_mr_time_year, ipsl_cm5a_mr_SAM_unnormalized)
xlim([0 300])
ylim([0 50])
title('IPSL CM5a MR', 'fontsize', 12)

subplot(5,4,12)
plot(ipsl_cm5b_lr_time_year, ipsl_cm5b_lr_SAM_unnormalized)
xlim([0 300])
ylim([0 50])
title('IPSL CM5b LR', 'fontsize', 12)

subplot(5,4,13)
plot(miroc_esm_time_year, miroc_esm_SAM_unnormalized)
xlim([0 531])
ylim([0 50])
title('MIROC ESM', 'fontsize', 12)

subplot(5,4,14)
plot(miroc_esm_chem_time_year, miroc_esm_chem_SAM_unnormalized)
xlim([0 255])
ylim([0 50])
title('MIROC ESM CHEM', 'fontsize', 12)

subplot(5,4,15)
plot(miroc5_time_year, miroc5_SAM_unnormalized)
xlim([0 200])
ylim([0 50])
title('MIROC5', 'fontsize', 12)

subplot(5,4,16)
plot(mpi_cgcm3_time_year, mpi_cgcm3_SAM_unnormalized)
xlim([0 200])
ylim([0 50])
title('MRI CGCM3', 'fontsize', 12)

subplot(5,4,17)
plot(mpi_esm_lr_time_year, mpi_esm_lr_SAM_unnormalized)
xlim([0 1000])
ylim([0 50])
title('MPI ESM LR', 'fontsize', 12)

subplot(5,4,18)
plot(mpi_esm_mr_time_year, mpi_esm_mr_SAM_unnormalized)
xlim([0 1000])
ylim([0 50])
title('MPI ESM MR', 'fontsize', 12)

subplot(5,4,19)
plot(nor_esm1m_m_time_year, nor_esm1m_m_SAM_unnormalized)
xlim([0 501])
ylim([0 50])
title('NOR ESM1m M', 'fontsize', 12)

subplot(5,4,20)
plot(nor_esm1m_me_time_year, nor_esm1m_me_SAM_unnormalized)
xlim([0 252])
ylim([0 50])
title('NOR ESM1m ME', 'fontsize', 12)

set(gca, 'fontsize', 12)
set(gcf, 'position', [100, 100, 1049, 895])

        