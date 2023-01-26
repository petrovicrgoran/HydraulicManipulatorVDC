%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             VALVES DATA                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Valve 1 spool dynamics.
valve1.nf = 30*2*pi;
valve1.damp = 0.707;
valve1.riseSlewRate = 100;
valve1.fallSlewRate = -100;
valve1.uppLim = 1;
valve1.lowLim = -1;
% Valve 1 flow parameters.
valve1.QN = 100/1000/60;
valve1.dpN = 70e5;
valve1.cp1 = valve1.QN/sqrt(valve1.dpN);
valve1.cn1 = valve1.cp1;
valve1.cp2 = valve1.cp1;
valve1.cn2 = valve1.cp1;
% Valve 2 spool dynamics.
valve2.nf = 30*2*pi;
valve2.damp = 0.707;
valve2.riseSlewRate = 100;
valve2.fallSlewRate = -100;
valve2.uppLim = 1;
valve2.lowLim = -1;
% Valve 2 flow parameters.
valve2.QN = 100/1000/60;
valve2.dpN = 70e5;
valve2.cp1 = valve2.QN/sqrt(valve2.dpN);
valve2.cn1 = valve2.cp1;
valve2.cp2 = valve2.cp1;
valve2.cn2 = valve2.cp1;
% Valve T2 spool dynamics.
valveT2.nf = 30*2*pi;
valveT2.damp = 0.707;
valveT2.riseSlewRate = 100;
valveT2.fallSlewRate = -100;
valveT2.uppLim = 1;
valveT2.lowLim = -1;
% Valve T2 flow parameters.
valveT2.QN = 40/1000/60;
valveT2.dpN = 70e5;
valveT2.cp1 = valveT2.QN/sqrt(valveT2.dpN);
valveT2.cn1 = valveT2.cp1;
valveT2.cp2 = valveT2.cp1;
valveT2.cn2 = valveT2.cp1;