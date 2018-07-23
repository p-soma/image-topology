function fib = loadFiber(i,j,type)

    % load fiber
    folder = '/Users/paulsoma/Google Drive/JLM_PAS/PyVH/fiber_data/singles';

%     i = 0;
%     j = 0;
%     type = 'log_prior';

    filename = strcat('fiber_',type,'_',num2str(i),'_',num2str(j),'.mat');

    path = fullfile(folder,filename);

    fib = load(path);

    % fib.coarse_imagees
    % fib.CUDLR_dists
    % fib.fiberlist
    % fib.fine_images

end


