%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        LINEAR ACTUATORS DATA                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% linear actuator in revolute segment 1
cyl1.Da = 0.04*2;
cyl1.Aa = cyl1.Da*cyl1.Da*pi/4;
cyl1.Db = 0.0225*2;
cyl1.Ab = cyl1.Aa - cyl1.Db*cyl1.Db*pi/4;
cyl1.cl = 1e-16;
cyl1.sp = 0.59; 
cyl1.x0 = 0.83; 
cyl1.lc = 0.745; 
% linear actuator in revolute segment 2
cyl2.Da = 0.04*2;
cyl2.Aa = cyl2.Da*cyl2.Da*pi/4;
cyl2.Db = 0.0225*2;
cyl2.Ab = cyl2.Aa - cyl2.Db*cyl2.Db*pi/4;
cyl2.cl = 1e-16;
cyl2.sp = 0.59; 
cyl2.x0 = 0.83; 
cyl2.lc = 0.745; 
% linear actuator in prismatic segment 2
cylT2.Da = 0.025*2;
cylT2.Aa = cylT2.Da*cylT2.Da*pi/4;
cylT2.Db = 0.015*2;
cylT2.Ab = cylT2.Aa - cylT2.Db*cylT2.Db*pi/4;
cylT2.cl = 1e-16;
cylT2.sp = 1.1; 
cylT2.lc = 1.2;