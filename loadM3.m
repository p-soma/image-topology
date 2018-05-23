function [M3, M9] = loadPatches(m


M3_path = '/mnt/home/somapaul/cmse/van_hateren_study/data/patches/M_3/';
M3 = dlmread('/mnt/home/somapaul/cmse/van_hateren_study/data/patches/M_3/M_3_patches.txt',',');

m3 = dlmread('/mnt/home/somapaul/cmse/van_hateren_study/data/patches/M_3/random_subsamples/M3_sample_5e4_1.txt',',');
m9 = dlmread('/mnt/home/somapaul/cmse/van_hateren_study/data/patches/M_9/random_subsamples/M9_sample_5e4_1.txt',',');
