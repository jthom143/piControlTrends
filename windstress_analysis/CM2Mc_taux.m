function [ jet_f, jet_xi, mean_jet, std_jet, jet_trends_yrs, jet_loc_f, jet_loc_xi, mean_jet_loc, std_jet_loc, jet_loc_trends_yrs, time_year, jet_ann, lat_jet_ann ] = CM2Mc_taux

%CM2Mc_taux loads in the windstress data for the CM2Mc model and calculates the westerly wind jet and location and then calcuates the trend pdfs for these two variables.

%% Import Data
% pathname_ps = '/Users/jordanthomas/Desktop/Research/CM2Mc/Analysis2/Data/cm2mc_ps.nc';
pathname_taux = '/home/jthom143/CM2Mc/Analysis2/Data/cm2mc_taux.nc';

taux = ncread(pathname_taux, 'TAU_X');                 % Pa
lat = ncread(pathname_taux, 'YU_OCEAN');         % Degrees
time = ncread(pathname_taux, 'TIME1');
lon = ncread(pathname_taux, 'XU_OCEAN');


clear pathname_taux

%% Create Useful time vectors

time_year = 1:500;

%% Jet Strength and Location Analysis

[ ~, ~, ~, jet_ann, lat_jet_ann ] = taux_findmax( taux, lat, time );                                              

%% Trend Analysis PDFs

trend_period = 30;
trend_length = 30;

[jet_f, jet_xi, mean_jet, std_jet, jet_trends_yrs, jet_loc_f, jet_loc_xi, mean_jet_loc, std_jet_loc, jet_loc_trends_yrs] = Windstress_Trends( time_year, jet_ann, lat_jet_ann, trend_period, trend_length );

end
