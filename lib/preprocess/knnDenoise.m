function X = knnDenoise(X, k)
% denoise based on k nearest neighbors technique
%   replace each point x in X with the average of points in its neighborhood,
%   where neighborhood is the k nearest points to x

    [IDX, D] = knnsearch(X,X,'K',15);

    IDXCells = num2cell(IDX,2);
    
    %create grid of patches on K
    X = cell2mat(arrayfun(@(idxCell) getNeighborhoodMean(X,idxCell),IDXCells,'UniformOutput',false));
    



end