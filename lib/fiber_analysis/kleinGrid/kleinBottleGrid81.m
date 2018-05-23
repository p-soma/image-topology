function K = kleinBottleGrid81(n)
% function to create a grid of evenly space points on the klein bottle 
%   param n int number of points on the circle S1 to generate
%       results in n^2 points on the klein bottle
%   return kleinGrid, the grid of points on the klein bottle
%   return distMat, the distance matrix between points

    % generate 30 uniformly distributed points on S1
    angles = linspace(0,2*pi - (2*pi/n),n);
    S1 = [cos(angles); sin(angles)]';
    %array of vectors for each choice of parameters a,b,c,d
    %abcd = [repmat(S1,n,1),repelem(S1,n,1)];
    abcd = 1:10;
    abcdCell = num2cell(abcd,1);
    
    %create grid of patches on K
    K = cell2mat(arrayfun(@(x) createPatchOnK81(x),abcdCell,'UniformOutput',false));
    
    %keep only unique points
    %K = uniquetol(K,0.000001,'ByRows',true);
end