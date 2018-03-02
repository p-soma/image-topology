figure, 
for i=1:35
subplot(5,7,i)
imshow(reshape(cos(t(i))*U(:,4) + sin(t(i))*U(:,5),3,3))
end