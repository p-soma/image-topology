
data = fibe1;
figure, 
idx = 1;
for i=1:150
    patch = data(i,:);
    patch = (patch + 1) * (4/5);
    subplot(10,15,idx)
    imshow(reshape(patch,9,9))
    idx = idx + 1;
    title(i);
end

figure, 
idx = 1;
for i=151:300
    patch = data(i,:);
    patch = (patch + 1) * (4/5);
    subplot(10,15,idx)
    imshow(reshape(patch,9,9))
    idx = idx + 1;
    title(i);
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
