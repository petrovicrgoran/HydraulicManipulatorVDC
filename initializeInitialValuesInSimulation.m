%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         INITIAL MANIPULATOR CONFIGURATION AND PRESSURE VALUES           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initial joint variables
initVals.theta10 = 45*pi/180;
initVals.theta20 = -90*pi/180;
initVals.xt20 = 0.5;
% initial pressures
initVals.pa10 = 130e5;
initVals.pb10 = 30.9148e5;
initVals.pa20 = 90e5;
initVals.pb20 = 35.7169e5;
initVals.pat20 = pres.supply/2;
initVals.pbt20 = pres.supply/2;