function [rowidx, colidx]  = randPatchCenters(n, dim, sz)
% compute random matrix coordinates for 
%   param n number of indices to return
%   param dim the dimension of patch being sampled (9 or 81)
%   param sz = [rows, cols] dimensions of the matrix
    
    % ignore a 2 image border of outermost pixels
    %   Due to camera limitations, those pixels are filled in with an
    %   average value, so we ignore them, as recommended by the data source
    % based on patch dimensions, ignore an additional offset so no patches
    %   contain border pixels.
    %   for example if dim=9, ignore 1 additional pixel border. if dim=81,
    %   ignore a 4 additional pixel border
    offset = floor(sqrt(dim)/2);
    border_width = 2 + offset;
    
    % compute upper bound on range of random indices for rows and cols
    rowbound = sz(1) - (2 * border_width);
    colbound = sz(2) - (2 * border_width);

    % compute pixel indices of center of each random patch 
    %   adjust by adding border_width so lowest possible index is equal to
    %   1 + border_width, which is in the acceptable range
%     fprintf('rowbound: %d\n',rowbound)
%     fprintf('n: %d\n',n)
%     fprintf('border width: %d\n', border_width)
    rowidx = randperm(rowbound, n) + border_width;     % random unique row indices
    colidx = randperm(colbound, n) + border_width;     % random unique col indices
end

