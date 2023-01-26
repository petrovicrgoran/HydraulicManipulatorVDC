function filt = init2ndOrderLowPassFilter(cof, damp, dT)
    
    % complex variable s
    s = tf('s');
    % cut-off frequency of the filter [rad/s]
    filt.cof = cof;
    % filter damping ratio
    filt.damp = damp;
    % filter sampling time
    filt.dT = dT;
    % discretize the filter transfer function and extract the coefficients
    Wf = 1/((s/filt.cof)^2 + 2*filt.damp/filt.cof*s + 1);
    [numfd,denfd] = tfdata(c2d(Wf, filt.dT, 'tustin'), 'v');
    denfd = denfd/denfd(1);
    numfd = numfd/denfd(1);
    filt.a1 = denfd(2);
    filt.a0 = denfd(3);
    filt.b2 = numfd(1);
    filt.b1 = numfd(2);
    filt.b0 = numfd(3);

end