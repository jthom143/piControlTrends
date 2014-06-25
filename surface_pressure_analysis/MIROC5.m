<<<<<<< HEAD:CCSM4.m
function [ sam_f, sam_xi, mean_sam, std_sam, time_year, SAM_unnormalized, sam_trends_yrs ] = CCSM4
=======
function [ sam_f, sam_xi, mean_sam, std_sam, time_year, SAM_unnormalized ] = MIROC5
>>>>>>> 3eb96ba66819fb464c85b7de1e8722b61aeb4149:surface_pressure_analysis/MIROC5.m
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%% Import Data

current_path = pwd;
<<<<<<< HEAD:CCSM4.m
pathname_ps = fullfile(current_path,'piControlData/CCSM4_ps.cdf');
=======
pathname_ps = fullfile(current_path,'piControlData/MIROC5/MIROC5_ps.cdf');
>>>>>>> 3eb96ba66819fb464c85b7de1e8722b61aeb4149:surface_pressure_analysis/MIROC5.m

ps = ncread(pathname_ps, 'ps');                 % Pa
time = ncread(pathname_ps, 'T');                % Months since 1800
lat_atmos = ncread(pathname_ps, 'lat');         % Degrees


clear pathname_ps


%% Change Units on Surface Pressure

slp_mon = ps./100;    %hPa
clear ps


%% Create Useful time vectors

time_year = 1:501;

clear time 


%% SAM Calculations

[ ~, SAM_mon_unnormalized] = SAM_calculate( lat_atmos, slp_mon);

% Annual Average SAM 

SAM_unnormalized = squeeze(nanmean(reshape(SAM_mon_unnormalized, 12, []),1));


%% Trend Analysis PDFs

trend_period = 30;
trend_length = 30;

[ sam_f, sam_xi, mean_sam, std_sam,sam_trends_yrs] = SAM_Trends( time_year, SAM_unnormalized, trend_period, trend_length );


end