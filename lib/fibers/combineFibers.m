function fiber = combineFibers(datapath, outpath)

    filestr = ls(datapath);
    files = strsplit(filestr);
    files = sort(files);
    files = files(2:end);
    
    fiber = cell(48,32);
    ct = 0;
    for f=files
        fullpath = fullfile(datapath,f);
        load(string(fullpath)); % loaded as nbhd_array
        offset = ct*10000;
        nbhd_array = cellfun(@(x) x + offset,nbhd_array,'UniformOutput',false);
        
        for i=1:48
            for j=1:32
                combined = vertcat(cell2mat(fiber(i,j)), cell2mat(nbhd_array(i,j)));
                fiber(i,j) = mat2cell(combined, size(combined,1));
            end
        end
        ct = ct + 1;
    end
    
    outpath = fullfile(outpath,'fiber');
    save(string(outpath), 'fiber');
end
    
    
    
    
    
    
