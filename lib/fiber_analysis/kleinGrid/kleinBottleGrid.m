function K = kleinBottleGrid(n)
% function to create a grid of evenly space points on the klein bottle 
%   param n int number of points on the circle S1 to generate
%       results in n^2 points on the klein bottle
%   return kleinGrid, the grid of points on the klein bottle
%   return distMat, the distance matrix between points

    % generate n uniformly distributed points on S1
    angles = linspace(0,2*pi - (2*pi/n),n);
    S1 = [cos(angles); sin(angles)]';
%    S1 = S1(1:n,:);
    
%     angles_ = angles + pi/n;
%     S1_ = [cos(angles_); sin(angles_)]';
%     S1_ = S1_(1:n,:);

    %array of vectors for each choice of parameters a,b,c,d
    abcd = [repmat(S1,n,1),repelem(S1,n,1)];
%     abcd_ = abcd .* [-1 -1 1 -1];

    abcdCell = num2cell(abcd,2);
    
    %create grid of patches on K
    K = cell2mat(arrayfun(@(x) createPatchOnK(x),abcdCell,'UniformOutput',false));
    
    %keep only unique points
    K = uniquetol(K,0.000001,'ByRows',true);
end