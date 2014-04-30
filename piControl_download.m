%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script to download CMIP5 piControl Data from Lamont website
% Data availability courtesy of Karen Smith and Lorenzo Polvani 
%
% Jordan Thomas (jthom143@jhu.edu)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Surface Pressure

% Access 0

pathname = 'http://strega.ldeo.columbia.edu:81/CMIP5/.byScenario/.piControl/.atmos/.mon/.ps/.ACCESS1-0/.r1i1p1/.ps/lat/%2890S%29%280N%29RANGEEDGES/dods';

ps_access0 = ncread(pathname, 'ps');

clear pathname

% Access 3 

pathname = 'http://strega.ldeo.columbia.edu:81/CMIP5/.byScenario/.piControl/.atmos/.mon/.ps/.ACCESS1-3/.r1i1p1/.ps/dods';

ps_access3 = ncread(pathname, 'ps');

clear pathname

% BCC CSM1-1-m

pathname = 'http://strega.ldeo.columbia.edu:81/CMIP5/.byScenario/.piControl/.atmos/.mon/.ps/.bcc-csm1-1-m/.r1i1p1/.ps/dods';

ps_bcc = ncread(pathname, 'ps');

clear pathname