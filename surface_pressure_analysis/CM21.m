function [ sam_f, sam_xi, mean_sam, std_sam, time_year, SAM_unnormalized, sam_trends_yrs ] = CM21
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%% Import Data

% load /Users/jordanthomas/Desktop/Research/CM2.1/CM2.1_data/cm2.1.taux.slp.mat
load /home/jthom143/CM2.1/CM2.1_data/cm2.1.taux.slp.mat
<<<<<<< HEAD:CM21.m
=======

clear pathname_ps
>>>>>>> 3eb96ba66819fb464c85b7de1e8722b61aeb4149:surface_pressure_analysis/CM21.m


% Not using wind stress

clear tau_x taux_ann time_month lon


%% SAM Calculations

[ ~, SAM_mon_unnormalized] = SAM_calculate( lat, slp);

% Annual Average SAM 

SAM_unnormalized = squeeze(nanmean(reshape(SAM_mon_unnormalized, 12, []),1));


%% Trend Analysis PDFs

trend_period = 30;
trend_length = 30;

[ sam_f, sam_xi, mean_sam, std_sam, sam_trends_yrs] = SAM_Trends( time_year, SAM_unnormalized, trend_period, trend_length );


end