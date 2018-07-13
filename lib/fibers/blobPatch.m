function patch = blobPatch(sdx,mx,sdy,my);
    lim = 1;
    dim = 9;
    
    x = linspace(-lim,lim,dim)
    X = gaussmf(x,[sdx,mx])
    %X = cos(x);
    y = linspace(-lim,lim,dim)
    Y = gaussmf(y,[sdy,my])
    %Y = cos(y);
    [a,b] = meshgrid(X,Y)

    patch = a+b

    patch = reshape(patch,1,(dim^2))
    patch = patch - mean(patch,2)
    patch = (patch + 1) * (4/5)
    patch = reshape(patch,dim,dim)
    figure;
    subplot(1,2,1);
    imshow(patch)
    
end