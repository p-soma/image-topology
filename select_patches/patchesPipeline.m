function M_n = patchesPipeline(dim, imgPath, dataPath, dataFileName)
    % main pipeline for patch sampling
    %   param dim is dimension of patch vectors (must be square integer)
    %   param imgPath is the directory where the images are stored
    %   param dataPath is the directory to store the resulting set M_n
    %   param dataFileName is the file to store M_n
    %   returns M_n a set of high contrast sqrt(dim) by sqrt(dim) pixel
    %       patches
    
    n = 5000; 
    cut = 0.2; 
    %dim = 81;
    %imgPath = './van-hateren-images/';
    %dataPath = './patches/';
    
    % get high contrast n by n patches M_n
    M_n = createPatchSample(n, cut, dim, imgPath);

    % save to csv
    patches_f = fullfile(dataPath,dataFileName); 
    csvwrite(patches_f, M_n);

end