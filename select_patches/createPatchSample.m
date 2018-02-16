function patches = createPatchSample(n, m, cut_p, k, dim)
% function to create our main space M, a sample of n patches
%   param n: the number of patches per image
%   param m: the number of images to use
%   param cut_p: percentage of most dense patches to keep
%   param k: density estimator
%   param dim: 9 or 81
    NUM_IMAGES = 4212;

    % total number of patches in our sample
    total_patches = n * m * cut_p;
    patches_per_image = (n * cut_p) / m;
    
    patches = zeros(total_patches,dim-1);
    
    % select random images
    %imgs = randperm(NUM_IMAGES, m); 
    imgs = 2;
    idx = 1;
    for i=imgs
        filename = sprintf('imk%05d.iml',1)
        buf = readIML(filename);
        newPatches = selectPatchesFromImage(buf, n, dim, cut_p);
        patches(idx:patches_per_image,:) = newPatches;
        idx = idx + patches_per_image;
    end

