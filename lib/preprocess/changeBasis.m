function X_ = changeBasis(X) 
% change basis onto the DCT basis
%   param X point cloud of 3 by 3 patches

    [lam, A] = DCTBasis();
    X_ = lam * A' * X';
    X_ = X_';
end