%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            PARAMETERS UPDATE                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% In parameter adaptation, the user provided ('nominal') values are being % 
% adapted such that they remain in bounds also prescribed by the user.    %
% Thus all the vectors below can be freely chosen, and how good this      %
% choice is will affect the control system performance.                   %
% Bounds, as for example, nominal*0.7 and nominal*1.3 used for inertia    % 
% parameters here can be set differently, thus the presented below is not % 
% a major rule how the parameters adaptation should be set up, but just   %
% one way do it.                                                          % 
% Still, it is always up to the user to provide nominal values and        %
% adaptation bounds.                                                      %
% Since it very likely that the user will provide data that does not      %
% ideally correspond to values in the physical system considered,         % 
% uncertainty coefficients have been introduced to allow simulating       %
% occurences like these, where the provided values are not ideal.         %
% This 'uncertainty coefficient' thus only serves the purpose of testing  %
% in simulation what happens when the provided data below is not ideal.   %
% Setting its value to 1, will initialize all the parameters to their     % 
% 'true' values in the considered manipulator.                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   PARAMETER ADAPTATION ACTIVE?                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Choose whether to update parameters, 0 - NO, 1 - YES.
update.active = 1;
% Reseting is probably better to test using inside-the-simulation commands.
update.reset = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   UPDATING INERTIA PARAMETERS                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Update gains.
update.rho = 10;    
update.rhoBc1 = update.rho*[1 1 1 1 1 1 1 1 1 1 1 1 1];
update.rhoB11 = update.rho*[1 1 1 1 1 1 1 1 1 1 1 1 1];
update.rhoB31 = update.rho*[1 1 1 1 1 1 1 1 1 1 1 1 1];
update.rhoB41 = update.rho*[1 1 1 1 1 1 1 1 1 1 1 1 1];
update.rhoBc2 = update.rho*[1 1 1 1 1 1 1 1 1 1 1 1 1];
update.rhoB12 = update.rho*[1 1 1 1 1 1 1 1 1 1 1 1 1];
update.rhoB32 = update.rho*[1 1 1 1 1 1 1 1 1 1 1 1 1];
update.rhoB42 = update.rho*[1 1 1 1 1 1 1 1 1 1 1 1 1];
update.rhoP22 = update.rho*[1 1 1 1 1 1 1 1 1 1 1 1 1];
update.rhoB52 = update.rho*[1 1 1 1 1 1 1 1 1 1 1 1 1];
update.rhoP32 = update.rho*[1 1 1 1 1 1 1 1 1 1 1 1 1];
% Nominal thetaBc1r vector and its upper and lower adaptation bounds.
update.Bc1LowerBound = 0.7;
update.Bc1UpperBound = 1.3;  
[update.thetaBc1rNominal, update.thetaBc1rLowerBound, update.thetaBc1rUpperBound] = ...
initInertiaUpdate(inertiaProp.mBc1, inertiaProp.Bc1_r_Bc1C, inertiaProp.Bc1cI,...
                                     update.Bc1LowerBound, update.Bc1UpperBound);
update.thetaBc1rNominal = update.thetaBc1rNominal*update.inertiaUncertainty;
% Nominal thetaB11r vector and its upper and lower adaptation bounds.
update.B11LowerBound = 0.7;
update.B11UpperBound = 1.3;
[update.thetaB11rNominal, update.thetaB11rLowerBound, update.thetaB11rUpperBound] = ...
initInertiaUpdate(inertiaProp.mB11, inertiaProp.B11_r_B11C, inertiaProp.B11cI,...
                                     update.B11LowerBound, update.B11UpperBound);
update.thetaB11rNominal = update.thetaB11rNominal*update.inertiaUncertainty;
% Nominal thetaB31r vector and its upper and lower adaptation bounds.
update.B31LowerBound = 0.7;
update.B31UpperBound = 1.3;
[update.thetaB31rNominal, update.thetaB31rLowerBound, update.thetaB31rUpperBound] = ...
initInertiaUpdate(inertiaProp.mB31, inertiaProp.B31_r_B31C, inertiaProp.B31cI,...
                                     update.B31LowerBound, update.B31UpperBound);
update.thetaB31rNominal = update.thetaB31rNominal*update.inertiaUncertainty;
% Nominal thetaB41r vector and its upper and lower adaptation bounds.
update.B41LowerBound = 0.7;
update.B41UpperBound = 1.3;
[update.thetaB41rNominal, update.thetaB41rLowerBound, update.thetaB41rUpperBound] = ...
initInertiaUpdate(inertiaProp.mB41, inertiaProp.B41_r_B41C, inertiaProp.B41cI,...
                                     update.B41LowerBound, update.B41UpperBound);
update.thetaB41rNominal = update.thetaB41rNominal*update.inertiaUncertainty;
% Nominal thetaBc2r vector and its upper and lower adaptation bounds.
update.Bc2LowerBound = 0.7;
update.Bc2UpperBound = 1.3;
[update.thetaBc2rNominal, update.thetaBc2rLowerBound, update.thetaBc2rUpperBound] = ...
initInertiaUpdate(inertiaProp.mBc2, inertiaProp.Bc2_r_Bc2C, inertiaProp.Bc2cI,...
                                     update.Bc2LowerBound, update.Bc2UpperBound);
update.thetaBc2rNominal = update.thetaBc2rNominal*update.inertiaUncertainty;
% Nominal thetaB12r vector and its upper and lower adaptation bounds.
update.B12LowerBound = 0.7;
update.B12UpperBound = 1.3;
[update.thetaB12rNominal, update.thetaB12rLowerBound, update.thetaB12rUpperBound] = ...
initInertiaUpdate(inertiaProp.mB12, inertiaProp.B12_r_B12C, inertiaProp.B12cI,...
                                     update.B12LowerBound, update.B12UpperBound);
update.thetaB12rNominal = update.thetaB12rNominal*update.inertiaUncertainty;
% Nominal thetaB32r vector and its upper and lower adaptation bounds.
update.B32LowerBound = 0.7;
update.B32UpperBound = 1.3;
[update.thetaB32rNominal, update.thetaB32rLowerBound, update.thetaB32rUpperBound] = ...
initInertiaUpdate(inertiaProp.mB32, inertiaProp.B32_r_B32C, inertiaProp.B32cI,...
                                     update.B32LowerBound, update.B32UpperBound);
update.thetaB32rNominal = update.thetaB32rNominal*update.inertiaUncertainty;
% Nominal thetaB42r vector and its upper and lower adaptation bounds.
update.B42LowerBound = 0.7;
update.B42UpperBound = 1.3;
[update.thetaB42rNominal, update.thetaB42rLowerBound, update.thetaB42rUpperBound] = ...
initInertiaUpdate(inertiaProp.mB42, inertiaProp.B42_r_B42C, inertiaProp.B42cI,...
                                     update.B42LowerBound, update.B42UpperBound);   
update.thetaB42rNominal = update.thetaB42rNominal*update.inertiaUncertainty;
% Nominal thetaP22r vector and its upper and lower adaptation bounds.
update.P22LowerBound = 0.7;
update.P22UpperBound = 1.3;
[update.thetaP22rNominal, update.thetaP22rLowerBound, update.thetaP22rUpperBound] = ...
initInertiaUpdate(inertiaProp.mP22, inertiaProp.P22_r_P22C, inertiaProp.P22cI,...
                                     update.P22LowerBound, update.P22UpperBound);
update.thetaP22rNominal = update.thetaP22rNominal*update.inertiaUncertainty;
% Nominal thetaB52r vector and its upper and lower adaptation bounds.
update.B52LowerBound = 0.7;
update.B52UpperBound = 1.3;
[update.thetaB52rNominal, update.thetaB52rLowerBound, update.thetaB52rUpperBound] = ...
initInertiaUpdate(inertiaProp.mB52, inertiaProp.B52_r_B52C, inertiaProp.B52cI,...
                                     update.B52LowerBound, update.B52UpperBound); 
update.thetaB52rNominal = update.thetaB52rNominal*update.inertiaUncertainty;
% Nominal thetaP32r vector and its upper and lower adaptation bounds.
update.P32LowerBound = 0.7;
update.P32UpperBound = 1.3;
[update.thetaP32rNominal, update.thetaP32rLowerBound, update.thetaP32rUpperBound] = ...
initInertiaUpdate(inertiaProp.mP32, inertiaProp.P32_r_P32C, inertiaProp.P32cI,...
                                     update.P32LowerBound, update.P32UpperBound);
update.thetaP32rNominal = update.thetaP32rNominal*update.inertiaUncertainty;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      UPDATING PARAMETERS OF HYDRAULIC CYLINDERS AND OIL BULK MODULUS    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Update gains.
update.rhod1 = 1e-17*[1 1 1 1];
update.rhod2 = 1e-17*[1 1 1 1];
update.rhodT2 = 1e-17*[1 1 1 1];
% Nominal thetad1 vector and its upper and lower adaptation bounds.
% (linear actuator in revolute segment 1)
update.thetad1Nominal = [1/oil.B; cyl1.Aa; cyl1.Ab; cyl1.cl]*...
                                                    update.cyl1Uncertainty;
update.thetad1UpperBound = [1.5/oil.B; cyl1.Aa; cyl1.Ab; cyl1.cl*100];
update.thetad1LowerBound = [0.5/oil.B; cyl1.Aa; cyl1.Ab; cyl1.cl/100];
% Nominal thetad2 vector and its upper and lower adaptation bounds.
% (linear actuator in revolute segment 2)
update.thetad2Nominal = [1/oil.B; cyl2.Aa; cyl2.Ab; cyl2.cl]*...
                                                    update.cyl2Uncertainty;
update.thetad2UpperBound = [1.5/oil.B; cyl2.Aa; cyl2.Ab; cyl2.cl*100];
update.thetad2LowerBound = [0.5/oil.B; cyl2.Aa; cyl2.Ab; cyl2.cl/100];
% Nominal thetadT2 vector and its upper and lower adaptation bounds.
% (linear actuator in prismatic segment 2)
update.thetadT2Nominal = [1/oil.B; cylT2.Aa; cylT2.Ab; cylT2.cl]*...
                                                   update.cylT2Uncertainty;
update.thetadT2UpperBound = [1.5/oil.B; cylT2.Aa; cylT2.Ab; cylT2.cl*100];
update.thetadT2LowerBound = [0.5/oil.B; cylT2.Aa; cylT2.Ab; cylT2.cl/100];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     UPDATING VALVE FLOW COEFFICIENTS                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Update gains.
update.rhov1 = 1e-17*[1 1 1 1];
update.rhov2 = 1e-17*[1 1 1 1];
update.rhovT2 = 1e-17*[1 1 1 1];
% Nominal thetav1 vector and its upper and lower adaptation bounds.
% (valve for linear actuator in revolute segment 1)
update.thetav1Nominal = [valve1.cp1 valve1.cn1 valve1.cp2 valve1.cn2]*...
                                                  update.valve1Uncertainty;
update.thetav1LowerBound = update.thetav1Nominal*0.7071;
update.thetav1UpperBound = update.thetav1Nominal*1.4142;
% Nominal thetav2 vector and its upper and lower adaptation bounds.
% (valve for linear actuator in revolute segment 2)
update.thetav2Nominal = [valve2.cp1 valve2.cn1 valve2.cp2 valve2.cn2]*...
                                                  update.valve2Uncertainty;
update.thetav2LowerBound = update.thetav2Nominal*0.7071;
update.thetav2UpperBound = update.thetav2Nominal*1.4142;
% Nominal thetavT2 vector and its upper and lower adaptation bounds.
% (valve for linear actuator in prismatic segment 2)
update.thetavT2Nominal = [valveT2.cp1 valveT2.cn1 valveT2.cp2 valveT2.cn2]*...
                                                 update.valveT2Uncertainty;
update.thetavT2LowerBound = update.thetavT2Nominal*0.7071;
update.thetavT2UpperBound = update.thetavT2Nominal*1.4142;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             UPDATING FRICTION COMPENSATION COEFFICIENTS                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Update gains.
update.rhof1 = [100000; 100000; 100000; 100000; 100000; 100000; 100000];
update.rhof2 = [100000; 100000; 100000; 100000; 100000; 100000; 100000];
update.rhofT2 = [100000; 100000; 100000; 100000; 100000; 100000; 100000];
% Nominal thetaf1 vector and its upper and lower adaptation bounds.
update.thetaf1Nominal = [frictionRS1.FCp; frictionRS1.FCn; frictionRS1.k0;...
         frictionRS1.bp; frictionRS1.bn; frictionRS1.FSp; frictionRS1.FSn]*...
         update.frictionRS1Uncertainty;
update.thetaf1LowerBound = [0; 0; -2000; 0; 0; 0; 0];
update.thetaf1UpperBound = [6000; 6000; 1000; 6000; 6000; 1000; 1000];
% Nominal thetaf2 vector and its upper and lower adaptation bounds.
update.thetaf2Nominal = [frictionRS2.FCp; frictionRS2.FCn; frictionRS2.k0;...
         frictionRS2.bp; frictionRS2.bn; frictionRS2.FSp; frictionRS2.FSn]*...
         update.frictionRS2Uncertainty;
update.thetaf2LowerBound = [0; 0; -2000; 0; 0; 0; 0];
update.thetaf2UpperBound = [6000; 6000; 1000; 6000; 6000; 1000; 1000];
% Nominal thetafT2 vector and its upper and lower adaptation bounds.
update.thetafT2Nominal = [frictionPS2.FCp; frictionPS2.FCn; frictionPS2.k0;...
         frictionPS2.bp; frictionPS2.bn; frictionPS2.FSp; frictionPS2.FSn]*...
         update.frictionPS2Uncertainty;
update.thetafT2LowerBound = [0; 0; -2000; 0; 0; 0; 0];
update.thetafT2UpperBound = [6000; 6000; 1000; 6000; 6000; 1000; 1000];