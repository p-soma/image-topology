

figure, 
for i=1:20
    patch = top20Me19(i,:);
    patch = (patch + 1) /2;
    subplot(4,5,i)
    imshow(reshape(patch,9,9))
end

figure, imshow(e1, 'InitialMagnification','fit')