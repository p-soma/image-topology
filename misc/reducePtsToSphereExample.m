% reduce points in RN to an N-2 sphere

pts = rand(100,4);
pts_ = pts - mean(pts,2);
norms = sqrt(sum(pts_.^2,2));
pts__ = pts_ ./ norms;


figure, scatter3(pts(:,1),pts(:,2),pts(:,3))
figure, scatter3(pts_(:,1),pts_(:,2),pts_(:,3))
figure, scatter3(pts__(:,1),pts__(:,2),pts__(:,3))
