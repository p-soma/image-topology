function patches = logMeanAdjust(patches)
% function for pre-processing on patches
%   param patches: an n by dim array of patch vectors
%   returns patches: the patches array after applying 
%       log and subtracting the mean from each coordinate
% for each patch vector in patches:
%   compute log of intensity at each pixel
%   subtract average of all log coordinates from each log coordinate

    % compute log of each patch
    patches = log(patches);
    % subtract mean from each patch
    patches = patches - repmat(mean(patches,2),1,size(patches,2));
end

