function [distA, distB, interpAinv, interpBinv] = generateKleinAngles(patches, angles, sz)
% generate parameter angles evenly distributed along the klein bottle in
%   its embedded space
%     matsize = 16;
%     normalize = 'dnorm';
%     [patches, angles, sz] = kleinGrid(matsize,normalize);

    % angles(1): linear-quadratic
    % angles(2): direction

    cumDist = 0;
    distA = zeros(sz(2)+1,2);

    % traversal changing direction
    for j=1:sz(2)
        j2 = mod(j,sz(2))+1;
        stepDist = 0;
        for i=1:sz(1)
            if j2 == 1 && i ~= 1 % Two different cases
                i2 = sz(1) + 2 - i;
            else
                i2 = i;
            end
            p1 = cell2mat(patches(i,j));
            p2 = cell2mat(patches(i2,j2));
            stepDist = stepDist + dNormDist(p1,p2);
        end
        stepDist = stepDist / sz(1);
        cumDist = cumDist + stepDist;
        ang = angles{i,j2}(1);
        if ang == 0
            ang = pi;
        end
        distA(j+1,:) = [ang; cumDist];
    end
    
    
    cumDist = 0;
    distB = zeros(sz(1)+1,2);

    % traversal linear to quadratic
    for i=1:sz(1)
        i2 = mod(i,sz(1))+1;
        stepDist = 0;
        for j=1:sz(2)
            p1 = cell2mat(patches(i,j));
            p2 = cell2mat(patches(i2,j));
            stepDist = stepDist + dNormDist(p1,p2);
        end
        stepDist = stepDist / sz(2);
        cumDist = cumDist + stepDist;
        ang = angles{i2,j}(2);
        if ang == 0
            ang = 2*pi;
        end
        distB(i+1,:) = [ang; cumDist];
    end
    

    
    diffsA = zeros(sz(2),1);
    diffsB = zeros(sz(1),1);
    for i = 1:(sz(1)-1)
        diffsB(i) = distB(i+1,2) - distB(i,2);
    end
    for j = 1:(sz(2)-1)
        diffsA(j) = distA(j+1,2) - distA(j,2);
    end

    nA = sz(2);
    nB = sz(1);
    
    maxA = max(distA(:,2));
    maxB = max(distB(:,2));
    
    % evenly distributed distances
    xA = linspace(0,maxA-(maxA/nA),nA);
    xB = linspace(0,maxB-(maxB/nB),nB);
    % interpolation of inverse of distance function distA
    interpAinv = interp1(distA(:,2),distA(:,1),xA);
    interpBinv = interp1(distB(:,2),distB(:,1),xB);
    
%     aSamp = interpAinv(1:8:nA);
%     bSamp = interpBinv(1:8:nB);
    
%     anglesA = interpAinv(aSamp);
%     anglesB = interpBinv(bSamp);
    

% figure; 
% scatter(distA(:,1),distA(:,2),'r*')
% title('distA')
%hold on;
%scatter(xA,interpAinv,'b.')

% figure; 
% scatter(distB(:,1),distB(:,2),'r*')
% title('distB')
%hold on;
%scatter(xB,interpBinv,'b.')

% 
% figure; scatter(distA(:,1),diffsA,'r*')
% title('distA')
% figure; scatter(distB(:,1),diffsB,'r*')
% title('distB')

end