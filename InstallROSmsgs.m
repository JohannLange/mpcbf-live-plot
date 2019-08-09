%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% You must install the                                      %
% Robotics System Toolbox Interface for ROS Custom Messages %
% add-on using roboticsAddons to use this function.         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Path to the msgs, either your catkin_ws, the msg-folder in this working-
% directory, or any other ordinary path on your system
msgFolder = ['C:\MATLAB\ROS\msg'];

% ATTENTION!
% Pay attention to the output and edit the javaclasspath.txt
rosgenmsg(msgFolder)

% Auto-add the path to your MATLAB-installation
addpath([msgFolder filesep 'matlab_gen' filesep 'msggen']);
savepath;

%%%%%%%%%%%%%%%%%%
% Restart MATLAB %
%%%%%%%%%%%%%%%%%%