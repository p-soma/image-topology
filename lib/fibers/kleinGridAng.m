function [patches, angles, sz] = kleinGridAng(anglesA,anglesB, normalize)
    % function to generate 3x3 patches on the Klein bottle according to Dr.
    %   Perea's model in 'A Klein Bottle Based Dictionary for Texture
    %   Representation'. Generated patches are evenly spaced in the
    %   parameter space
    %
    % param anglesA angle parameter for change in rotation
    % param anglesB angle parameter for change in linear/quadratic
    % param normalize gives the normalization method, one of 
    %   'euclidean' or 'dnorm'

    % generate parameter angles (a,b), where a in (pi/4, 5pi/4],
    % b in (-pi/2, 3pi/2]
    
    [Agrid, Bgrid] = meshgrid(anglesA,anglesB);
    
    anglesArray = cat(3,Agrid,Bgrid);
    
    angles = num2cell(anglesArray,3);
    angles = cellfun(@squeeze, angles, 'UniformOutput', false);
    
    % generate patches from parameters
    patches = arrayfun(@kleinPatch, angles,'UniformOutput', false);
    
    % mean subtracting
    patches = cellfun(@(x) x - mean(x,2), patches ,'UniformOutput', false);
    
    % normalize by dnorm or euclidean
    if strcmp(normalize,'dnorm') == true
        norms = cellfun(@(x) getPatchDNorms(x), patches, 'UniformOutput', false);
    elseif strcmp(normalize, 'euclidean') == true
        norms = cellfun(@(x) norm(x), patches, 'UniformOutput', false);
    end
    
    patches = cellfun(@(a,b) a / b, patches, norms, 'UniformOutput', false);
    sz = size(patches);
    
end
