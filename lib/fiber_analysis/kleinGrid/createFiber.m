function [IDX, fiber] = createFiber(K,y,Y,p)
% function to create a fiber over patch p
%   param K the grid of points on the klein bottle
%   param y the base space of points to compare to K
%   param Y the total space Y, with indices corresponding to their mapping
%       in y
%   param p the point in K over which the fiber is extracted

    % find nearest neighbor on the klein bottle for each point in y
    [IDX, D] = knnsearch(K,y,'K',1);
    
    % get index of e1 in K as locb
    [Lia, locb] = ismember(e1,K,'rows');
  
    fiber = Y((IDX == locb),:);
end