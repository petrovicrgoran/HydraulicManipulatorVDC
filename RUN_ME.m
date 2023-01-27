%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Supplementary material for the open-access publication:                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Goran R. Petrović and Jouni Mattila, Mathematical modelling and virtual %
% decomposition control of heavy-duty parallel–serial hydraulic manipula- %
% tors, Mechanism and Machine Theory, Volume 170, 2022, 104680, ISSN 0094-%
% 114X, https://doi.org/10.1016/j.mechmachtheory.2021.104680.             %
% (https://www.sciencedirect.com/science/article/pii/S0094114X21004092)   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dr Janne Koivumäki kindly donated the CAD files used. The simulation    %
% author highly appreciates this fact and feedback provision.             % 
% Check Dr Koivumäki's publications at:                                   %            
% https://scholar.google.com/citations?user=Llrx-nsAAAAJ                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The supplementary material creation process has been supported by prof. %
% Jouni Mattila and is acknowledged here.                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The simulation file author: Goran R. Petrović, (goran.petrovic@tuni.fi) %                       
% January 2023, Tampere University / Tampereen Yliopisto                  %                         
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
clc
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Demonstrated operating modes have following numeric identifiers:
% 0 - Cartesian position control,
% ANY VALUE - Joint-space control.
MODE = 0;
% Choose whether the friction force should be exerted to linear actuator
% pistons in simulation. (No reason not to.)
settings.actuatorFrictionON = 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Controller feedback gains and sample time.                              %           
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% controller sample time
controller.dT = 0.001;
% feedback gains in revolute segment 1 
controller.kx1 = 5e-3;
controller.kf1 = 2e-8;
% feedback gains in revolute segment 2 
controller.kx2 = 5e-3;
controller.kf2 = 2e-8;
% feedback gains in prismatic segment 2
controller.kxt2 = 1e-3;
controller.kft2 = 8e-9;
controller.kVgain = 5;
% lambda gains in joint-space control
controller.lamTh1 = 3;
controller.lamTh2 = 3;
controller.lamxT2 = 3;
% lambda gains in Cartesian control
controller.lamX = 6;
controller.lamY = 6;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Encoder and pressure measurements are filtered with 2nd-order low-pass  %
% filters. Their cut-off frequencies are defined here. The same happens   %
% for filters after numerical derivatives of required velocities and      %
% required piston forces. More details can be found from the              %
% 'init2ndOrderLowPassFilter.m' function.                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% adds simulated noise to encoder meaasurements
encoder.measNoisePower = 1e-11;
% adds simulated noise to pressure measurements
pres.measNoisePower = 5e5;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
filtEnc.cutOffFrequency = 24*2*pi;
filtPres.cutOffFrequency = 24*2*pi;
filtDV.cutOffFrequency = 8*2*pi;
filtDF.cutOffFrequency = 8*2*pi;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Uncertainty factors allow supplying non-ideal values of physical         
% quantities to the VDC controller. Setting them to 1, the controller  
% will ideally know all the parameters. More details can be found in  
% the supplied 'initializeParameterUpdate.m' file.                
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
update.inertiaUncertainty = 0.9;
update.cyl1Uncertainty = 0.95;
update.cyl2Uncertainty = 1.05;
update.cylT2Uncertainty = 1.1;
update.valve1Uncertainty = 0.97;
update.valve2Uncertainty = 1.05;
update.valveT2Uncertainty = 1;
update.frictionRS1Uncertainty = 0.9;
update.frictionRS2Uncertainty = 1.1;
update.frictionPS2Uncertainty = 0.9;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialize all the rest.
InitializeSimulationParameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           RUN SIMULATION                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Run the simulation.
sim('VDCHyd2022a.slx',[0 simulationEndTime])