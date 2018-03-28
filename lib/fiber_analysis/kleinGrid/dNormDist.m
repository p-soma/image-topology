function distMat = dNormDist(X,Y)
% function for computing the D-norm distance between each pair of
%   observations in X and Y
%   param X, a matrix of row vectors representing patches
%   param Y, a matrix of row vectors representing patches
%   returns distMat
    dim = size(X,2);
    D = dMatrix(dim);
    distMat = acos(X * D * Y');
    % perform a change of basis
    distMat = real(distMat);                   % keep real part only
    if X == Y
        distMat = distMat - diag(diag(distMat));    % make diagonal zeros
    end
    
end

