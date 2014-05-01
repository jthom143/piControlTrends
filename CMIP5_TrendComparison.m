%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script to compare surface field variability across multiple models
% Jordan Thomas 
% April 21, 2014
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Matlab Housekeeping

close all
clear all



%% Load Data

[ access0_SAM_unnormalized, access0_jet_ann, access0_lat_jet_ann, access0_taux_f, access0_taux_xi, access0_loc_f, access0_loc_xi, access0_sam_f, access0_sam_xi, access0_mean_taux, access0_std_taux, access0_mean_loc, access0_std_loc, access0_mean_sam, access0_std_sam ] = CMIP5_surfacetrends('http://strega.ldeo.columbia.edu:81/CMIP5/.byScenario/.piControl/.atmos/.mon/.ps/.ACCESS1-0/.r1i1p1/.ps/lat/%2890S%29%280N%29RANGEEDGES/dods', 30);
[ access3_SAM_unnormalized,  access3_jet_ann, access3_lat_jet_ann,  access3_taux_f, access3_taux_xi, access3_loc_f, access3_loc_xi, access3_sam_f, access3_sam_xi, access3_mean_taux, access3_std_taux, access3_mean_loc, access3_std_loc, access3_mean_sam, access3_std_sam ] = CMIP5_surfacetrends('http://strega.ldeo.columbia.edu:81/CMIP5/.byScenario/.piControl/.atmos/.mon/.ps/.ACCESS1-3/.r1i1p1/.ps/dods', 30);
[ bcc_SAM_unnormalized, bcc_jet_ann, bcc_lat_jet_ann, bcc_taux_f, bcc_taux_xi, bcc_loc_f, bcc_loc_xi, bcc_sam_f, bcc_sam_xi, bcc_mean_taux, bcc_std_taux, bcc_mean_loc, bcc_std_loc, bcc_mean_sam, bcc_std_sam ] = CMIP5_surfacetrends('http://strega.ldeo.columbia.edu:81/CMIP5/.byScenario/.piControl/.atmos/.mon/.ps/.bcc-csm1-1-m/.r1i1p1/.ps/dods', 30);


%% Load Reanalyses Trends

trend_period = 30;

[ taux_trend_30, taux_difference, lat_trend_30, lat_difference, sam_trend_30, sam_difference ] = NCEP1_trends(trend_period);
[ taux_trend_30_2, taux_difference_2, lat_trend_30_2, lat_difference_2, sam_trend_30_2, sam_difference_2 ] = NCEP2_trends(trend_period);


