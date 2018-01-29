# Methods
KKTQuadPro solves a quadratic programming problem. Not as efficient as quadprog, uses the null space method

Caller isn't really a method - it just calls one of the built in ODE callers as specified. It also calls rk4, a fourth order Runge-Kutta 
  Method. rk4 is in the repository as well

Dogleg is a work in progress, and is a trust-region dogleg method for unconstrained optimization problems

findiff is a centered-difference (finite difference) derivative approximation method. 

rk4 is, as stated, a fourth-order Runge-Kutta method
