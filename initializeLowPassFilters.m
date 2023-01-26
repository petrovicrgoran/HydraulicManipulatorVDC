%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                          LOW-PASS FILTERS                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
filtEnc = init2ndOrderLowPassFilter(filtEnc.cutOffFrequency,1,controller.dT);
filtDV = init2ndOrderLowPassFilter(filtDV.cutOffFrequency,1,controller.dT);
filtPres = init2ndOrderLowPassFilter(filtPres.cutOffFrequency,1,controller.dT);
filtDF = init2ndOrderLowPassFilter(filtDF.cutOffFrequency,1,controller.dT);