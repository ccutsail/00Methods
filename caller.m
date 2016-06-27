function [ERKout, RK4out, BDFout] = caller(varargin)


if (length(varargin)==5);
    ode = varargin{1}; trange = varargin{2}; 
    ic = varargin{3}; n = varargin{4}; tols = varargin{5};
    [c,d] = rk4(ode,trange,ic,n);
    RK4out = [c,d];
    figure;
    subplot(3,1,1)
    plot(c,d)
    title('RK4 Output for the FitzHugh-Nagumo Equations')
    options = odeset('RelTol',tols(1),'AbsTol',tols(2));
    [a,b] = ode45(ode,trange,ic,options);
    ERKout = [a,b];
    subplot(3,1,2);
    plot(a,b)
    title('ODE45 Output for the FitzHugh-Nagumo Equations, RelErr = , AbsErr = %d',tols(1))
    [e,f] = ode15s(ode,trange,ic,options);
    BDFout = [e,f];
    title('ODE15s Output for the FitzHugh-Nagumo Equations, RelErr = , AbsErr = %d',tols(1))
    subplot(3,1,3)
    plot(e,f)

    figure;
    subplot(3,1,1)
    plot(b(:,1),b(:,2))
    title(sprintf('ODE45 Limit Cycle for the FitzHugh-Nagumo Equations, Rel = %d, Abs = %d',tols(1), tols(2)))
    subplot(3,1,2)
    plot(f(:,1),f(:,2))
    title('ODE15s Limit Cycle for the FitzHugh-Nagumo Equations')
    subplot(3,1,3)
    plot(d(:,1),d(:,2))
    title('RK4 Limit Cycle for the FitzHugh-Nagumo Equations')

    
elseif (length(varargin)==4)&(size(varargin{4})==1);
    ode = varargin{1}; trange = varargin{2}; 
    ic = varargin{3}; n = varargin{4};
    figure;
    subplot(3,1,1)
    [a,b] = ode45(ode,trange,ic);
    ERKout = [a,b];
    plot(a,b)
    title('ODE45 Output for the FitzHugh-Nagumo Equations')
    [c,d] = rk4(ode,trange,ic,n);
    RK4out = [c,d];
    subplot(3,1,2)
    plot(c,d)
    title('RK4 Output for the FitzHugh-Nagumo Equations')
    [e,f] = ode15s(ode,trange,ic);
    BDFout = [e,f];
    subplot(3,1,3)
    plot(e,f)
    title('ODE15s Output for the FitzHugh-Nagumo Equations')
    
    figure;
    subplot(3,1,1)
    plot(b(:,1),b(:,2))
    title('ODE45 Limit Cycle for the FitzHugh-Nagumo Equations')
    subplot(3,1,2)
    plot(f(:,1),f(:,2))
    title('ODE15s Limit Cycle for the FitzHugh-Nagumo Equations')
    subplot(3,1,3)
    plot(d(:,1),d(:,2))
    title('RK4 Limit Cycle for the FitzHugh-Nagumo Equations')
    
    
elseif (length(varargin)==4);
    ode = varargin{1}; trange = varargin{2}; 
    ic = varargin{3}; tols = varargin{4};
    options = odeset('RelTol',tols(1),'AbsTol',tols(2));
    [a,b] = ode45(ode,trange,ic,options);
    ERKout = [a,b];
    figure(1);
    subplot(4,1,1)
    plot(a,b)
    title(sprintf('ODE45 Output for the FitzHugh-Nagumo Equations, Rel = %d, Abs = %d',tols(1), tols(2)))
    [e,f] = ode15s(ode,trange,ic,options);
    BDFout = [e,f];
    subplot(4,1,2)
    plot(e,f)
    title(sprintf('ODE15s Output for the FitzHugh-Nagumo Equations, Rel = %d, Abs = %d',tols(1), tols(2)))
    RK4out = NaN;
    subplot(4,1,3)
    plot(b(:,1),b(:,2))
    title(sprintf('ODE45 Limit Cycle for the FitzHugh-Nagumo Equations, Rel = %d, Abs = %d',tols(1), tols(2)))
    subplot(4,1,4)
    plot(f(:,1),f(:,2))
    title(sprintf('ODE15s Limit Cycle for the FitzHugh-Nagumo Equations, Rel = %d, Abs = %d',tols(1), tols(2)))
elseif length(varargin)==3;
    ode = varargin{1}; trange = varargin{2}; 
    ic = varargin{3};
    [a,b] = ode45(ode,trange,ic);
    figure;
    subplot(2,1,1)
    plot(a,b)
    title('ODE45 Output for the FitzHugh-Nagumo Equations')
    ERKout = [a,b];
    [c,d] = ode15s(ode,trange,ic);
    BDFout  = [c,d];
    subplot(2,1,2)
    plot(c,d)
    title('ODE15s Output for the FitzHugh-Nagumo Equations')
    RK4out = NaN;
    sprintf('RK4 requires a vector of grid spacings as input')
    figure;
    subplot(2,1,1)
    plot(b(:,1),b(:,2))
    title('ODE45 Limit Cycle for the FitzHugh-Nagumo Equations')
    subplot(2,1,2)
    plot(f(:,1),f(:,2))
    title('ODE15s Limit Cycle for the FitzHugh-Nagumo Equations')
    
    
    
    
    
    
elseif length(varargin) < 3;
    ERKout = NaN; RK4out = NaN; BDFout = NaN;
    sprintf('Error: Not enough input variables.')




else
    sprintf('Error: Too many input variables.')
end