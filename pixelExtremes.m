function [gmin, gmax] = pixelExtremes(imgPath)
% find the global minimum and maximum pixel values for the entire set
    filestr = ls(imgPath);
    images = strsplit(filestr);
    images = images(1:end-1);

    gmax = 0;
    gmin = inf;

    for image=images

        filepath = fullfile(imgPath,image);
        buf = readIML(string(filepath));

        lmax = max(max(buf));
        lmin = min(min(buf));

        if lmax > gmax
            gmax = lmax;
        end
        if lmin < gmin
            gmin = lmin;
        end

    end
    
end
