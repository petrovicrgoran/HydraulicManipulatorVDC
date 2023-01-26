%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     FRICTION CURVE PARAMETERS                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The friction curves are parametrized as proposed in:
% Zhu, Wen-Hong, and Jean-Claude Piedboeuf. "Adaptive output force tracking
% control of hydraulic cylinders with applications to robot manipulators." 
% (2005): 206-217.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           LINEAR ACTUATOR FRICTION IN THE REVOLUTE SEGMENT 1            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
frictionRS1.zss = 0.0005;
frictionRS1.delta1 = 30000;
frictionRS1.phiv = 10;
frictionRS1.deltap = 1;
frictionRS1.deltan = 1;
frictionRS1.FCp = 4000; 
frictionRS1.FCn = 4000; 
frictionRS1.k0 = 0; 
frictionRS1.bp = 3000; 
frictionRS1.bn = 3000; 
frictionRS1.FSp = 0; 
frictionRS1.FSn = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           LINEAR ACTUATOR FRICTION IN THE REVOLUTE SEGMENT 2            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
frictionRS2.zss = 0.0005;
frictionRS2.delta1 = 30000;
frictionRS2.phiv = 10;
frictionRS2.deltap = 1;
frictionRS2.deltan = 1;
frictionRS2.FCp = 4000; 
frictionRS2.FCn = 4000; 
frictionRS2.k0 = 0; 
frictionRS2.bp = 3000; 
frictionRS2.bn = 3000; 
frictionRS2.FSp = 0; 
frictionRS2.FSn = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           LINEAR ACTUATOR FRICTION IN THE PRISMATIC SEGMENT 2           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
frictionPS2.zss = 0.0005;
frictionPS2.delta1 = 30000;
frictionPS2.phiv = 10;
frictionPS2.deltap = 1;
frictionPS2.deltan = 1;
frictionPS2.FCp = 4000; 
frictionPS2.FCn = 4000; 
frictionPS2.k0 = 0; 
frictionPS2.bp = 3000; 
frictionPS2.bn = 3000; 
frictionPS2.FSp = 0; 
frictionPS2.FSn = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%