% densityFiltrationsE1Fiber
addpath('/mnt/home/somapaul/cmse/van_hateren_study/software/image-topology/lib');
addpath('/mnt/home/somapaul/cmse/van_hateren_study/software/image-topology/lib/fiber_analysis/kleinGrid');
addpath('/mnt/home/somapaul/cmse/van_hateren_study/software/image-topology/lib/preprocess');
addpath('/mnt/home/somapaul/cmse/van_hateren_study/software/image-topology/misc/');

fiberPath = '/mnt/home/somapaul/cmse/van_hateren_study/data/patches/M_9/fibers/grid/dNorm_NN/e1/';

fiberFile = fullfile(fiberPath,'e1.txt');

fiber_e1 = dlmread(fiberFile,',');

S = [0.05, 0.1, 0.15, 0.2, 0.25];
P = [0.1, 0.2, 0.30, 0.40, 0.50];

for s=S
    for p=P
        density_filtration = gaussianDensityFiltration(fiber_e1, s, p);
        filename = strcat('e1_s',num2str(s),'_p',num2str(p),'.txt');
        fullFile = fullfile(fiberPath,'density_filtrations',filename);    
        dlmwrite(fullFile,density_filtration);
    end
end