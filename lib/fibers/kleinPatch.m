function patch = kleinPatch(c)
    % function to create one patch on the klein bottle
    % param cell 
    
    angles = cell2mat(c);
    % abcd = [a; b; c; d]
    abcd = cell2mat(arrayfun(@(x) [cos(x),sin(x)]',angles,'UniformOutput',false));
    
    a = abcd(1);
    b = abcd(2);
    c = abcd(3);
    d = abcd(4);
    
    x = [-1 0 1];
    y = [-1 0 1];
    
    [X,Y] = meshgrid(x,y);
    
    patch = c*(a*X + b*Y).^2 + d*(a*X + b*Y);
    
    patch = reshape(patch,1,9);

%     % subtract mean
%     patch = patch - mean(patch);
%     % normalize by Euclidean norm
%     n = getPatchDNorms(patch);
%     % n = norm(patch);
%     patch = patch / n;