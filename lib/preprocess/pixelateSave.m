function M_9_as_3by3 = pixelateSave(M_9_path)
% wrapper function for pixelate to load M_9 and save the pixelated mapping
%   onto R9

    M_9_file = fullfile(M_9_path,'M_9_patches.txt');
    M_9 = csvread(M_9_file);

    M_9_as_3by3 = pixelate(M_9, 81, 9);
    
    savefile = 'M_9_as_3by3.txt';
    savepath = fullfile(M_9_path,savefile);
    dlmwrite(savepath, M_9_as_3by3, 'delimiter', ',', 'precision', 6);
    
end 