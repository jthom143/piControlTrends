function [ SAM_unnormalized, jet_ann, lat_jet_ann, taux_f, taux_xi, loc_f, loc_xi, sam_f, sam_xi, mean_taux, std_taux, mean_loc, std_loc, mean_sam, std_sam ] = CMIP5_surfacetrends(pathname_ps,pathname_taux, trend_period)
% CM2Mc_surfacetrends.m loads CCSM windstress and sea level pressure data
%      and calculates the surface trends to be compared to other models

%% Load in Data

%sshfrommatlab_publickey('jthom143','blaustein.eps.jhu.edu','~/.ssh/authorized_keys', 'Harry Potter is my favorite book!')

%pathname_ps = 'jthom143@blaustein.eps.jhu.edu:/data1/fesd1/jthom143/piControlData/CMIP5/CMCC_CESM_ps.cdf';
%pathname_taux = 'jthom143@blaustein.eps.jhu.edu:/data1/fesd1/jthom143/piControlData/CMIP5/CMCC_CESM_taux.cdf';

pathname_ps = '/data1/fesd1/jthom143/piControlData/CMIP5/CMCC_CESM_ps.cdf';
pathname_ps = '/data1/fesd1/jthom143/piControlData/CMIP5/CMCC_CESM_taux.cdf';


ps = ncread(pathname_ps, 'ps');    %Pa
taux_mon = ncread(pathname_taux, 'tauuo');
time = ncread(pathname_ps, 'T');
lat_atmos = ncread(pathname_ps, 'lat');
lat_ocean = ncread(pathname_taux, 'lat');

clear pathname

%% Change Units on Surface Pressure

slp_mon = ps./100;    %hPa

clear ps

%% Create Useful time vectors

num_years = length(time)/12;
time_month = time;

clear time 


%% Wind Stress Calculations 

[~, ~, ~, jet_ann, lat_jet_ann] = taux_findmax(taux_mon, lat_ocean, time_month);

%% SAM Calculations

[ ~, SAM_mon_unnormalized] = SAM_calculate( lat_atmos, slp_mon);

% Annual Average SAM 

SAM_unnormalized = squeeze(nanmean(reshape(SAM_mon_unnormalized, 12, []),1));


%% Trend Analysis PDFs

[ taux_f, taux_xi, loc_f, loc_xi, sam_f, sam_xi, mean_taux, std_taux, mean_loc, std_loc, mean_sam, std_sam] = NCAR_Trends( time_year, jet_ann, lat_jet_ann, SAM_unnormalized, trend_period );


end

