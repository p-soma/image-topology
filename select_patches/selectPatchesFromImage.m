function A = selectPatchesFromImage(buf, n, dim, cut_p)
% function to select the top cut_p% of high-contrast 3x3 pixel patches from an image
%   param buf: matrix of greyscale pixel values for an image
%   param n: int number of patches to sample from the image
%   param dim: dimension of patch vectors to extract (must be square)
%   param cut_p: percentage of highest-contrast patches to keep
%   returns A: array of selected pixels (after some preproccessing)
% NOTE: must read in IML first

% get random indices for patch centers
sz = size(buf);
[rowidx, colidx] = randPatchCenters(n, dim, sz);

patches = getPatchVectors(buf, rowidx, colidx, n, dim);

% map 9x9 -> 3x3, essentially 'pixelating'
if dim == 81
    patches = pixelate(patches, n, 81, 9);
    dim = 9;
end

patches = logMeanAdjust(patches);
dNorms = getPatchDNorms(patches, dim, n);

[keepPatches keepDNorms] = dNormCut(patches, dNorms, n, cut_p);

% normalize by dividing each patch vector by its dNorm 
keepPatches = keepPatches ./ keepDNorms;

% perform a change of basis
A = changeCoordinates(keepPatches);


