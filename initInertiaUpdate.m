function [thetaXr, thetaXrLB, thetaXrUB] = initInertiaUpdate(m, r, I, UB, LB)

    % Form thetaAr vector per Eq. (A.43) - (A.55) from Zhu, W. H. (2010). 
    % Virtual decomposition control: toward hyper degrees of freedom robots
    % (Vol. 60). Springer Science & Business Media.
    rx = r(1); ry = r(2); rz = r(3);    
    Ixx = I(1,1); Iyy = I(2,2); Izz = I(3,3);
    Iyz = I(2,3); Ixz = I(1,3); Ixy = I(1,2);    
    t1 = rx*rx;
    t2 = ry*ry;
    t3 = rz*rz;
    t4 = rx*m;    
    thetaXr = [m; rx*m; ry*m; rz*m; t1*m; t2*m; t3*m;...
                 t4*ry - Ixy; t4*rz - Ixz; m*ry*rz - Iyz; Ixx; Iyy; Izz];
    % Establish lower and upper bound to be used in the parameter 
    % adapatation part as:
    % upperBound = nominal*UB
    % lowerBound = nominal*LB
    thetaXrUB = thetaXr.*UB;
    thetaXrLB = thetaXr.*LB;
    for i = 1:length(thetaXrUB)
        if thetaXrUB(i) < thetaXrLB(i)
            aux = thetaXrLB(i);
            thetaXrLB(i) = thetaXrUB(i);
            thetaXrUB(i) = aux;
        end
    end  

end