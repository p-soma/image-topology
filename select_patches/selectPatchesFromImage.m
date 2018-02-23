function [newPatches_9, newPatches_81] = selectPatchesFromImage(buf, n, dim, cut_p)
% function to select the top cut_p% of high-contrast 3x3 pixel patches from an image
%   param buf: matrix of greyscale pixel values for an image
%   param n: int number of patches to sample from the image
%   param dim: dimension of patch vectors to extract (must be square)
%   param cut_p: percentage of highest-contrast patches to keep
%   returns [P_9 , P_81]: [3by3 patches, corresponding 9by9 patches]
%
% NOTE: must read in IML first

    % get random indices for patch centers
    sz = size(buf);
    
    [rowidx, colidx] = randPatchCenters(n, dim, sz);

    patches = getPatchVectors(buf, rowidx, colidx, n, dim);
    
    % map 9x9 -> 3x3, essentially 'pixelating'

    newPatches_81 = patches;
    newPatches_9 = pixelate(patches, n, 81, 9);
    dim = 9;


    newPatches_9 = logMeanAdjust(newPatches_9);
    dNorms9 = getPatchDNorms(newPatches_9, dim, n);
    keepIDX = dNormCut(newPatches_9, dNorms9, n, cut_p);
    
  
    newPatches_9 = newPatches_9(keepIDX,:);
    dNorms9 = dNorms9(keepIDX,:);
    
    % normalize by dividing each patch vector by its dNorm 
    newPatches_9 = newPatches_9 ./ dNorms9;
    
    
    newPatches_81 = logMeanAdjust(newPatches_81);
    dNorms81 = getPatchDNorms(newPatches_81, 81, n);
    newPatches_81 = newPatches_81(keepIDX,:);
    dNorms81 = dNorms81(keepIDX,:);
    newPatches_81 = newPatches_81 ./ dNorms81;
    
end


