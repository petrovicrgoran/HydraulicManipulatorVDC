%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                          INITIALIZE ALL                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialize all the neccessary simulation data.
initializeValvesData
initializeLinearActuatorsData
initializeFrictionData
initializeHosingData
initializeConstantGeometricData
initializeConstantPositionVectors
initializeConstantRotationMatrices
initializeInertiaProperties
initializeAuxiliaryQuantities
pres.supply = 190e5;
pres.return = 10e5;
oil.B = 800e6;
initializeInitialValuesInSimulation
initializeControllerParameters
initializeControlModes
initializeLowPassFilters
initializeParameterUpdate
revJoint1.damp = 0.1;
revJoint2.damp = 0.1;
gravity.Wg = [0; 9.8066; 0];
D22F = [0;0;0;0;0;0];
D22Fr = [0;0;0;0;0;0];
Bc1_V = [0;0;0;0;0;0];
Bc1_Vr = [0;0;0;0;0;0];