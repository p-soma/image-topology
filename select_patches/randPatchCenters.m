function [rowidx colidx]  = randPatchCenters(n, dim, sz)
% compute random matrix coordinates for 
%   param n number of indices to return
%   param dim the dimension of patch being sampled (9 or 81)
%   param sz: dimensions of the array as [rows cols]
    
    % based on patch dimensions, ignore an offset so no patches contain
    % invalid indicies
    %   for example if dim=9, ignore 1 additional pixel border. if dim=81,
    %   ignore a 4 additional pixel border
    
    offset = floor(sqrt(dim)/2);
    
    % max_idx = total number of possible patch 'centers' to choose from
    %   (excluding the offset border)
    sz_ = sz - (2*offset);
    max_idx = sz_(1) * sz_(2);
    
    % get linear indicies
    lIDX = randperm(max_idx, n);
    % convert to [row, col] format
    [r, c] = ind2sub(sz_, lIDX);
    % add the offset to ignore first offset rows and cols
    rowidx = r + offset;
    colidx = c + offset;
    
end

