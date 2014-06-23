function [ sam_f, sam_xi, mean_sam, std_sam, time_year, SAM_unnormalized ] = CNRM_CM5
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%% Import Data
current_path = pwd;
pathname_ps = fullfile(current_path,'piControlData/CNRM_CM5_ps.cdf');

ps = ncread(pathname_ps, 'ps');                 % Pa
time = ncread(pathname_ps, 'T');                % Months since 1800
lat_atmos = ncread(pathname_ps, 'lat');         % Degrees


clear pathname_ps

 %% Change Units on Surface Pressure

slp_mon = ps./100;    %hPa
clear ps

%% Create Useful time vectors


time_year = 1:850;

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