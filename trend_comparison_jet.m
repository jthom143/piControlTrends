%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Trend Comparison
% CMIP5 Models
% Windstress Timeseries
%
% Jordan Thomas
% June 23, 2014

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Good Matlab Housekeeping

close all
clear all

% addpath /Users/jordanthomas/Desktop/Research/NCEPReanalysis1
% addpath /Users/jordanthomas/Desktop/Research/NCEPReanalysis2
% addpath /Users/jordanthomas/Documents/MATLAB/GeneralFunctions

addpath /home/jthom143/Tools/Functions
addpath /home/jthom143/NCEPReanalysis1
addpath /home/jthom143/NCEPReanalysis2
addpath /data1/fesd1/jthom143/piControlTrends/windstress_analysis


%% Trend Analysis

% CanESM2
 [ ccsm4_jet_f           , ccsm4_jet_xi           , ccsm4_mean_jet           , ccsm4_std_jet           , ccsm4_jet_trends_yrs          , ccsm4_jet_loc_f               , ccsm4_jet_loc_xi              , ccsm4_mean_jet_loc          , ccsm4_std_jet_loc          , ccsm4_jet_loc_trends_yrs          , ccsm4_time_year           ] = CCSM4_taux;
 [ cmcc_cesm_jet_f       , cmcc_cesm_jet_xi       , cmcc_cesm_mean_jet       , cmcc_cesm_std_jet       , cmcc_cesm_jet_trends_yrs      , cmcc_cesm_jet_loc_f           , cmcc_cesm_jet_loc_xi          , cmcc_cesm_mean_jet_loc      , cmcc_cesm_std_jet_loc      , cmcc_cesm_jet_loc_trends_yrs      , cmcc_cesm_time_year       ] = CMCC_CESM_taux;
 [ cmcc_cm_jet_f         , cmcc_cm_jet_xi         , cmcc_cm_mean_jet         , cmcc_cm_std_jet         , cmcc_cm_jet_trends_yrs        , cmcc_cm_jet_loc_f             , cmcc_cm_jet_loc_xi            , cmcc_cm_mean_jet_loc        , cmcc_cm_std_jet_loc        , cmcc_cm_jet_loc_trends_yrs        , cmcc_cm_time_year         ] = CMCC_CM_taux;
 [ cmcc_cms_jet_f        , cmcc_cms_jet_xi        , cmcc_cms_mean_jet        , cmcc_cms_std_jet        , cmcc_cms_jet_trends_yrs       , cmcc_cms_jet_loc_f            , cmcc_cms_jet_loc_xi           , cmcc_cms_mean_jet_loc       , cmcc_cms_std_jet_loc       , cmcc_cms_jet_loc_trends_yrs       , cmcc_cms_time_year        ] = CMCC_CMs_taux;
%[ cnrm_cm5_jet_f        , cnrm_cm5_jet_xi        , cnrm_cm5_mean_jet        , cnrm_cm5_std_jet        , cnrm_cm5_jet_trends_yrs       , cnrm_cm5_jet_loc_f            , cnrm_cm5_jet_loc_xi           , cnrm_cm5_mean_jet_loc       , cnrm_cm5_std_jet_loc       , cnrm_cm5_jet_loc_trends_yrs       , cnrm_cm5_time_year        ] = CNRM_CM5_taux;
 [ cnrm_cm52_jet_f       , cnrm_cm52_jet_xi       , cnrm_cm52_mean_jet       , cnrm_cm52_std_jet       , cnrm_cm52_jet_trends_yrs      , cnrm_cm52_jet_loc_f           , cnrm_cm52_jet_loc_xi          , cnrm_cm52_mean_jet_loc      , cnrm_cm52_std_jet_loc      , cnrm_cm52_jet_loc_trends_yrs      , cnrm_cm52_time_year       ] = CNRM_CM52_taux;
 [ gfdl_esm2g_jet_f      , gfdl_esm2g_jet_xi      , gfdl_esm2g_mean_jet      , gfdl_esm2g_std_jet      , gfdl_esm2g_jet_trends_yrs     , gfdl_esm2g_jet_loc_f          , gfdl_esm2g_jet_loc_xi         , gfdl_esm2g_mean_jet_loc     , gfdl_esm2g_std_jet_loc     , gfdl_esm2g_jet_loc_trends_yrs     , gfdl_esm2g_time_year      ] = GFDL_ESM2G_taux;
 [ gfdl_esm2m_jet_f      , gfdl_esm2m_jet_xi      , gfdl_esm2m_mean_jet      , gfdl_esm2m_std_jet      , gfdl_esm2m_jet_trends_yrs     , gfdl_esm2m_jet_loc_f          , gfdl_esm2m_jet_loc_xi         , gfdl_esm2m_mean_jet_loc     , gfdl_esm2m_std_jet_loc     , gfdl_esm2m_jet_loc_trends_yrs     , gfdl_esm2m_time_year      ] = GFDL_ESM2M_taux;
 [ ipsl_cm5a_lr_jet_f    , ipsl_cm5a_lr_jet_x     , ipsl_cm5a_lr_mean_jet    , ipsl_cm5a_lr_std_jet    , ipsl_cm5a_lr_jet_trends_yrs   , ipsl_cm5a_lr_jet_loc_f        , ipsl_cm5a_lr_jet_loc_xi       , ipsl_cm5a_lr_mean_jet_loc   , ipsl_cm5a_lr_std_jet_loc   , ipsl_cm5a_lr_jet_loc_trends_yrs   , ipsl_cm5a_lr_time_year    ] = IPSL_CM5a_LR_taux;
 [ ipsl_cm5a_mr_jet_f    , ipsl_cm5a_mr_jet_xi    , ipsl_cm5a_mr_mean_jet    , ipsl_cm5a_mr_std_jet    , ipsl_cm5a_mr_jet_trends_yrs   , ipsl_cm5a_mr_jet_loc_f        , ipsl_cm5a_mr_jet_loc_xi       , ipsl_cm5a_mr_mean_jet_loc   , ipsl_cm5a_mr_std_jet_loc   , ipsl_cm5a_mr_jet_loc_trends_yrs   , ipsl_cm5a_mr_time_year    ] = IPSL_CM5a_MR_taux;
 [ ipsl_cm5b_lr_jet_f    , ipsl_cm5b_lr_jet_xi    , ipsl_cm5b_lr_mean_jet    , ipsl_cm5b_lr_std_jet    , ipsl_cm5b_lr_jet_trends_yrs   , ipsl_cm5b_lr_jet_loc_f        , ipsl_cm5b_lr_jet_loc_xi       , ipsl_cm5b_lr_mean_jet_loc   , ipsl_cm5b_lr_std_jet_loc   , ipsl_cm5b_lr_jet_loc_trends_yrs   , ipsl_cm5b_lr_time_year    ] = IPSL_CM5b_LR_taux;
 [ miroc_esm_jet_f       , miroc_esm_jet_xi       , miroc_esm_mean_jet       , miroc_esm_std_jet       , miroc_esm_jet_trends_yrs      , miroc_esm_jet_loc_f           , miroc_esm_jet_loc_xi          , miroc_esm_mean_jet_loc      , miroc_esm_std_jet_loc      , miroc_esm_jet_loc_trends_yrs      , miroc_esm_time_year       ] = MIROC_ESM_taux;
 [ miroc_esm_chem_jet_f  , miroc_esm_chem_jet_xi  , miroc_esm_chem_mean_jet  , miroc_esm_chem_std_jet  , miroc_esm_chem_jet_trends_yrs , miroc_esm_chem_jet_loc_f      , miroc_esm_chem_jet_loc_xi     , miroc_esm_chem_mean_jet_loc , miroc_esm_chem_std_jet_loc , miroc_esm_chem_jet_loc_trends_yrs , miroc_esm_chem_time_year  ] = MIROC_ESM_CHEM_taux;
 [ mri_cgcm3_jet_f       , mri_cgcm3_jet_xi       , mri_cgcm3_mean_jet       , mri_cgcm3_std_jet       , mri_cgcm3_jet_trends_yrs      , mri_cgcm3_jet_loc_f           , mri_cgcm3_jet_loc_xi          , mri_cgcm3_mean_jet_loc      , mri_cgcm3_std_jet_loc      , mri_cgcm3_jet_loc_trends_yrs      , mri_cgcm3_time_year       ] = MRI_CGCM3_taux;
 [ mpi_esm_lr_jet_f      , mpi_esm_lr_jet_xi      , mpi_esm_lr_mean_jet      , mpi_esm_lr_std_jet      , mpi_esm_lr_jet_trends_yrs     , mpi_esm_lr_jet_loc_f          , mpi_esm_lr_jet_loc_xi         , mpi_esm_lr_mean_jet_loc     , mpi_esm_lr_std_jet_loc     , mpi_esm_lr_jet_loc_trends_yrs     , mpi_esm_lr_time_year      ] = MPI_ESM_LR_taux;
 [ mpi_esm_mr_jet_f      , mpi_esm_mr_jet_xi      , mpi_esm_mr_mean_jet      , mpi_esm_mr_std_jet      , mpi_esm_mr_jet_trends_yrs     , mpi_esm_mr_jet_loc_f          , mpi_esm_mr_jet_loc_xi         , mpi_esm_mr_mean_jet_loc     , mpi_esm_mr_std_jet_loc     , mpi_esm_mr_jet_loc_trends_yrs     , mpi_esm_mr_time_year      ] = MPI_ESM_MR_taux;
 [ miroc5_jet_f          , miroc5_jet_xi          , miroc5_mean_jet          , miroc5_std_jet          , miroc5_jet_trends_yrs         , miroc5_jet_loc_f              , miroc5_jet_loc_xi             , miroc5_mean_jet_loc         , miroc5_std_jet_loc         , miroc5_jet_loc_trends_yrs         , miroc5_time_year          ] = MIROC5_taux;
% NOR ESM1m M
 [ nor_esm1m_me_jet_f    , nor_esm1m_me_jet_xi    , nor_esm1m_me_mean_jet    , nor_esm1m_me_std_jet    , nor_esm1m_me_jet_trends_yrs   , nor_esm1m_me_jet_loc_f        , nor_esm1m_me_jet_loc_xi       , nor_esm1m_me_mean_jet_loc   , nor_esm1m_me_std_jet_loc   , nor_esm1m_me_jet_loc_trends_yrs   , nor_esm1m_me_time_year    ] = NOR_ESM1m_ME_taux;

% GFDL Models
 [ cm2mc_jet_f    , cm2mc_jet_xi    , cm2mc_mean_jet    , cm2mc_std_jet    , cm2mc_jet_trends_yrs   , cm2mc_jet_loc_f        , cm2mc_jet_loc_xi       , cm2mc_mean_jet_loc   , cm2mc_std_jet_loc   , cm2mc_jet_loc_trends_yrs   , cm2mc_time_year    ] = CM2Mc_taux;
 [ cm21_jet_f    , cm21_jet_xi    , cm21_mean_jet    , cm21_std_jet    , cm21_jet_trends_yrs   , cm21_jet_loc_f        , cm21_jet_loc_xi       , cm21_mean_jet_loc   , cm21_std_jet_loc   , cm21_jet_loc_trends_yrs   , cm21_time_year    ] = CM21_taux;

 
% NCEP Reanalyses 

trend_period = 30;

[ taux_trend_30, ~, lat_trend_30, ~, ~, ~ ] = NCEP1_trends(trend_period);
[ taux_trend_30_2, ~, lat_trend_30_2, ~, ~, ~ ] = NCEP2_trends(trend_period);


%% Jet Location
figure(1)
plot(ccsm4_jet_xi, ccsm4_jet_f, 'b-o' )
hold on
plot(cmcc_cesm_jet_xi, cmcc_cesm_jet_f, 'g-o')
plot(cmcc_cm_jet_xi      , cmcc_cm_jet_f          , 'r-o')
plot(cmcc_cms_jet_xi     , cmcc_cms_jet_f         , 'c-o')
%plot(cnrm_cm5_jet_xi      , cnrm_cm5_jet_f        , 'k-o')
plot(cnrm_cm52_jet_xi     , cnrm_cm52_jet_f       , 'm-o')
plot(gfdl_esm2g_jet_xi    , gfdl_esm2g_jet_f      , 'c-' )
plot(gfdl_esm2m_jet_xi    , gfdl_esm2m_jet_f      , 'g-' )
plot(ipsl_cm5a_lr_jet_x   , ipsl_cm5a_lr_jet_f  , 'b-*')
plot(ipsl_cm5a_mr_jet_xi  , ipsl_cm5a_mr_jet_f  , 'g-*')
plot(ipsl_cm5b_lr_jet_xi  , ipsl_cm5b_lr_jet_f  , 'r-*')
plot(miroc_esm_jet_xi     , miroc_esm_jet_f     , 'c-*')
plot(miroc_esm_chem_jet_xi, miroc_esm_chem_jet_f, 'k-*')
plot(mri_cgcm3_jet_xi     , mri_cgcm3_jet_f       , 'b-s')
plot(mpi_esm_lr_jet_xi    , mpi_esm_lr_jet_f      , 'g-s')
plot(mpi_esm_mr_jet_xi    , mpi_esm_mr_jet_f      , 'r-s')
plot(miroc5_jet_xi        , miroc5_jet_f          , 'r-' )
%plot(nor_esm1m_m_jet_xi   , nor_esm1m_m_jet_f     , 'c-s')
plot(nor_esm1m_me_jet_xi  , nor_esm1m_me_jet_f    , 'k-s')

plot(cm2mc_jet_xi, cm2mc_jet_f, 'b', 'linewidth', 2)
plot(cm21_jet_xi , cm21_jet_f , 'g', 'linewidth', 2)

hR1 = vline(taux_trend_30, '-k');
hR2 = vline(taux_trend_30_2, '-.k');

legend('CCSM4', 'CMCC CESM', 'CMCC CM', 'CMCC CMs','CNRM CM5-2','GFDL ESM2M','GFDL ESM2G', 'IPSL CM5a LR', 'IPSL CM5a MR', 'IPSL CM5b LR','MIROC ESM','MIROC ESM CHEM', 'MRI CGCM3', 'MPI ESM LR', 'MPI ESM MR', 'MIROC5', 'NOR ESM1m ME', 'CM2Mc', 'CM2.1')
set(gca, 'fontsize', 12)
set(gcf, 'position', [100, 100, 1049, 895])
xlabel('30 Year Linear Trend (Pa/30 years)', 'fontsize', 12)
ylabel('Probability density estimate', 'fontsize', 12)


model_labels = {'   ';'CanESM2'; 'CCSM4';'CMCC CESM'; 'CMCC CM'; 'CMCC CMs'; 'CNRM CM5'; 'CNRM CM5-2';'GFDL ESM2G';'GFDL_ESM2M'; 'IPSL CM5a LR'; 'IPSL CM5a MR';...
    'IPSL CM5b LR'; 'MIROC ESM'; 'MIROC ESM CHEM';'MIROC5';'MPI CGCM3';'MPI ESM LR'; 'MPI ESM MR'; 'NOR ESM1m M'; 'NOR ESM1m ME';...
    'CM2Mc'; 'CM2.1'; '   '};

Trends = NaN*ones(21,4000);
%Trends(1, 1:length(can_esm2_jet_trends_yrs)) = can_esm2_jet_trends_yrs;
Trends(2, 1:length(ccsm4_jet_trends_yrs)) = ccsm4_jet_trends_yrs;
Trends(3, 1:length(cmcc_cesm_jet_trends_yrs)) = cmcc_cesm_jet_trends_yrs;
Trends(4, 1:length(cmcc_cm_jet_trends_yrs)) = cmcc_cm_jet_trends_yrs;
Trends(5, 1:length(cmcc_cms_jet_trends_yrs)) = cmcc_cms_jet_trends_yrs;
%Trends(6, 1:length(cnrm_cm5_jet_trends_yrs)) = cnrm_cm5_jet_trends_yrs;
Trends(7, 1:length(cnrm_cm52_jet_trends_yrs)) = cnrm_cm52_jet_trends_yrs;
Trends(8, 1:length(gfdl_esm2g_jet_trends_yrs)) = gfdl_esm2g_jet_trends_yrs;
Trends(9, 1:length(gfdl_esm2m_jet_trends_yrs)) = gfdl_esm2m_jet_trends_yrs;
Trends(10, 1:length(ipsl_cm5a_lr_jet_trends_yrs)) = ipsl_cm5a_lr_jet_trends_yrs;
Trends(11, 1:length(ipsl_cm5a_mr_jet_trends_yrs)) = ipsl_cm5a_mr_jet_trends_yrs;
Trends(12, 1:length(ipsl_cm5b_lr_jet_trends_yrs)) = ipsl_cm5b_lr_jet_trends_yrs;
Trends(13, 1:length(miroc_esm_jet_trends_yrs)) = miroc_esm_jet_trends_yrs;
Trends(14, 1:length(miroc_esm_chem_jet_trends_yrs)) = miroc_esm_chem_jet_trends_yrs;
Trends(15, 1:length(miroc5_jet_trends_yrs)) = miroc5_jet_trends_yrs;
Trends(16, 1:length(mpi_esm_lr_jet_trends_yrs)) = mpi_esm_lr_jet_trends_yrs;
Trends(17, 1:length(mpi_esm_mr_jet_trends_yrs)) = mpi_esm_mr_jet_trends_yrs;
Trends(18, 1:length(mri_cgcm3_jet_trends_yrs)) = mri_cgcm3_jet_trends_yrs;
%Trends(19, 1:length(nor_esm1m_m_jet_trends_yrs)) = nor_esm1m_m_jet_trends_yrs;
Trends(20, 1:length(nor_esm1m_me_jet_trends_yrs)) = nor_esm1m_me_jet_trends_yrs;
Trends(21, 1:length(cm2mc_jet_trends_yrs)) = cm2mc_jet_trends_yrs;
Trends(22, 1:length(cm21_jet_trends_yrs)) = cm21_jet_trends_yrs;

Models = {'CanESM2'; 'CCSM4';'CMCC CESM'; 'CMCC CM'; 'CMCC CMs'; 'CNRM CM5'; 'CNRM CM5-2';'GFDL ESM2G';'GFDL ESM2M'; 'IPSL CM5a LR'; 'IPSL CM5a MR';...
    'IPSL CM5b LR'; 'MIROC ESM'; 'MIROC ESM CHEM';'MIROC5';'MRI CGCM3';'MPI ESM LR'; 'MPI ESM MR'; 'NOR ESM1m M'; 'NOR ESM1m ME';...
    'CM2Mc'; 'CM2.1'};

percentile = prctile(Trends, 95, 1);


figure(2)
%h1 = plot(1, 2*canems2_std_jet, '*', 'markersize', 12)
h1 = plot(2, 2*ccsm4_std_jet, '*', 'markersize', 12);
hold on
plot(3, 2*cmcc_cesm_std_jet, '*', 'markersize', 12)
plot(4, 2*cmcc_cm_std_jet, '*', 'markersize', 12)
plot(5, 2*cmcc_cms_std_jet, '*', 'markersize', 12)
%plot(6, 2*cnrm_cm5_std_jet, '*', 'markersize', 12)
plot(7, 2*cnrm_cm52_std_jet, '*', 'markersize', 12)
plot(8, 2*gfdl_esm2g_std_jet, '*', 'markersize', 12)
plot(9, 2*gfdl_esm2m_std_jet, '*', 'markersize', 12)
plot(10, 2*ipsl_cm5a_lr_std_jet, '*', 'markersize', 12)
plot(11, 2*ipsl_cm5a_mr_std_jet, '*', 'markersize', 12)
plot(12, 2*ipsl_cm5b_lr_std_jet, '*', 'markersize', 12)
plot(13, 2*miroc_esm_std_jet, '*', 'markersize', 12)
plot(14, 2*miroc_esm_chem_std_jet, '*', 'markersize', 12)
plot(15, 2*miroc5_std_jet, '*', 'markersize', 12)
plot(16, 2*mpi_esm_lr_std_jet, '*', 'markersize', 12)
plot(17, 2*mpi_esm_mr_std_jet, '*', 'markersize', 12)
plot(18, 2*mri_cgcm3_std_jet, '*', 'markersize', 12)
%plot(19, 2*nor_esm1m_m_std_jet, '*', 'markersize', 12)
plot(20, 2*nor_esm1m_me_std_jet, '*', 'markersize', 12)
plot(21, 2*cm2mc_std_jet, '*', 'markersize', 12)
plot(22, 2*cm21_std_jet, '*', 'markersize', 12)

xlim([0,23])
hR1 = hline(taux_trend_30, '-k');
hR2 = hline(taux_trend_30_2, '-.k');

%h2 = plot(1, percentile(1), 'r*', 'markersize', 12);
h2 = plot(2, percentile(2), 'r*', 'markersize', 12);
plot(3, percentile(3), 'r*', 'markersize', 12)
plot(4, percentile(4), 'r*', 'markersize', 12)
plot(5, percentile(5), 'r*', 'markersize', 12)
%plot(6, percentile(6), 'r*', 'markersize', 12)
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
%plot(19, percentile(19), 'r*', 'markersize', 12)
plot(20, percentile(20), 'r*', 'markersize', 12)
plot(21, percentile(21), 'r*', 'markersize', 12)
plot(22, percentile(22), 'r*', 'markersize', 12)

set(gca, 'XTick', 0:23)
set(gca, 'XTickLabel', model_labels)
set(gca, 'fontsize', 12)
set(gcf, 'position', [100, 100, 1049, 495])
ylabel('Wind stress (Pa)','fontsize', 12)
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
    
    
    %% Jet Position
    
figure(4)
%CanESM2
plot(ccsm4_jet_loc_xi, ccsm4_jet_loc_f, 'b-o' )
hold on
plot(cmcc_cesm_jet_loc_xi, cmcc_cesm_jet_loc_f, 'g-o')
plot(cmcc_cm_jet_loc_xi, cmcc_cm_jet_loc_f, 'r-o')
plot(cmcc_cms_jet_loc_xi, cmcc_cms_jet_loc_f, 'c-o')
%plot(cnrm_cm5_jet_loc_xi, cnrm_cm5_jet_loc_f, 'k-o')
plot(cnrm_cm52_jet_loc_xi, cnrm_cm52_jet_loc_f, 'm-o')
plot(gfdl_esm2g_jet_loc_xi, gfdl_esm2g_jet_loc_f, 'r-')
plot(gfdl_esm2m_jet_loc_xi, gfdl_esm2m_jet_loc_f, 'g-')
plot(ipsl_cm5a_lr_jet_loc_xi, ipsl_cm5a_lr_jet_loc_f, 'b-*')
plot(ipsl_cm5a_mr_jet_loc_xi, ipsl_cm5a_mr_jet_loc_f, 'g-*')
plot(ipsl_cm5b_lr_jet_loc_xi, ipsl_cm5b_lr_jet_loc_f, 'r-*')
plot(miroc_esm_jet_loc_xi, miroc_esm_jet_loc_f,'c-*')
plot(miroc_esm_chem_jet_loc_xi, miroc_esm_chem_jet_loc_f, 'k-*')
plot(miroc5_jet_loc_xi, miroc5_jet_loc_f, 'c-*')
plot(mri_cgcm3_jet_loc_xi, mri_cgcm3_jet_loc_f, 'b-s')
plot(mpi_esm_lr_jet_loc_xi, mpi_esm_lr_jet_loc_f,'g-s')
plot(mpi_esm_mr_jet_loc_xi, mpi_esm_mr_jet_loc_f,'r-s')
%plot(nor_esm1m_m_jet_loc_xi, nor_esm1m_m_jet_loc_f,'c-s')
plot(nor_esm1m_me_jet_loc_xi, nor_esm1m_me_jet_loc_f,'k-s')
plot(cm2mc_jet_loc_xi, cm2mc_jet_loc_f, 'b', 'linewidth', 2)
plot(cm21_jet_loc_xi, cm21_jet_loc_f, 'g', 'linewidth', 2)
hR1 = vline(lat_trend_30, '-k');
hR2 = vline(lat_trend_30_2, '-.k');
legend('CCSM4', 'CMCC CESM', 'CMCC CM', 'CMCC CMs','CNRM CM5-2','GFDL ESM2M',...
    'GFDL ESM2G', 'IPSL CM5a LR', 'IPSL CM5a MR', 'IPSL CM5b LR', 'MRI CGCM3',...
    'MPI ESM LR', 'MPI ESM MR', 'MIROC5', 'NOR ESM1m ME', 'CM2Mc', 'CM2.1')
set(gca, 'fontsize', 12)
set(gcf, 'position', [100, 100, 1049, 895])
xlabel('30 Year Linear Trend (Degrees Lat/30 years)', 'fontsize', 12)
ylabel('Probability density estimate', 'fontsize', 12)
   

Trends = NaN*ones(21,4000);
%Trends(1, 1:length(can_esm2_jet_loc_trends_yrs)) = can_esm2_jet_loc_trends_yrs;
Trends(2, 1:length(ccsm4_jet_loc_trends_yrs)) = ccsm4_jet_loc_trends_yrs;
Trends(3, 1:length(cmcc_cesm_jet_loc_trends_yrs)) = cmcc_cesm_jet_loc_trends_yrs;
Trends(4, 1:length(cmcc_cm_jet_loc_trends_yrs)) = cmcc_cm_jet_loc_trends_yrs;
Trends(5, 1:length(cmcc_cms_jet_loc_trends_yrs)) = cmcc_cms_jet_loc_trends_yrs;
%Trends(6, 1:length(cnrm_cm5_jet_loc_trends_yrs)) = cnrm_cm5_jet_loc_trends_yrs;
Trends(7, 1:length(cnrm_cm52_jet_loc_trends_yrs)) = cnrm_cm52_jet_loc_trends_yrs;
Trends(8, 1:length(gfdl_esm2g_jet_loc_trends_yrs)) = gfdl_esm2g_jet_loc_trends_yrs;
Trends(9, 1:length(gfdl_esm2m_jet_loc_trends_yrs)) = gfdl_esm2m_jet_loc_trends_yrs;
Trends(10, 1:length(ipsl_cm5a_lr_jet_loc_trends_yrs)) = ipsl_cm5a_lr_jet_loc_trends_yrs;
Trends(11, 1:length(ipsl_cm5a_mr_jet_loc_trends_yrs)) = ipsl_cm5a_mr_jet_loc_trends_yrs;
Trends(12, 1:length(ipsl_cm5b_lr_jet_loc_trends_yrs)) = ipsl_cm5b_lr_jet_loc_trends_yrs;
Trends(13, 1:length(miroc_esm_jet_loc_trends_yrs)) = miroc_esm_jet_loc_trends_yrs;
Trends(14, 1:length(miroc_esm_chem_jet_loc_trends_yrs)) = miroc_esm_chem_jet_loc_trends_yrs;
Trends(15, 1:length(miroc5_jet_loc_trends_yrs)) = miroc5_jet_loc_trends_yrs;
Trends(16, 1:length(mpi_esm_lr_jet_loc_trends_yrs)) = mpi_esm_lr_jet_loc_trends_yrs;
Trends(17, 1:length(mpi_esm_mr_jet_loc_trends_yrs)) = mpi_esm_mr_jet_loc_trends_yrs;
Trends(18, 1:length(mri_cgcm3_jet_loc_trends_yrs)) = mri_cgcm3_jet_loc_trends_yrs;
%Trends(19, 1:length(nor_esm1m_m_jet_loc_trends_yrs)) = nor_esm1m_m_jet_loc_trends_yrs;
Trends(20, 1:length(nor_esm1m_me_jet_loc_trends_yrs)) = nor_esm1m_me_jet_loc_trends_yrs;
Trends(21, 1:length(cm2mc_jet_loc_trends_yrs)) = cm2mc_jet_loc_trends_yrs;
Trends(22, 1:length(cm21_jet_loc_trends_yrs)) = cm21_jet_loc_trends_yrs;


percentile = prctile(Trends, 95, 1);


figure(5)
%h1 = plot(1, 2*canems2_std_jet_loc, '*', 'markersize', 12)
h1 = plot(2, 2*ccsm4_std_jet_loc, '*', 'markersize', 12);
hold on
plot(3, 2*cmcc_cesm_std_jet_loc, '*', 'markersize', 12)
plot(4, 2*cmcc_cm_std_jet_loc, '*', 'markersize', 12)
plot(5, 2*cmcc_cms_std_jet_loc, '*', 'markersize', 12)
%plot(6, 2*cnrm_cm5_std_jet_loc, '*', 'markersize', 12)
plot(7, 2*cnrm_cm52_std_jet_loc, '*', 'markersize', 12)
plot(8, 2*gfdl_esm2g_std_jet_loc, '*', 'markersize', 12)
plot(9, 2*gfdl_esm2m_std_jet_loc, '*', 'markersize', 12)
plot(10, 2*ipsl_cm5a_lr_std_jet_loc, '*', 'markersize', 12)
plot(11, 2*ipsl_cm5a_mr_std_jet_loc, '*', 'markersize', 12)
plot(12, 2*ipsl_cm5b_lr_std_jet_loc, '*', 'markersize', 12)
plot(13, 2*miroc_esm_std_jet_loc, '*', 'markersize', 12)
plot(14, 2*miroc_esm_chem_std_jet_loc, '*', 'markersize', 12)
plot(15, 2*miroc5_std_jet_loc, '*', 'markersize', 12)
plot(16, 2*mpi_esm_lr_std_jet_loc, '*', 'markersize', 12)
plot(17, 2*mpi_esm_mr_std_jet_loc, '*', 'markersize', 12)
plot(18, 2*mri_cgcm3_std_jet_loc, '*', 'markersize', 12)
%plot(19, 2*nor_esm1m_m_std_jet_loc, '*', 'markersize', 12)
plot(20, 2*nor_esm1m_me_std_jet_loc, '*', 'markersize', 12)
plot(21, 2*cm2mc_std_jet_loc, '*', 'markersize', 12)
plot(22, 2*cm21_std_jet_loc, '*', 'markersize', 12)

xlim([0,23])
hR1 = hline(lat_trend_30, '-k');
hR2 = hline(lat_trend_30_2, '-.k');

%h2 = plot(1, percentile(1), 'r*', 'markersize', 12);
h2 = plot(2, percentile(2), 'r*', 'markersize', 12);
plot(3, percentile(3), 'r*', 'markersize', 12)
plot(4, percentile(4), 'r*', 'markersize', 12)
plot(5, percentile(5), 'r*', 'markersize', 12)
%plot(6, percentile(6), 'r*', 'markersize', 12)
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
%plot(19, percentile(19), 'r*', 'markersize', 12)
plot(20, percentile(20), 'r*', 'markersize', 12)
plot(21, percentile(21), 'r*', 'markersize', 12)
plot(22, percentile(22), 'r*', 'markersize', 12)

set(gca, 'XTick', 0:23)
set(gca, 'XTickLabel', model_labels)
set(gca, 'fontsize', 12)
set(gcf, 'position', [100, 100, 1049, 495])
ylabel('Wind stress (Pa)','fontsize', 12)
legend([h1, h2, hR1, hR2], '2 x Standard Deviation', '95th Percentile','Reanalysis 1', 'Reanalysis 2')
rotateXLabels( gca(), 45 )


figure(6)
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
    
    beep
        