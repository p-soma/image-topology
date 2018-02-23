function patches = getPatchVectors(buf, rowidx, colidx, n, dim)
% function to get the raw patch vectors from an image array
%   param rowidx: the row indices to sample
%   param colidx: the column indices to sample
%   param dim: dimension of the vector to represent each patch
%   returns patches: an n by dim array of patch vectors
    patches = zeros(n, dim);
    
    offset = floor(sqrt(dim)/2);
    
    for i = 1:n;
        row = rowidx(i);
        col = colidx(i);
        patch = buf(row-offset:row+offset, col-offset:col+offset);
        patches(i,:) = patch(:);
    end

end