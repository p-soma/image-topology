function dNorms = getPatchDNorms(patches, dim, n)
%   param patches: an array of patch vectors
%   param dim: dimension of the patches (num cols)
%   param n: number of patches (num rows)
%   returns dNorms: 1 by n vector of dNorms of each patch 

    D = dMatrix(dim);
    dNorms = zeros(n,1);
    
    for r=1:size(patches,1)
        dNorm = sqrt(patches(r,:) * D * patches(r,:)');
        dNorms(r,:) = dNorm;
    end
end

