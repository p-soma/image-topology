function Xkp = knnDensityEstimationKDTree(X, k)
% density estimation
%   param X a metric space
%   param k parameter for kth nearest neighbor
%   param p percentage of densest points to keep
    % WORK IN PROGRESS
    [IDX, D] = knnsearch(X,X,'K',k,'NSMethod','kdtree');
    
    % sort from most dense at index 1 (lowest dist to knn) to least dense
    %   (highest distance to knn)
    [D_sorted, IDX_sorted] = sort(D, 'ascend');
    
    % indices
    idxK = IDX_sorted(:,k);
    
    Xkp = X(idxK,:);
   
end