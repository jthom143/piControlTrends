function [ sam_f, sam_xi, mean_sam, std_sam, time_year, SAM_unnormalized ] = CM2Mc
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%% Import Data
pathname_ps = '/Users/jordanthomas/Desktop/Research/CM2Mc/Analysis2/Data/cm2mc_ps.nc';

ps = ncread(pathname_ps, 'PS');                 % Pa
lat_atmos = ncread(pathname_ps, 'LAT');         % Degrees


clear pathname_ps


%% Change Units on Surface Pressure

slp_mon = ps./100;    %hPa
clear ps


%% Create Useful time vectors


time_year = 1:500;

clear time 


%% SAM Calculations

[ ~, SAM_mon_unnormalized] = SAM_calculate( lat_atmos, slp_mon);

% Annual Average SAM 

SAM_unnormalized = squeeze(nanmean(reshape(SAM_mon_unnormalized, 12, []),1));


%% Trend Analysis PDFs

trend_period = 30;
trend_length = 30;

[ sam_f, sam_xi, mean_sam, std_sam] = SAM_Trends( time_year, SAM_unnormalized, trend_period, trend_length );


end