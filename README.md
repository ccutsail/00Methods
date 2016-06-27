# 00Methods
All methods written by Cory Cutsail, 2016, except when noted.
All files are written to be used in Matlab.

KKTQuadPro solves a quadratic programming problem. Not as efficient as quadprog, uses the null space method

Caller isn't really a method - it just calls one of the built in ODE callers as specified. It also calls rk4, a fourth order Runge-Kutta 
  Method. rk4 is in the repository as well, but I did not write it.

Dogleg is a work in progress, and is a trust-region dogleg method for unconstrained optimization problems

findiff is a centered-difference (finite difference) derivative approximation method. 

rk4 is, as stated, a fourth-order Runge-Kutta method. I did not write this, but it is used in the caller function.
