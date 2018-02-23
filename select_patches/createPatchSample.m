function [P_9, P_81, M_9] = createPatchSample(n, m, cut, k, dim, imgPath)
% function to create our main space M, a sample of n patches
%   param n: the number of patches per image
%   param m: the number of images to use
%   param cut_p: percentage of most dense patches to keep
%   param k: density estimator
%   param dim: 9 or 81


    % total count of image files to choose from
    NUM_IMAGES = 4212;
    LOCAL_IMAGES = 9;
    
    % number of patches we will end up with
    total_patches = n * m * cut;
    patches_per_image = n * cut;
    
    % select random image numbers
    %imgs = randperm(NUM_IMAGES, m)
    imgs = randperm(LOCAL_IMAGES, m);
    
    idx_start = 1;
    idx_end = patches_per_image;
    
    P_9 = zeros(total_patches,sqrt(dim));
    P_81 = zeros(total_patches, dim);
    
    M_9 = zeros(total_patches,sqrt(dim)-1);
    
    for i=imgs
        filename = sprintf('imk%05d.iml',i);
        filepath = fullfile(imgPath,filename);
        buf = readIML(filepath);
        
        % select patches from the image and add to 
        [newPatches_9, newPatches_81] = selectPatchesFromImage(buf, n, dim, cut);
        
        P_9(idx_start:idx_end,:) = newPatches_9(1:patches_per_image,:);
        P_81(idx_start:idx_end,:) = newPatches_81(1:patches_per_image,:);
        
        % perform a change of basis
        A = changeCoordinates(newPatches_9);
        M_9(idx_start:idx_end,:) = A(1:patches_per_image,:);
        
        % increment indices
        idx_start = idx_start + patches_per_image;
        idx_end = idx_end + patches_per_image;
    end

end