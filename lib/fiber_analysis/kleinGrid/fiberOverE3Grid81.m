function patches = fiberOverE3Grid81(n)
% function to create a grid of evenly space points on the klein bottle 
%   param n int number of points on the circle S1 to generate
%       results in n^2 points on the klein bottle
%   return kleinGrid, the grid of points on the klein bottle
%   return distMat, the distance matrix between points

    % generate 30 uniformly distributed points on S1
    angles = linspace(0,2*pi,n);
    S1 = [cos(angles); sin(angles)]';

    abCell = num2cell(S1,2);

    % create grid of patches on K
    patches = cell2mat(arrayfun(@(x) createPatchOnK81(x),abCell,'UniformOutput',false));
    
    % keep only unique points
    patches = uniquetol(patches,0.000001,'ByRows',true);
end