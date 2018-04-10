function x = getNeighborhoodMean(X,idxCell)
% get the mean location of the indices of X which are in idxCell
    IDX = cell2mat(idxCell);

    pts = X(IDX,:);
    
    x = mean(pts);

end