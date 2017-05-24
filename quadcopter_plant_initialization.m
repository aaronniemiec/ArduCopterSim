%% Quadcopter Plant Variables
% These variables are based on the 3DR Solo Quadcopter and are an initial 
% estimate of motor and quadcopter variables based on the following data:
% Flight time: 25 minutes; 20 minutes with payload*
% Motors: 880 kV
% Propellers: 10" diameter 4.5" pitch self-tightening (24 cm diameter 144 cm pitch) **
% Weight: 3.3 lbs. (1.5 kg) / 3.9 lbs. (1.8 kg) with GoPro® and Solo Gimbal
% Dimensions: 10 in. tall (25 cm), 18 in. (46 cm) motor-to-motor
% Flight battery: Lithium polymer 5200 mAh 14.8 Vdc
% Controller battery: 2600 mAh 7.2 Vdc rechargeable lithium ion
% 
% * Found several cases where owners reported 15 min of flight in a hover at 3.9lbs, seems the 20 min might be achieved at a flight speed of 6m/s
% ** Speeds for these propellers seem to typically be in the 2000 to 8000 rpm range

%% DC Motor Parameters
v_max = 14.8; % (Vdc) - Motor Pod Voltage Maximum
v_min = 00.0; % (Vdc) - Motor Pod Voltage Minimum

L = 0.0047; % (H) - Motor Inductance
R = 0.93; % (Ohms) - Motor Resistance

i_max = inf; % (A) - Motor Pod Current Maximum
i_min = 0.00; % (A) - Motor Pod Current Minimum

k_torque = 0.1; % (in-lb/A) - Torque Constant

Jm = 5E-4; % (TBD) - Motor Inertia

%% Quadcopter Dynamics Parameters
gravity = 32.17; % (ft/sec^2)
quad_mass = 3.9; % (lbs) - Mass of Quadcopter

k_thrust = 3.6E-6; % (TBD) - Thrust Constant

k_drag = 1.9E-6; % (TBD) - Drag Constant

dist_to_cg_x = 9; % (inches) Distance from propellor to cg
dist_to_cg_y = 9; % (inches) Distance from propellor to cg

Ixx = 0.038; % (kg-m^2) - Moment of Inertia, X-Axis
Iyy = 0.038; % (kg-m^2) - Moment of Inertia, Y-Axis
Izz = 0.076; % (kg-m^2) - Moment of Inertia, Z-Axis

roll_inertia_ratio = (Ixx - Izz)/Iyy;
pitch_inertia_ratio = (Izz - Iyy)/Ixx;
yaw_inertia_ratio = (Iyy - Ixx)/Izz;