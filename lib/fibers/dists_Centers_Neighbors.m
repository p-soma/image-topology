% function to find distance to centers and four neighbors

% patches 
grid = load('../../../fibers/gridpts.mat');
gridpts = grid.patches;

% fiber (indices)
load('../../../fibers/log_pixelate_fiber.mat');

% 3x3 patch values
%load('../../../fibers/M9_log_pixelated_meansub_dNormalize');
allPatches = M9_log_pixelated_meansub_dNormalize;
gridsz = size(gridpts);

% format: [center, up, down, left, right]
allDists = zeros(size(allPatches,1),5);

for i = 1:gridsz(1)
    % index of 'up' neighbor
    iUp = i-1;
    if iUp == 0
        iUp = sz(1);
    end
    % index of 'down' neighbor
    iDown = i+1;
    if iDown == sz(1)+1
        iDown = 1;        
    end    
    
    for j = 1:gridsz(2)
        % index of 'left' neighbor
        iLeft = i;
        jLeft = j - 1;
        if jLeft == 0
            iLeft = sz(1) + 1 - i;
            jLeft = sz(2);
        end
        % index of 'right' neighbor   
        iRight = i;
        jRight = j + 1;
        if jRight == sz(2) + 1
            iRight = sz(1) + 1 - i;
            jRight = 1;
        end
        center = gridpts{i,j};
        up = gridpts{iUp,j};
        down = gridpts{iDown,j};
        left = gridpts{iLeft,jLeft};
        right = gridpts{iRight,jRight};
        
        % patch indices in the fiber with center gridpts{i,j}
        patchInds = fiber{i,j};     
        checkPatches = allPatches(inds,:);
        
        dCenter = dNormDist(checkPatches,center);
        dUp = dNormDist(checkPatches,up);
        dDown = dNormDist(checkPatches,down);
        dLeft = dNormDist(checkPatches,left);
        dRight = dNormDist(checkPatches,right);
        
        tempDists = horzcat(dCenter, dUp, dDown, dLeft, dRight);
        
        for p=1:size(tempDists,1)
            pInd = patchInds(p);
            allDists(pInd,:) = tempDists(p,:);
        end
    end 
end