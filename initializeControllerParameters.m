%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         CONTROLLER PARAMETERS                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Feedback matrices Kx which have to be positive-definite. One possible
% solution is provided here, but is far from the only possible.
controller.KBc1 = controller.kVgain*eye(6);
controller.KB11 = controller.kVgain*eye(6);
controller.KB31 = controller.kVgain*eye(6);
controller.KB41 = controller.kVgain*eye(6);
controller.KBc2 = controller.kVgain*eye(6);
controller.KB12 = controller.kVgain*eye(6);
controller.KB32 = controller.kVgain*eye(6);
controller.KB42 = controller.kVgain*eye(6);
controller.KP22 = controller.kVgain*eye(6);
controller.KB52 = controller.kVgain*eye(6);
controller.KP32 = controller.kVgain*eye(6);
% Valve control voltage limits.
controller.u1UppLim = 1;
controller.u1LowLim = -1;
controller.u2UppLim = 1;
controller.u2LowLim = -1;
controller.ut2UppLim = 1;
controller.ut2LowLim = -1;


