
data = fiberovere110knn;
figure, 
idx = 1;
for i=1:100:10000
    patch = data(i,:);
    patch = (patch + 1) /2;
    subplot(10,10,idx)
    imshow(reshape(patch,9,9))
    idx = idx + 1;
end

