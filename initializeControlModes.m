%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             CONTROL MODES                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Examples provided here have the purpose of illustrating how Cartesian and
% joint references can are formed in VDC. These implemenent core ideas as 
% presented in Section (3.3.6) of Zhu, Wen-Hong. Virtual decomposition 
% control: toward hyper degrees of freedom robots. Vol. 60. Springer 
% Science & Business Media, 2010. using specific examples (diamond path
% and sine wave command for joint velocities).
%  
% NB! The contents of simulation subsystems providing Cartesian and 
% joint-space references can be entirely changed per user's wishes,
% but taking care that Eq. (3.20) and Eq. (3.21)-(3.22) hold.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MODE 0 = Cartesian control (Eq. (3.21) - (3.22))                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% In the present demonstration the TCP is asked to follow a diamond path
% defined below. Starting from the initial positon 0 the diamond path is
% point-to-point A-B-C-D-A path and the last step is returning to 0.
%                          B^
%                         A/ \C
%                         /\ /
%                        0  .D
% Get the initial TCP position (0).
r0 = WrWD22(initVals.theta10, initVals.theta20, initVals.xt20); 
x0 = r0(1); y0 = r0(2); z0 = r0(3); 
% Define waypoints (0-A-B-C-D-A-0) and form 5th order point-to-point path.
pathPlanner.waypoints = [x0 2.5 3.0 3.5 3.0 2.5  x0;...
                         y0 1.0 1.5 1.0 0.5 1.0  y0;...
                         z0  z0  z0  z0  z0  z0  z0];
clear r0 x0 y0 z0
% NB! A flexible path planner can be implemented inside the simulation 
% instead of using the beforehand generated path below, but this is not the
% main topic and solutions are infinite. For the illustration purposes here
% a quintic polynomial path is generated beforehand.

% The amount of seconds required from point-to-point.
pathPlanner.pointToPointTime = 5;
% End the simulation after returning to the starting point.
simulationEndTime = pathPlanner.pointToPointTime*(length(pathPlanner.waypoints(1,:))-1);
% Time points at which a particular path point should be reached.
pathPlanner.timePoints = 0:pathPlanner.pointToPointTime:simulationEndTime;
% Time vector as independent variable for the desired path.
pathPlanner.timeVector = 0:controller.dT:simulationEndTime;
% Use off-the-shelf MATLAB function here for path generation.
[pathPlanner.posDesCart, pathPlanner.velDesCart, ~, ~] = ...
    quinticpolytraj(pathPlanner.waypoints, pathPlanner.timePoints, pathPlanner.timeVector);
% Create point cloud for path illustration inside the Mechanics explorer.
% Adding 1e-7*rand(...) is to avoid having the same points twice, which is
% seen as error in the block providing visualization.
% NB! Values 1e-7, 500 and 1000 are heuristically hardcoded. These affect 
% only thevisualization and can be freely changed.
pointCloudMatrix0 = pathPlanner.posDesCart(:,1:500/(controller.dT*1000):simulationEndTime/controller.dT)' + ...
    1e-7*rand(size(pathPlanner.posDesCart(:,1:500/(controller.dT*1000):simulationEndTime/controller.dT)'));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MODE 1 = joint-space control (Eq. (3.20))                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% For all the three joints, sine-wave references are generated for the
% illustration purposes. This part can also be subject to any desired
% change if validity of Eq. (3.20) is preserved and if the care is taken
% that the desired velocity is differentiable.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Th1 = Th1B + Th1A*sin(Th1f*t) [rad]
pathPlanner.theta1A = 10*pi/180;
pathPlanner.theta1B = 0;
pathPlanner.theta1f = 0.15*2*pi;
% Th2 = Th2B + Th2A*sin(Th2f*t) [rad]
pathPlanner.theta2A = 15*pi/180;
pathPlanner.theta2B = 0;
pathPlanner.theta2f = 0.25*2*pi;
% xt2 = xt2B + xt2A*sin(xt2f*t) [m]
pathPlanner.xt2A = 0.1;
pathPlanner.xt2B = 0;
pathPlanner.xt2f = 0.20*2*pi;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculations below only served the purpose of generating a point cloud
% used for the illustration purposes in Mechanics explorer. The anticipated
% TCP positions in the Cartesian workspace are calculated and displayed.
pathPlanner.theta1Des = zeros(length(pathPlanner.timeVector),1);
pathPlanner.theta1Des(1,1) = initVals.theta10;
for i = 2:length(pathPlanner.timeVector)
    pathPlanner.theta1Des(i,1) = pathPlanner.theta1Des(i-1,1) + (pathPlanner.theta1B + ...
        pathPlanner.theta1A*sin(pathPlanner.theta1f*pathPlanner.timeVector(i)))*controller.dT;
end
pathPlanner.theta2Des = zeros(length(pathPlanner.timeVector),1);
pathPlanner.theta2Des(1,1) = initVals.theta20;
for i = 2:length(pathPlanner.timeVector)
    pathPlanner.theta2Des(i,1) = pathPlanner.theta2Des(i-1,1) + (pathPlanner.theta2B + ...
        pathPlanner.theta2A*sin(pathPlanner.theta2f*pathPlanner.timeVector(i)))*controller.dT;
end
pathPlanner.xt2Des = zeros(length(pathPlanner.timeVector),1);
pathPlanner.xt2Des(1,1) = initVals.xt20;
for i = 2:length(pathPlanner.timeVector)
    pathPlanner.xt2Des(i,1) = pathPlanner.xt2Des(i-1,1) + (pathPlanner.xt2B + ...
        pathPlanner.xt2A*sin(pathPlanner.xt2f*pathPlanner.timeVector(i)))*controller.dT;
end
pathPlanner.posDesJoint = WrWD22(pathPlanner.theta1Des,pathPlanner.theta2Des,pathPlanner.xt2Des)';
% Create point cloud for path illustration inside the Mechanics explorer.
pointCloudMatrix1 = pathPlanner.posDesJoint(:,1:100/(controller.dT*1000):end)' + ...
    1e-7*rand(size(pathPlanner.posDesJoint(:,1:100/(controller.dT*1000):end)'));
% Illustrate only relevant for the chosen operating mode.
if MODE == 0
    pointCloudMatrix = pointCloudMatrix0;
else 
    pointCloudMatrix = pointCloudMatrix1;
end
clear i pointCloudMatrix0 pointCloudMatrix1