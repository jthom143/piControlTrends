function [ jet_f, jet_xi, mean_jet, std_jet, jet_trends_yrs, jet_loc_f, jet_loc_xi, mean_jet_loc, std_jet_loc, jet_loc_trends_yrs, time_year, jet_ann, lat_jet_ann ] = CM21_taux

%CM21_taux loads in the windstress data for the CM2.1 model and calculates the westerly wind jet and location and then calcuates the trend pdfs for these two variables.

%% Import Data

% load /Users/jordanthomas/Desktop/Research/CM2.1/CM2.1_data/cm2.1.taux.slp.mat
load /home/jthom143/CM2.1/CM2.1_data/cm2.1.taux.slp.mat


% Not using slp

clear slp lon taux_ann

taux = tau_x;
time = time_month;

clear time_month tau_x

%% Jet Strength and Location Analysis

[ ~, ~, ~, jet_ann, lat_jet_ann ] = taux_findmax( taux, lat, time );                                              

%% Trend Analysis PDFs

trend_period = 30;
trend_length = 30;

[jet_f, jet_xi, mean_jet, std_jet, jet_trends_yrs, jet_loc_f, jet_loc_xi, mean_jet_loc, std_jet_loc, jet_loc_trends_yrs] = Windstress_Trends( time_year, jet_ann, lat_jet_ann, trend_period, trend_length );
     


end