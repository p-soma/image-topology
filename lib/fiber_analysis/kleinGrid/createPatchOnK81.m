function patch = createPatchOnK81(cell) 
% function to generate a patch on the klein bottle K in space of 9x9
% patches
%   composition of two functions, g and q, where
%       g : S1 x S1 -> K is given by (a,b,c,d) -> c(ax + by)^2 + d(ax + by)
%       q : P -> S7 is given by the composite of evaluating a
%       polynomial on the grid of 81 points, H, subtracting the mean, and
%       normalizing by D-norm
    
    params = cell2mat(cell);
    
    a = params(1);
    b = params(2);
    c = params(3);
    d = params(4);
    % evaluate polynomial on H
    
    x = linspace(-1,1,9);
    y = linspace(-1,1,9);
    
    [X,Y] = meshgrid(x,y);

    patch = c*(a*X + b*Y).^2 + d*(a*X + b*Y);
    
    patch = reshape(patch,1,81);

    % subtract mean
    patch = patch - mean(patch);
    % normalize by D-norm
    % n = getPatchDNorms(patch);
    n = norm(patch);
    patch = patch / n;
end