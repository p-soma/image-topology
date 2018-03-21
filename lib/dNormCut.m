function keepIDX = dNormCut(patches, dNorms, n, cut_p)
% function to get the patches with dNorm in the top cut_p% 
%   param patches: array of patch vectors
%   param dNorms: vector of dNorms of each patch
%   param n: total number of patches
%   param cut_p: percentage of patches to keep
%   return keepIDX: indices of patches to keep

    % number of patches to keep
    keepn = ceil(n * cut_p);        
    
    % sort dNorms, extract indices of patches to keep
    [dNormsSorted, sortedIDX] = sort(dNorms(:),'descend');
    keepIDX = sortedIDX(1:keepn);
    
    %keepPatches = patches(keepIDX,:);
    %keepDNorms = dNorms(keepIDX);
    
    
end

