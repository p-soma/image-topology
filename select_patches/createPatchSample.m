function patches = createPatchSample(n, cut, dim, imgPath)
% function to create our main space M9, of high contrast images
%   param n: the number of patches per image
%   param cut_p: percentage of most dense patches to keep
%   param dim: 9 or 81

    % images = array of image file names
    filestr = ls(imgPath);
    images = strsplit(filestr);
    images = images(1:end-1);
    
    % number of patches we will end up with
    total_patches = n * length(images) * cut;
    patches_per_image = n * cut;
    
    idx_start = 1;
    idx_end = patches_per_image;
    
    % for storing the patches we select from each image
    patches = zeros(total_patches, dim);
    
    for image=images
        
        filepath = fullfile(imgPath,image);
        buf = readIML(string(filepath));
        
        % remove a 2-pixel border around the image due to camera
        % limitations
        buf = buf(3:end-2,3:end-2);
        
        % select n random 9x9 patches from the image as 81-D vectors
        patchSamp = getPatchVectors(buf, n, dim);
        
        % put on -1 to 1
        
        % take the log of each pixel
        patchSamp = log(1 + patchSamp);
        
        % subtract the mean
        patchSamp = patchSamp - repmat(mean(patchSamp,2),1,size(patchSamp,2));
        
        % compute d norms
        dNorms = getPatchDNorms(patchSamp, dim, n);
        
        % keep patches with top cut_p % of d norms
        keepIDX = dNormCut(patchSamp, dNorms, n, cut);
        keepPatches = patchSamp(keepIDX,:);
        
        % normalize by dividing each patch vector by its dNorm 
        dNorms = dNorms(keepIDX,:);
        keepPatches = keepPatches ./ dNorms; 
        
        patches(idx_start:idx_end,:) = keepPatches(1:patches_per_image,:);
        
%         % perform a change of basis
%         A = changeCoordinates(keepPatches);
%         M_9(idx_start:idx_end,:) = A(1:patches_per_image,:);
        
        % increment indices
        idx_start = idx_start + patches_per_image;
        idx_end = idx_end + patches_per_image;
    end

end