function Xkp = knnDensityFiltration(X, k, p)
% density estimation
%   param X a metric space
%   param k parameter for kth nearest neighbor
%   param p percentage of densest points to keep
    % WORK IN PROGRESS
    [IDX, D] = knnsearch(X,X,'K',k);
    
    % sort from most dense at index 1 (lowest dist to knn) to least dense
    %   (highest distance to knn)
    [D_sorted, sorted_idx] = sort(D, 'ascend');
    
    % get number of points to keep based on cut param p
    n = ceil(p * size(X,1));
    
    X_sorted = X(sorted_idx,:);
    
    Xkp = X_sorted(1:n,:);
    
end