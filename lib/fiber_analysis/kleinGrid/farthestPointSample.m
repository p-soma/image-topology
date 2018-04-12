function samp = farthestPointSample(X, n)
% return a furthest point sample of n points chosen from X
    
    seed = randi(size(X,1));
    
    samp(1,:) = X(seed,:);
    X(seed,:) = [];
    
    ct = 2;
    while ct <= n
        distMat = pdist2(X,samp);
        [m, i] = max(distMat);
        [l, j] = max(m);
        idx = i(j);
        samp(ct,:) = X(idx,:);
        X(idx,:) = [];
        ct = ct+1;
    end

end
