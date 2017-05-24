%% ArduCopter Controller Parameters:
% The values below are based on Ardupilot's open-source, ArduCopter C++
% Software. For more information, reference the link below:
% https://github.com/ArduPilot/ardupilot/tree/master/ArduCopter

%% Controller Constants:
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

%% Controller Values:
% angle controller P objects
p_angle_yaw_kp = 0.01;