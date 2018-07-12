
data = patches;
[ii, jj] = size(data);
%for j=1:5
figure, 
idx = 1;
for i=1:ii
    for j=1:jj
        patch = data{i,j};
        patch = (patch + 1) * (4/5);
        subplot(ii,jj,idx);
        imshow(reshape(patch,3,3));
        idx = idx + 1;
    end
end
% 
% data = patches;
% 
% IDX = [1,25;13,1]
% for i=1:2
%     patch = data{IDX(i,:)};
%     patch = (patch + 1) * (4/5);
%     subplot(1,2,i);
%     imshow(reshape(patch,3,3));
% end
