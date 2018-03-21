function fiber = extractFiber(baseSpace, totalSpace, p, patch, path)
% function to extract a fiber in MN over a patch in Mn
%   param baseSpace patch space with dimension n^2
%   param totalSpace patch space with dimension N^2 where N = n^2
%   param p percent of nearest neighbors to extract around patch in M_n
%   param patch the patch vector over which the fiber is extracted
%   param path to save the fiber

    % compute number of nearest neighbors k based on cut param p %
    nPoints = size(baseSpace,1);
    k = round( nPoints * p );
    
    % find k (p percent) of nearest neighbors to patch in baseSpace
    [Idx,D] = knnsearch(baseSpace, patch, 'K', k);
    
    fiber = totalSpace(Idx,:);

    csvwrite(path,fiber);
end