%% Initilaizing
% clear variables;
% close all;
% clc;

% Time vectors
t = 0:0.1:2.6;
t_hist = -5:0.1:0;

% pose
y = zeros(18,1);
y_hist = zeros(18,51);

% MPC
xpred = zeros(6,27);
xtraj = zeros(6,27);
upred = zeros(4,26);
xobst = zeros(1, 9);

% figure
figure;
linewidth = 1;

%% Init ROS
% rosinit

pose_sub = rossubscriber('/qrotor2/pose_vel');
mpc_sub  = rossubscriber('/qrotor_gnd_control/mpc');

pose = receive(pose_sub, 1);
mpc  = receive(mpc_sub, 1);

%% Loop and plot data
while(1)
    % Receive new data
    pose = receive(pose_sub, 1);
    mpc  = receive(mpc_sub, 1);
    
    % Pose and Velocity
    y(1:3) = [pose.Position.X; pose.Position.Y; pose.Position.Z];
    y(4:6) = [pose.Velocity.X; pose.Velocity.Y; pose.Velocity.Z];
    y(7:15) = reshape(qGetR([pose.Orientation.W; pose.Orientation.X; ...
        pose.Orientation.Y; pose.Orientation.Z]),[9 1]);
    y_hist = [y_hist(:,2:end), y];
    
    % MPC
    xpred = reshape(mpc.Xpred,  [6, 27]);
    xtraj = reshape(mpc.Xtraj,  [6, 27]);
    upred = reshape(mpc.U,      [4, 26]);
    xobst = reshape(mpc.Xo,     [1,  9]);
    
    plot(t_hist, y_hist(1,:),'b','LineWidth',linewidth);
    hold on;
    plot(t_hist, y_hist(2,:),'r','LineWidth',linewidth);
    plot(t_hist, y_hist(3,:),'k','LineWidth',linewidth);
    
    plot(t, xpred(1,:),'--b','LineWidth',linewidth);
    plot(t, xpred(2,:),'--r','LineWidth',linewidth);
    plot(t, xpred(3,:),'--k','LineWidth',linewidth);
    
    plot(t, xtraj(1,:),':b','LineWidth',linewidth);
    plot(t, xtraj(2,:),':r','LineWidth',linewidth);
    plot(t, xtraj(3,:),':k','LineWidth',linewidth);
    legend(['x'; 'y'; 'z'], 'Location','southoutside','NumColumns',3);
    xlim([-5 2.5]);
    hold off
    
    pause(0.1);
end