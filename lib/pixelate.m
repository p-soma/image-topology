function pixelated = pixelate(patches, dim_init, dim_final)
% function to pixelate each patch in an array of patch vectors
%   param patches: array of patch vectors to be pixelated
%   param dim_init: initial dimension of patches = num cols in patches, 
%       must be a perfect square
%   param dim_final: dimension to pixelate patches down to. Must evenly
%       divide dim_init and be a perfect square
%   example: to pixelate from a 9x9 to 3x3 patch, we have dim_init = 81,
%       dim_final = 9. We take the mean of each disjoint 3x3 sub-patch in 
%       each 9x9 patch, creating a 3x3 patch which is the 'pixelated'
%       version of the 3x3
%   

    % check valid initial and final dimensions
    % dimensions must be such that a perfect tiling of squares of width and
    % height of sqrt(dim_final) can exist over patches
    
    if (mod(dim_init,dim_final) ~= 0);
        error("dim_final must perfectly divide dim_init");
    end

    n = size(patches,1);
    pixelated = zeros(n,dim_final);
    
    % indices of top left pixel in each sub-patch
    %   based on squareform of each patch in patches
    cornerIDX = 1:sqrt(dim_final):dim_final-sqrt(dim_final)+1;
    
    for p=1:n
        % for each original patch in matrix form
        patch_vec = reshape(patches(p,:),[dim_final, dim_final]);
        % initialize pixelated patch
        pixelatedPatch = zeros(dim_final,1);
        idx = 1;
        for i=cornerIDX
            % for each col which starts a sub-patch
            %   get the col indices for the sub-patch
            cols = i:i+sqrt(dim_final)-1;
            for j=cornerIDX
                % for each row which starts a sub-patch
                %   get the row indices for the sub-patch
                rows = j:j+sqrt(dim_final)-1;
                % extract sub-patch
                sub_patch = patch_vec(rows,cols,1);
                %   take the mean of the sub-patch
                pixelatedPatch(idx) = mean(sub_patch(:));
                idx = idx + 1;
            end
        end
        pixelated(p,:) = pixelatedPatch;
    end
end

