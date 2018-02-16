function V = pixelateOne(patch)
% fucntion to pixelate one patch
%   example: take the mean of each disjoint 3x3 sub-patch in a9x9 patch,
%   creating a 3x3 patch

patch3 = zeros(9,1);
idx = 1;
for i=1:3:7;
    c = i:i+2;
    for j=1:3:7;
        r = j:j+2;
        sub_patch = patch(r,c,1);
        patch3(idx) = mean(sub_patch(:));
        idx = idx + 1;
    end
end
V = patch3;

end
