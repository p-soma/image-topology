% main pipeline for patch sampling
%   start with nothing
%   end up with a random sample of image patches, M
%   save patches sample to ../patches

n = 1000; 
cut = 0.2; 
k = 15;
dim = 81;
imgPath = './van-hateren-images/';

% [3 by 3 patches, corresponding 9 by 9 patches, coordinates in R8]
patches = createPatchSample(n, m, cut, k, dim, imgPath);



dataPath = './patches/';
idString = sprintf('n%d_m%d_cut%.02f_k%d_dim%d', n, m, (cut*100), k, dim);
patches_fname = sprintf('%spatches_%s',dataPath, idString); 
csvwrite(patches_fname, A);
