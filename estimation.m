%% Script for Lab Activity, Section 5.1
% Cory Cutsail, MATH426
%% 1) 
% Consider the function $f(x) = sin^2(2\pi x)$ on $x\in[0,1]$. Plot the
% function on this interval. 
clear all; close all;
f = @(x)(sin(2*pi*x)).^2;
x = linspace(0,1,101)';
plot(x,f(x))
title('Function Plot')
%% 2) 
% Use hatfun.m and plinterp.m to approximate $f(x)$ using $n = 11$ equally spaced nodes, and plot this on top of the given function.
t = linspace(0,1,12);
for n = 1:11;
    H = hatfun(x,t,n-1);
    hold on
    plot(x,H)
    title('Hat Function')
end

y = f(t);
p = @(x)plinterp(x,t,y);
figure
plot(x,p(x),'o-',x,f(x),'-') 


%% 3)
% Approximate the function using $n = [11, 21, 41, 81, 161, 321, 641, 1281]$ nodes
% and using a model sequence as in the example in class, or using ratios,
% show that convergence is $O(h^{-2})$ or $O(^{-2})$. The error from the
%  last problem persists 
figure1 = figure('Position', [100, 100, 1024, 1200]);
err_ = []
for k = 1:8;
    n(k) = 5*2^k+1;
    t = linspace(0,1,n(k));
    H = hatfun(x,t,n(k)-1);
    y = f(t);
    p = @(x)plinterp(x,t,y);
    subplot(3,3,k)
    plot(x,p(x),'ro',x,f(x),'-') 
    name = sprintf('Polynomial Interpolation with #(nodes) = %i',n(k));
    title(name)
    err = max(abs( f(x)-p(x))); 
    err_ = [err_;err];
    %plot(x,p(x),'ro',x,f(x),'-') 
end