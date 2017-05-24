%% Arducopter Simulation
% The purpose of this package is to simulate a arducopter as close to
% reality as possible. Focussing mainly on the copter dynamics as well as
% the controllers.

clear
clc

dir = fileparts(mfilename('fullpath'));
modpath = [dir filesep 'Models'];
addpath(modpath);
% cd(modpath); % Optional

ArduCopter_3DR;

%% Initialize ArduCopter_3DR Simulink Model Parameters

% Initialize Quadcopter Plant Parameters
quadcopter_plant_initialization;

% Initialize ArduCopter Controller Parameters
arducopter_initialization;

%% Finalize Any Remaining Items

clc
disp 'Startup Complete. The ArduCopter Simulation is ready for use.'
