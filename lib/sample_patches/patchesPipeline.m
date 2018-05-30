function [rawPatches, logPatches, patches] = patchesPipeline(dim, imgPath, outPath)
    % main pipeline for patch sampling
    %   param dim is dimension of patch vectors (must be square integer)
    %   param imgPath is the directory where the images are stored
    %   param dataPath is the full path to the file to store the patches
    %   returns M_n a set of high contrast sqrt(dim) by sqrt(dim) pixel
    %       patches as dim-dimensional vectors
    
    % number of patches to sample per image
    n = 5000;   
    % percentage of sampled patches to keep. Top cut % of patches with 
    %   highest D norms are kept for each image
    cut = 0.2;  
    
    % get high contrast n by n patches M_n
    % rawPatches: raw pixel patches without any preprocessing
    % logPatches: logarithm of raw pixel intensities
    % patches: preprocessed patches. Log intensity values, mean subtract,
    %   normalized by D norm
    [rawPatches, patches] = createPatchSample(n, cut, dim, imgPath);
    logPatches = log(rawPatches + 1);
    
    % pixelated patches, directly from raw intensity values
    rawPatchesPixelate = pixelate(rawPatches, 81, 9);
    
    % pixelated patches, using log intensity values
    logPatchesPixelate = pixelate(logPatches, 81, 9);
    
    % pixelated patches, but from fully preprocessed patches
    patchesPixelate = pixelate(patches, 81, 9);
    
    % filenames
    rawPatchesFile = strcat(outPath, '_raw');
    logPatchesFile = strcat(outPath, '_log');
    patchesFile = strcat(outPath, '_log_meansub_dNormalize');
    
    logPatchesPixelateFile = strcat(outpat, 'log_pixelated');
    rawPatchesPixelateFile = strcat(outPath, '_raw_pixelated');
    patchesPixelateFile = strcat(outPath, '_log_meansub_dNormalize_pixelated');

    % save patches
    dlmwrite(rawPatchesFile, rawPatches, 'delimiter', ',', 'precision', 10);
    dlmwrite(logPatchesFile, logPatches, 'delimiter', ',', 'precision', 10);
    dlmwrite(patchesFile, patches, 'delimiter', ',', 'precision', 10);
    dlmwrite(rawPatchesPixelateFile, rawPatchesPixelate, 'delimiter', ',', 'precision', 10);
    dlmwrite(logPatchesPixelateFile, logPatchesPixelate, 'delimiter', ',', 'precision', 10);
    dlmwrite(patchesPixelateFile, patchesPixelate, 'delimiter', ',', 'precision', 10);

end