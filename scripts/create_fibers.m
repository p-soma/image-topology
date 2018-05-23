addpath('/mnt/home/somapaul/cmse/van_hateren_study/software/Van_Hat_Temp');
addpath('/mnt/home/somapaul/cmse/van_hateren_study/software/image-topology/lib');
addpath('/mnt/home/somapaul/cmse/van_hateren_study/software/image-topology/lib/fiber_analysis/kleinGrid');
addpath('/mnt/home/somapaul/cmse/van_hateren_study/software/image-topology/lib/preprocess');



M9 = dlmread('/mnt/home/somapaul/cmse/van_hateren_study/data/patches/M_9/spaces/M_9_patches.txt',',');
M9_map_P3 = dlmread('/mnt/home/somapaul/cmse/van_hateren_study/data/patches/M_9/spaces/M_9_as_3by3.txt',',');

gridsize = 16;
[klein_pts,dim,distf,numpts,angles,Qcoeff] = GD_Klein_Grid(gridsize);

% find nearest neighbor on the klein bottle for each point in y
[IDX, D] = knnsearch(K,y,'K',1);
dNormDistFun = @(x,Z)dNormDist(x,Z)';
[IDX, D] = knnsearch(K,y,'K',1,'Distance',dNormDistFun);

for b=klein_pts
    

