%% Arducopter Simulation
% The purpose of this package is to simulate a arducopter as close to
% reality as possible. Focussing mainly on the copter dynamics as well as
% the controllers.

clear
clc

dir = pwd;
addpath([dir '/Models'])
cd([dir '/Models'])

ArduCopter_3DR;

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

% Quadcopter Dynamics Parameters
a_rotor = 1; % Rotor Area
p = 1; % Air Density
Ct = 1; % Function of Rotor Geometry and Profile
k_thrust = 1; % Thrust Constant (Function of Ct, p, and a_rotor)

k_drag = 1; % Drag Constant

%% Finalize Any Remaining Items

clc
disp 'Startup Complete. The ArduCopter Simulation is ready for use.'
