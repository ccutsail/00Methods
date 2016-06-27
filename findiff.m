function [ FD, err, FD2 ] = findiff(varargin)

% This function takes in up to three arguments. The first is always
% the function whose first derivative is being approximated,
% the second is either the interval of approximation or the exact
% value of the derivative. It requires an interval of approximation.
%   Input Variables:
%        f = function
%        exact = exact derivative of function
%        h = interval
%   Output
%        FD = centered difference approximation
%        err = absolute difference between approximation and exact value
%        FD2 = second derivative approximation


if length(varargin) > 2
varargin(1) = f; varargin(2) = exact; varargin(3) = h;

    for k = 1:length(h)
       h_ = h(k);
       FD(k) = (f(x0+h_) - f (x0-h_) ) / (2*h_);
       FD2(k) = (f(x0+h_) - 2*f(x0) + f (x0-h_) ) / (h_.^2);
       err(k) = abs( exact - FD(k) );
    end
else
    varargin(1) = f; varargin(2) = h;
    for k = 1:length(h)
       h_ = h(k);
       FD(k) = (f(x0+h_) - f (x0-h_) ) / (2*h_);
       FD2(k) = (f(x0+h_) - 2*f(x0) + f (x0-h_) ) / (h_.^2);
       err = [];
    end
end


