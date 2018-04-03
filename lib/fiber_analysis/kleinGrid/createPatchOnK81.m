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
    
    X = linspace(-1,1,9);
    Y = linspace(-1,1,9);
    
    patch = zeros(9,9);

    i = 1;
    j = 1;
    for x=X
        for y=Y
            patch(i,j) = c*(a*x + b*y)^2 + d*(a*x + b*y);
            j = j + 1;
        end
        i = i + 1;
        j = 1;
    end

    
    % subtract mean
    patch = patch - mean(patch);
    % normalize by D-norm
    n = getPatchDNorms(patch);
    patch = patch / n;
end