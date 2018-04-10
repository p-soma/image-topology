function Xsp = gaussianDensityFiltration(X, s, p)
% density estimation according to a gaussian distribution
%   param X data
%   param s is 2*sigma^2
%   param p a percentage of densest points to keep
%   return points the top p percentage of points with highest density

    distMat = dNormDist(X,X);
    density = mean(exp(-(distMat .^2)/s));
    
    [density_sorted, sorted_idx] = sort(density, 'descend');
    
    % get number of points to keep based on cut param p
    n = ceil(p * size(X,1));
    
    X_sorted = X(sorted_idx,:);
    
    Xsp = X_sorted(1:n,:);
    
end