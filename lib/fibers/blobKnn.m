% script to find nearest neighbors to blob patch

% blob patch parameters
% mean and stadard deviation in x (horizontal) and y (vertical) direction
% for gaussian distributions evaluated to generate patch

sdx = 1;
mx = 0;
sdy = 1;
my = 0;

target = blobPatch(sdx,mx,sdy,my);

patches = dlmread('/mnt/home/somapaul/cmse/van_hateren_study/data/patches/M9/M9_log_meansub_dNormalize_pixelated_meansub_dNormalize',',')


Idx = knnsearch(patches,target);

dlmwrite('gaussblob_sd1_m0.txt',Idx,',')