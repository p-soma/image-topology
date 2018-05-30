function A = changeCoordinates(patches)
% perform a change of basis so the patches lie on 7D sphere in R8
%   param patches: array of patch vectors
%   returns A: the array of patch vectors on our new coordinate system

    % basis vectors:
    e1 = (1/sqrt(6)) * [1 0 -1 1 0 -1 1 0 -1]';
    e2 = (1/sqrt(6)) * [1 1 1 0 0 0 -1 -1 -1]';
    e3 = (1/sqrt(54)) * [1 -2 1 1 -2 1 1 -2 1]';
    e4 = (1/sqrt(54)) * [1 1 1 -2 -2 -2 1 1 1]';
    e5 = (1/sqrt(8)) * [1 0 -1 0 0 0 -1 0 1]';
    e6 = (1/sqrt(48)) * [1 0 -1 -2 0 2 1 0 -1]';
    e7 = (1/sqrt(48)) * [1 -2 1 0 0 0 -1 2 -1]';
    e8 = (1/sqrt(48)) * [1 -2 1 -2 4 -2 1 -2 1]';

    E = cat(2, e1,e2,e3,e4,e5,e6,e7,e8);

    keepn = size(patches,1);
    
    A = zeros(keepn,8);

    for row=1:keepn
        % solve x = E * a, where x is current coordinates, a is the new system
        A(row,:) = linsolve(E,patches(row,:)');
    end

end

