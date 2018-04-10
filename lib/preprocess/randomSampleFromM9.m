addpath('/mnt/home/somapaul/cmse/van_hateren_study/software/image-topology/lib');
addpath('/mnt/home/somapaul/cmse/van_hateren_study/software/image-topology/lib/fiber_analysis/kleinGrid');
addpath('/mnt/home/somapaul/cmse/van_hateren_study/software/image-topology/lib/preprocess');
addpath('/mnt/home/somapaul/cmse/van_hateren_study/software/image-topology/misc/');


M9 = dlmread('/mnt/home/somapaul/cmse/van_hateren_study/data/patches/M_9/spaces/M_9_patches.txt');


idx = randperm(size(M9,1),5e4);

M9_sample = M9(idx,:);

dlmwrite('/mnt/home/somapaul/cmse/van_hateren_study/data/patches/M_9/random_subsamples/M9_sample_5e4_1.txt',M9_sample,',');



