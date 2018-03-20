e1 =  [1 1 1 0 0 0 -1 -1 -1];
e2 =  [1 0 -1 1 0 -1 1 0 -1];

e3 =  [1 1 1 -2 -2 -2 1 1 1];
e4 =  [1 -2 1 1 -2 1 1 -2 1];

e5 =  [1 0 -1 0 0 0 -1 0 1];
e6 =  [1 -2 1 0 0 0 -1 2 -1];

e7 =  [1 0 -1 -2 0 2 1 0 -1];
e8 =  [1 -2 1 -2 4 -2 1 -2 1];

c1 = 1 / sqrt(6);
c2 = 1 / sqrt(6);
c3 = 1 / sqrt(54);
c4 = 1 / sqrt(54);
c5 = 1 / sqrt(8);
c6 = 1 / sqrt(48);
c7 = 1 / sqrt(48);
c8 = 1 / sqrt(216);

E(:,:,1) = e1;
E(:,:,2) = e2;
E(:,:,3) = e3;
E(:,:,4) = e4;
E(:,:,5) = e5;
E(:,:,6) = e6;
E(:,:,7) = e7;
E(:,:,8) = e8;


figure, 
for i=1:8
    e = E(:,:,i);
    e = reshape(e, [3 3])
    subplot(2,4,i);
    imshow(e, [])
    box on
end
