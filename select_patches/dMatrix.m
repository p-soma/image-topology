afunction D = dMatrix(dim)
%function to compute the D-matrix of a patch vector of length n
%   param n: length of patch vector
%   returns D, the D-matrix for calculating the D-norm of patch vector of
%       dimension d

N = sqrt(dim);

% our return matrix
D = zeros(N^2,N^2);

% linear indices of corner pixels in M
M_corners = [1, N, 1 + N^2 - N, N^2];
% linear indices in D for corners, square term has multiplicity 2
corners = sub2ind(size(D),M_corners,M_corners);

% linear indices of edge pixels in M
M_edges = cat(2, 2:N-1, N+1:N:(N^2-N), (2*N):N:(N^2-N), (2+ N^2 - N):(N^2-1));
% linear indices in D for corners, square term has multiplicity 3
edges = sub2ind(size(D),M_edges,M_edges);

% linear indices of all other pixels
M_middles = setdiff(1:N^2,cat(2,M_corners,M_edges));
% linear indices in D for pixels where square term has multiplicity 4
middles = sub2ind(size(D),M_middles,M_middles);

% pairs of linear indices of adjacent pixels
h_neighbors = cat(1,[1:N^2-N; N+1:N^2]',[N+1:N^2 ;1:N^2-N]');
v_neighbors_1 = [setdiff([1:N^2],[0:N:N^2]); setdiff([1:N^2],[1:N:N^2])]';
v_neighbors_2 = [setdiff([1:N^2],[1:N:N^2]); setdiff([1:N^2],[0:N:N^2])]';

v_neighbors = cat(1,v_neighbors_1,v_neighbors_2);
M_neighbors = cat(1,h_neighbors,v_neighbors);
neighbors = sub2ind(size(D),M_neighbors(:,1),M_neighbors(:,2));

D(neighbors) = -1;
D(corners) = 2;
D(edges) = 3;
D(middles) = 4;

end

