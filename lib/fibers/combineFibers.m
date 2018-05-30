function fiber = combineFibers(datapath, outpath)

    filestr = ls(datapath);
    files = strsplit(filestr);
    files = files(1:end-1);
    
    fiber = cell(32,32);
    ct = 0;
    for f=files
        fullpath = fullfile(datapath,f);
        load(string(fullpath)); % loaded as nbhd_array
        offset = ct*10000;
        nbhd_array = cellfun(@(x) x + offset,nbhd_array,'UniformOutput',false);
        
        for i=1:32
            for j=1:32
                combined = vertcat(cell2mat(fiber(i,j)), cell2mat(nbhd_array(i,j)));
                fiber(i,j) = mat2cell(combined, size(combined,1));
            end
        end
        ct = ct + 1;
    end
    
    outpath = fullfile(outpath,'combined_fiber');
    save(string(outpath), 'fiber');
end
    
    
    
    
    
    