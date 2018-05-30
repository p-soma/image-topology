function patches = getPatchVectors(buf, n, dim)
% function to get the random raw patch vectors from an image matrix
%   param buf: image as a matrix of pixel intensities
%   param n: number of patches to extract from the image
%   param dim: dimension of the vector to represent each patch
%   returns patches: an n by dim array of sqrt(dim) by sqrt(dim) patches as
%       dim-dimensional vectors

    patches = zeros(n, dim);    % array of patches to return
    sz = size(buf);
    [rowidx, colidx] = randPatchCenters(n, dim, sz); % random indicies
    offset = floor(sqrt(dim)/2);
   
    for i = 1:n
        row = rowidx(i);
        col = colidx(i);
        patch = buf(row-offset:row+offset, col-offset:col+offset);
        patches(i,:) = patch(:);
    end

end