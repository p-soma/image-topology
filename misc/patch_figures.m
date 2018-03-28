
data = K1;
figure, 
idx = 1;
for i=1:10:900
    patch = data(i,:);
    patch = (patch + 1) * (4/5);
    subplot(10,9,idx)
    imshow(reshape(patch,3,3))
    idx = idx + 1;
end

