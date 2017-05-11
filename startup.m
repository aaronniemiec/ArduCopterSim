%% Arducopter Simulation
% The purpose of this package is to simulate a arducopter as close to
% reality as possible. Focussing mainly on the copter dynamics as well as
% the controllers.

clear
clc

% Note: make sure to run from ide else mfilename wil return ''
dir = fileparts(mfilename('fullpath'));
modpath = [dir filesep 'Models'];
addpath(modpath);
% cd(modpath); % Optional

ArduCopter_3DR;

%% Controller Parameters

dt = 0.01; % Intersampling period in seconds
use_ff = true;
smoothing_gain = 1;
AC_ATTITUDE_ACCEL_RP_CONTROLLER_MIN_RADDS = 40;
AC_ATTITUDE_ACCEL_RP_CONTROLLER_MAX_RADSS = 720;

AC_ATTITUDE_ACCEL_Y_CONTROLLER_MIN_RADSS = 10;
AC_ATTITUDE_ACCEL_Y_CONTROLLER_MAX_RADSS = 120;

% TODO don't forget to add conversions to rads
% Attitude accel roll/pitch max [Centi-Degrees/Sec/Sec]
% 0	Disabled
% 72000	Slow
% 108000	Medium
% 162000	Fast
ATC_ACCEL_P_MAX = 72000;
ATC_ACCEL_R_MAX = 72000;

% Attitude accell yaw max 
% 0	Disabled
% 18000	Slow
% 36000	Medium
% 54000	Fast
ATC_ACCEL_Y_MAX = 36000;

AC_P = 1;

% ATC controller params
ATC_ANG_RLL_P = 4.5000; % range: 3.000 - 12.000
ATC_ANG_PIT_P = 4.5000; % range: 3.000 - 12.000
ATC_ANG_YAW_P = 4.5000; % range: 3.000 - 6.000

% Set ff variant in simulink
USE_FF_VARIANT=Simulink.Variant('use_ff==1');
USE_DIRECT_VARIANT=Simulink.Variant('use_ff==0');

%% Controller values
% angle controller P objects
p_angle_yaw_kp = 0.01;

%% Initialize ArduCopter_3DR Simulink Model Parameters

% DC Motor Parameters
v_max = 1; % Motor Pod Voltage Maximum
v_min = 1; % Motor Pod Voltage Minimum

L = 1; % Motor Inductance
R = 1; % Motor Resistance

i_max = 1; % Motor Pod Current Maximum
i_min = 1; % Motor Pod Current Minimum

k_torque = 1; % Torque Constant

Jm = 1; % Motor Inertia

% Quadcopter Dynamics Parameters (Based on 3DR Solo Quadcopter)
gravity = 32.37; % (ft/sec^2)
quad_mass = 10; % Mass of Quadcopter

a_rotor = 1; % Rotor Area
p = 1; % Air Density
Ct = 1; % Function of Rotor Geometry and Profile
k_thrust = 1; % Thrust Constant (Function of Ct, p, and a_rotor)

k_drag = 1; % Drag Constant

dist_to_cg_x = 9; % (inches) Distance from propellor to cg
dist_to_cg_y = 9; % (inches) Distance from propellor to cg

Ixx = 1; % (kg-m^2)
Iyy = 1; % (kg-m^2)
Izz = 1; % (kg-m^2)

pitch_inertia_ratio = (Izz - Iyy)/Ixx;
roll_inertia_ratio = (Ixx - Izz)/Iyy;
yaw_inertia_ratio = (Iyy - Ixx)/Izz;

%% Finalize Any Remaining Items

clc
disp 'Startup Complete. The ArduCopter Simulation is ready for use.'
