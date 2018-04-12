
data = samp;

for j=1:5
    figure, 
    idx = 1;
    start = (j-1)*100 + 1;
    finish = start + 99;
    for i=start:finish
        patch = data(i,:);
        patch = (patch + 1) * (4/5);
        subplot(10,10,idx)
        imshow(reshape(patch,3,3))
        idx = idx + 1;
    end
end
% 
% data = m3;
% 
% for j=1:5
%     figure, 
%     idx = 1;
%     start = (j-1)*100 + 1;
%     finish = start + 99;
%     for i=start:finish
%         patch = data(i,:);
%         patch = (patch + 1) * (4/5);
%         subplot(10,10,idx)
%         imshow(reshape(patch,3,3))
%         idx = idx + 1;
%     end
% end

% figure, 
% title('Density filtration of fiber over e1, s=0.1, p=0.3');
% idx = 1;
% for i=1001:10:1970
%     patch = data(i,:);
%     patch = (patch + 1) * (4/5);
%     subplot(10,10,idx)
%     imshow(reshape(patch,9,9))
%     idx = idx + 1;
% end


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
