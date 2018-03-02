% main pipeline for patch sampling
%   start with nothing
%   end up with a random sample of image patches, M
%   save patches sample to ../patches

n = 5000; 
cut = 0.2; 
dim = 81;
imgPath = './van-hateren-images/';

% get high 9 by 9 patches M9
patches = createPatchSample(n, cut, dim, imgPath);

% save to csv
dataPath = './patches/';
patches_f = fullfile(dataPath,'M9.csv'); 
csvwrite(patches_f, patches);
