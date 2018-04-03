
data = e1s01p03;
figure, 
title('Density filtration of fiber over e1, s=0.1, p=0.3');
idx = 1;
for i=1:10:1000
    patch = data(i,:);
    patch = (patch + 1) * (4/5);
    subplot(10,10,idx)
    imshow(reshape(patch,9,9))
    idx = idx + 1;
end

figure, 
idx = 1;
for i=1001:10:1980
    patch = data(i,:);
    patch = (patch + 1) * (4/5);
    subplot(10,10,idx)
    imshow(reshape(patch,9,9))
    idx = idx + 1;
end

% 
% figure, 
% idx = 1;
% for i=121:240
%     patch = data(i,:);
%     patch = (patch + 1) * (4/5);
%     subplot(10,12,idx)
%     imshow(reshape(patch,9,9))
%     idx = idx + 1;
% end
