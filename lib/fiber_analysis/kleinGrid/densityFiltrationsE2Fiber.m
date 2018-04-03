% densityFiltrationsE2Fiber

fiberPath = '/mnt/home/somapaul/cmse/van_hateren_study/data/patches/M_9/fibers/grid/dNorm_NN/e2/';

fiberFile = fullfile(fiberPath,'e2.txt');

fiber_e2 = dlmread(fiberFile,',');

S = [0.05, 0.1, 0.15, 0.2, 0.25];
P = [0.1, 0.2, 0.30, 0.40, 0.50];

for s=S
    for p=P
        density_filtration = gaussianDensityFiltration(fiber_e2, s, p);
        filename = strcat('e2_s',num2str(s),'_p',num2str(p),'.txt');
        fullFile = fullfile(fiberPath,'density_filtrations',filename);    
        dlmwrite(fullFile,density_filtration);
    end
end