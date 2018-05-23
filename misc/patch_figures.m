
data = pts;

%for j=1:5
figure, 
idx = 1;
start = 1; %(j-1)*100 + 1;
step = 5;
finish = 250; %start + 99;
%inds = randperm(size(data,1),50);

for k=start:step:finish
    patch = data(k,:);
    patch = (patch + 1) * (3/5);
    subplot(10,10,idx)
    imshow(reshape(patch,3,3))
    idx = idx + 1;
end