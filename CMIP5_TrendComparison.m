%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script to compare surface field variability across multiple models
% Jordan Thomas 
% April 21, 2014
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Matlab Housekeeping

close all
clear all



%% Load Data

% [ ccsm4_SAM_unnormalized, ccsm4_jet_ann, ccsm4_lat_jet_ann, ccsm4_taux_f, ccsm4_taux_xi, ccsm4_loc_f, ccsm4_loc_xi, ccsm4_sam_f, ccsm4_sam_xi, ccsm4_mean_taux, ccsm4_std_taux, ccsm4_mean_loc, ccsm4_std_loc, ccsm4_mean_sam, ccsm4_std_sam ] = CMIP5_surfacetrends('http://strega.ldeo.columbia.edu:81/expert/CMIP5/.byScenario/.piControl/.atmos/.mon/.ps/.CCSM4/.r1i1p1/dods','http://strega.ldeo.columbia.edu:81/CMIP5/.byScenario/.piControl/.ocean/.mon/.tauuo/.CCSM4/.r1i1p1/.tauuo/dods', 30);
 [ cmcc_cesm_SAM_unnormalized,  cmcc_cesm_jet_ann, cmcc_cesm_lat_jet_ann,  cmcc_cesm_taux_f, cmcc_cesm_taux_xi, cmcc_cesm_loc_f, cmcc_cesm_loc_xi, cmcc_cesm_sam_f, cmcc_cesm_sam_xi, cmcc_cesm_mean_taux, cmcc_cesm_std_taux, cmcc_cesm_mean_loc, cmcc_cesm_std_loc, cmcc_cesm_mean_sam, cmcc_cesm_std_sam ] = CMIP5_surfacetrends('','', 30);
% [ cmcc_cm_SAM_unnormalized, cmcc_cm_jet_ann, cmcc_cm_lat_jet_ann, cmcc_cm_taux_f, cmcc_cm_taux_xi, cmcc_cm_loc_f, cmcc_cm_loc_xi, cmcc_cm_sam_f, cmcc_cm_sam_xi, cmcc_cm_mean_taux, cmcc_cm_std_taux, cmcc_cm_mean_loc, cmcc_cm_std_loc, cmcc_cm_mean_sam, cmcc_cm_std_sam ] = CMIP5_surfacetrends('','', 30);
% [ cmcc_cms_SAM_unnormalized, cmcc_cms_jet_ann, cmcc_cms_lat_jet_ann, cmcc_cms_taux_f, cmcc_cms_taux_xi, cmcc_cms_loc_f, cmcc_cms_loc_xi, cmcc_cms_sam_f, cmcc_cms_sam_xi, cmcc_cms_mean_taux, cmcc_cms_std_taux, cmcc_cms_mean_loc, cmcc_cms_std_loc, cmcc_cms_mean_sam, cmcc_cms_std_sam ] = CMIP5_surfacetrends('','', 30);
% [ cnrm_cm5_SAM_unnormalized, cnrm_cm5_jet_ann, cnrm_cm5_lat_jet_ann, cnrm_cm5_taux_f, cnrm_cm5_taux_xi, cnrm_cm5_loc_f, cnrm_cm5_loc_xi, cnrm_cm5_sam_f, cnrm_cm5_sam_xi, cnrm_cm5_mean_taux, cnrm_cm5_std_taux, cnrm_cm5_mean_loc, cnrm_cm5_std_loc, cnrm_cm5_mean_sam, cnrm_cm5_std_sam ] = CMIP5_surfacetrends('','', 30);
% [ cnrm_cm52_SAM_unnormalized, cnrm_cm52_jet_ann, cnrm_cm52_lat_jet_ann, cnrm_cm52_taux_f, cnrm_cm52_taux_xi, cnrm_cm52_loc_f, cnrm_cm52_loc_xi, cnrm_cm52_sam_f, cnrm_cm52_sam_xi, cnrm_cm52_mean_taux, cnrm_cm52_std_taux, cnrm_cm52_mean_loc, cnrm_cm52_std_loc, cnrm_cm52_mean_sam, cnrm_cm52_std_sam ] = CMIP5_surfacetrends('','', 30);
% [ ipsl_cm5a_lr_SAM_unnormalized, ipsl_cm5a_lr_jet_ann, ipsl_cm5a_lr_lat_jet_ann, ipsl_cm5a_lr_taux_f, ipsl_cm5a_lr_taux_xi, ipsl_cm5a_lr_loc_f, ipsl_cm5a_lr_loc_xi, ipsl_cm5a_lr_sam_f, ipsl_cm5a_lr_sam_xi, ipsl_cm5a_lr_mean_taux, ipsl_cm5a_lr_std_taux, ipsl_cm5a_lr_mean_loc, ipsl_cm5a_lr_std_loc, ipsl_cm5a_lr_mean_sam, ipsl_cm5a_lr_std_sam ] = CMIP5_surfacetrends('','', 30);
% [ ipsl_cm5a_mr_SAM_unnormalized, ipsl_cm5a_mr_jet_ann, ipsl_cm5a_mr_lat_jet_ann, ipsl_cm5a_mr_taux_f, ipsl_cm5a_mr_taux_xi, ipsl_cm5a_mr_loc_f, ipsl_cm5a_mr_loc_xi, ipsl_cm5a_mr_sam_f, ipsl_cm5a_mr_sam_xi, ipsl_cm5a_mr_mean_taux, ipsl_cm5a_mr_std_taux, ipsl_cm5a_mr_mean_loc, ipsl_cm5a_mr_std_loc, ipsl_cm5a_mr_mean_sam, ipsl_cm5a_mr_std_sam ] = CMIP5_surfacetrends('','', 30);
% [ ipsl_cm5b_lr_SAM_unnormalized, ipsl_cm5b_lr_jet_ann, ipsl_cm5b_lr_lat_jet_ann, ipsl_cm5b_lr_taux_f, ipsl_cm5b_lr_taux_xi, ipsl_cm5b_lr_loc_f, ipsl_cm5b_lr_loc_xi, ipsl_cm5b_lr_sam_f, ipsl_cm5b_lr_sam_xi, ipsl_cm5b_lr_mean_taux, ipsl_cm5b_lr_std_taux, ipsl_cm5b_lr_mean_loc, ipsl_cm5b_lr_std_loc, ipsl_cm5b_lr_mean_sam, ipsl_cm5b_lr_std_sam ] = CMIP5_surfacetrends('','', 30);
% [ miroc_esm_SAM_unnormalized, miroc_esm_jet_ann, miroc_esm_lat_jet_ann, miroc_esm_taux_f, miroc_esm_taux_xi, miroc_esm_loc_f, miroc_esm_loc_xi, miroc_esm_sam_f, miroc_esm_sam_xi, miroc_esm_mean_taux, miroc_esm_std_taux, miroc_esm_mean_loc, miroc_esm_std_loc, miroc_esm_mean_sam, miroc_esm_std_sam ] = CMIP5_surfacetrends('','', 30);
% [ miroc_esm_chem_SAM_unnormalized, miroc_esm_chem_jet_ann, miroc_esm_chem_lat_jet_ann, miroc_esm_chem_taux_f, miroc_esm_chem_taux_xi, miroc_esm_chem_loc_f, miroc_esm_chem_loc_xi, miroc_esm_chem_sam_f, miroc_esm_chem_sam_xi, miroc_esm_chem_mean_taux, miroc_esm_chem_std_taux, miroc_esm_chem_mean_loc, miroc_esm_chem_std_loc, miroc_esm_chem_mean_sam, miroc_esm_chem_std_sam ] = CMIP5_surfacetrends('','', 30);
% [ miroc5_SAM_unnormalized, miroc5_jet_ann, miroc5_lat_jet_ann, miroc5_taux_f, miroc5_taux_xi, miroc5_loc_f, miroc5_loc_xi, miroc5_sam_f, miroc5_sam_xi, miroc5_mean_taux, miroc5_std_taux, miroc5_mean_loc, miroc5_std_loc, miroc5_mean_sam, miroc5_std_sam ] = CMIP5_surfacetrends('','', 30);
% [ mpi_esm_lr_SAM_unnormalized, mpi_esm_lr_jet_ann, mpi_esm_lr_lat_jet_ann, mpi_esm_lr_taux_f, mpi_esm_lr_taux_xi, mpi_esm_lr_loc_f, mpi_esm_lr_loc_xi, mpi_esm_lr_sam_f, mpi_esm_lr_sam_xi, mpi_esm_lr_mean_taux, mpi_esm_lr_std_taux, mpi_esm_lr_mean_loc, mpi_esm_lr_std_loc, mpi_esm_lr_mean_sam, mpi_esm_lr_std_sam ] = CMIP5_surfacetrends('','', 30);
% [ mpi_esm_mr_SAM_unnormalized, mpi_esm_mr_jet_ann, mpi_esm_mr_lat_jet_ann, mpi_esm_mr_taux_f, mpi_esm_mr_taux_xi, mpi_esm_mr_loc_f, mpi_esm_mr_loc_xi, mpi_esm_mr_sam_f, mpi_esm_mr_sam_xi, mpi_esm_mr_mean_taux, mpi_esm_mr_std_taux, mpi_esm_mr_mean_loc, mpi_esm_mr_std_loc, mpi_esm_mr_mean_sam, mpi_esm_mr_std_sam ] = CMIP5_surfacetrends('','', 30);
% [ mpi_cgcm3__SAM_unnormalized, mpi_cgcm3_jet_ann, mpi_cgcm3_lat_jet_ann, mpi_cgcm3_taux_f, mpi_cgcm3_taux_xi, mpi_cgcm3_loc_f, mpi_cgcm3_loc_xi, mpi_cgcm3_sam_f, mpi_cgcm3_sam_xi, mpi_cgcm3_mean_taux, mpi_cgcm3_std_taux, mpi_cgcm3_mean_loc, mpi_cgcm3_std_loc, mpi_cgcm3_mean_sam, mpi_cgcm3_std_sam ] = CMIP5_surfacetrends('','', 30);
% [ nor_esm1m_m_SAM_unnormalized, nor_esm1m_m_jet_ann, nor_esm1m_m_lat_jet_ann, nor_esm1m_m_taux_f, nor_esm1m_m_taux_xi, nor_esm1m_m_loc_f, nor_esm1m_m_loc_xi, nor_esm1m_m_sam_f, nor_esm1m_m_sam_xi, nor_esm1m_m_mean_taux, nor_esm1m_m_std_taux, nor_esm1m_m_mean_loc, nor_esm1m_m_std_loc, nor_esm1m_m_mean_sam, nor_esm1m_m_std_sam ] = CMIP5_surfacetrends('','', 30);
% [ nor_esm1m_me_SAM_unnormalized, nor_esm1m_me_jet_ann, nor_esm1m_me_lat_jet_ann, nor_esm1m_me_taux_f, nor_esm1m_me_taux_xi, nor_esm1m_me_loc_f, nor_esm1m_me_loc_xi, nor_esm1m_me_sam_f, nor_esm1m_me_sam_xi, nor_esm1m_me_mean_taux, nor_esm1m_me_std_taux, nor_esm1m_me_mean_loc, nor_esm1m_me_std_loc, nor_esm1m_me_mean_sam, nor_esm1m_me_std_sam ] = CMIP5_surfacetrends('','', 30);


%% Load Reanalyses Trends

trend_period = 30;

[ taux_trend_30, taux_difference, lat_trend_30, lat_difference, sam_trend_30, sam_difference ] = NCEP1_trends(trend_period);
[ taux_trend_30_2, taux_difference_2, lat_trend_30_2, lat_difference_2, sam_trend_30_2, sam_difference_2 ] = NCEP2_trends(trend_period);


