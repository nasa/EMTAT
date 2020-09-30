function [y] = new_timeStep(x,n)
% newStep(x,n)
% x is minimum time step as required by solver stability requirement.
% n is the stop time of the simulation.
% returns y equal to some value less than x that is a factor of n. 

nCopy = n;
while nCopy > x  %Loop while the remainder of nCopy/x is nonzero
    nCopy = nCopy/2;
end

y = nCopy;
end


