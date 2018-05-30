function [IDX, Xkp] = knnDensityFiltration(X, k, p)
% density estimation
%   param X a metric space
%   param k parameter for kth nearest neighbor
%   param p percentage of densest points to keep
    % WORK IN PROGRESS
    [IDX, D] = knnsearch(X,X,'K',k);
    
    % sort from most dense at index 1 (lowest dist to knn) to least dense
    %   (highest distance to knn)
    [D_sorted, IDX_sorted] = sort(D, 'ascend');
    
    % columns of distance to kth nearest neighbor, and indices
    dK = D_sorted(:,k);
    idxK = IDX_sorted(:,k);
    
    % get number of points to keep based on cut param p
    n = ceil(p * size(X,1));
    % indices for top p% of densest points
    idxKcut = idxK(1:n);
    
    Xkp = X(idxKcut,:);
   
end