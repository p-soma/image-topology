function [patches, angles, sz] = evenKleinGrid(gensize)
% gensize is size to use generating even parameters
    normalize = 'dnorm';

    [patches, angles, sz] = kleinGrid(gensize, normalize);
    [distA_naive, distB_naive, interpAinv, interpBinv] = generateKleinAngles(patches, angles, sz);
    for i=1:5
        [distA, distB, interpAinv, interpBinv] = generateKleinAngles(patches, angles, sz);
        [patches, angles, sz] = kleinGridAng(interpAinv,interpBinv, normalize);
    end

anglesA = interpAinv(1:2:sz(2));
anglesB = interpBinv(1:2:sz(1));

[patches, angles, sz] = kleinGridAng(anglesA, anglesB, normalize);
end
