function patch = blobPatch(sdx,mx,sdy,my,method);
    lim = 1;
    dim = 9;
    
    x = linspace(-lim,lim,dim);
    y = linspace(-lim,lim,dim);
    
    if strcmp(method,'cos')
        X = cos(x);
        Y = cos(y);
    elseif strcmp(method,'gauss')
        X = gaussmf(x,[sdx,mx]);
        Y = gaussmf(y,[sdy,my]);
    end
    
    [a,b] = meshgrid(X,Y);

    patch = a+b;

    patch = reshape(patch,1,(dim^2));
    patch = patch - mean(patch,2);
    dNorm = getPatchDNorms(patch);
    patch = patch / dNorm;
    
    
    % patchdisp = (patch + 1) * (4/5);
    % patchdisp = reshape(patchdisp,dim,dim);
    % figure;
    % subplot(1,2,1);
    % imshow(patchdisp)
    
end