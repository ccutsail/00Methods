function [ minimumval ] = dogleg(fun, g, B)
    delta = 1;
    % WORK IN PROGRESS
    % Dogleg method combines gradient descent direction (pu) and the
    % unconstrained step direction (pb). 
    % Input variables: fun = function to be minimized
    %                  g = function Jacobian (or approximation)
    %                  B = function Hessian (or approximation)
    % Output variables: Function minimum
    % Methodology; While the length of the Newton step is larger than the 
    % radius of the trust region, compute the dogleg step by taking the
    % linear combination of the steps pU (Newton) and pB (Cauchy) given by tau, which is
    % calculated as below. Recalculate the Jacobian and hessian
    % approximations each iteration, as well as the steps pU and pB, and
    % continue until the length if Newton step is smaller than the size of
    % the radius. This should give the optimum. Here initial delta is one,
    % and at each iteration it decreases statically by a measure of one
    % fourth.
    pb = -inv(B)*g;
    while norm(pb) > norm(delta)
        pb = -inv(B)*g;
        pu = (g'*g)/(g'*B*g)*g 
        tau = min((norm(g)^3)/(delta*g'*B*g),1);
        if norm(pb) < norm(delta);
            step = pb;
            delta = 1/4*(delta);
            mininumval = fun + step;
      
        end
        if norm(pb) >= norm(radius)
            step = pu + (tau-1)*(pb-pu)
            delta = 1/4*(delta);
            fun = fun+step;
            g = gradient(fun);
            B = hessian(fun);
        end
    
    
    minimumval
    end
    if norm(pb) <= norm(delta);
            step = pb;
            delta = 1/4*(delta);
            mininumval = fun + step;
    end
    if fun < minimumval;
        minimumval = fun;
    end