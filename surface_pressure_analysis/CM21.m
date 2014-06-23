function [ sam_f, sam_xi, mean_sam, std_sam, time_year, SAM_unnormalized ] = CM21
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%% Import Data

% load /Users/jordanthomas/Desktop/Research/CM2.1/CM2.1_data/cm2.1.taux.slp.mat
load /home/jthom143/CM2.1/CM2.1_data/cm2.1.taux.slp.mat

clear pathname_ps


% Not using wind stress

clear tau_x taux_ann time_month lon


%% SAM Calculations

[ ~, SAM_mon_unnormalized] = SAM_calculate( lat, slp);

% Annual Average SAM 

SAM_unnormalized = squeeze(nanmean(reshape(SAM_mon_unnormalized, 12, []),1));


%% Trend Analysis PDFs

trend_period = 30;
trend_length = 30;

[ sam_f, sam_xi, mean_sam, std_sam] = SAM_Trends( time_year, SAM_unnormalized, trend_period, trend_length );


end