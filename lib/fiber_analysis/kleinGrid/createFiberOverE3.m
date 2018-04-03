% script to create and save fibers over e1, e2, e3, e4 using closest points
% to each

% import patches data
addpath('/mnt/home/somapaul/cmse/van_hateren_study/software/image-topology/lib');
addpath('/mnt/home/somapaul/cmse/van_hateren_study/software/image-topology/lib/fiber_analysis/kleinGrid');
addpath('/mnt/home/somapaul/cmse/van_hateren_study/software/image-topology/lib/preprocess');

M9 = dlmread('/mnt/home/somapaul/cmse/van_hateren_study/data/patches/M_9/spaces/M_9_patches.txt',',');
M9_map_P3 = dlmread('/mnt/home/somapaul/cmse/van_hateren_study/data/patches/M_9/spaces/M_9_as_3by3.txt',',');
e1_ =  [1 1 1 0 0 0 -1 -1 -1];
e2_ =  [1 0 -1 1 0 -1 1 0 -1];

e3_ =  [1 1 1 -2 -2 -2 1 1 1];
e4_ =  [1 -2 1 1 -2 1 1 -2 1];

e5_ =  [1 0 -1 0 0 0 -1 0 1];
e6_ =  [1 -2 1 0 0 0 -1 2 -1];

e7_ =  [1 0 -1 -2 0 2 1 0 -1];
e8_ =  [1 -2 1 -2 4 -2 1 -2 1];

c1 = 1 / sqrt(6);
c2 = 1 / sqrt(6);
c3 = 1 / sqrt(54);
c4 = 1 / sqrt(54);
c5 = 1 / sqrt(8);
c6 = 1 / sqrt(48);
c7 = 1 / sqrt(48);
c8 = 1 / sqrt(216);

e1 = c1*e1_;
e2 = c2*e2_;
e3 = c3*e3_;
e4 = c4*e4_;
e5 = c5*e5_;
e6 = c6*e6_;
e7 = c7*e7_;
e8 = c8*e8_;

E = [e1;e2;e3;e4;e5;e6;e7;e8];

K = kleinBottleGrid(33);

% output paths for fibers
fiberPath = '/mnt/home/somapaul/cmse/van_hateren_study/data/patches/M_9/fibers/grid/';

e = E(3,:);
[idx, fiber] = createFiber(K, M9_map_P3, M9, e);
filename = strcat('e',num2str(3),'.txt');
fullFile = fullfile(fiberPath,filename);    
dlmwrite(fullFile,fiber);









