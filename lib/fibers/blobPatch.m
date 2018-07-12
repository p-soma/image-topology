function patch = blobPatch(lim);

    x = linspace(-lim,lim,9)
    %X = gaussmf(x,[1,0])
    X = cos(x);
    y = linspace(-lim,lim,9)
    %Y = gaussmf(y,[1,0])
    Y = cos(y);
    [a,b] = meshgrid(X,Y)

    patch = a+b

    patch = reshape(patch,1,81)
    patch = patch - mean(patch,2)
    patch = (patch + 1) * (4/5)
    patch = reshape(patch,9,9)
    figure;
    subplot(1,2,1);
    imshow(patch)
    
end