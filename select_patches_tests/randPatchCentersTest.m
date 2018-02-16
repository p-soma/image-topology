% testing for randPatchCenters.m
addpath(genpath('/Users/paulsoma/Documents/academic/pa_cmse/persistent_homology_research/van_hateren/lib/select_patches'));

% test 200 iterations of for 3x3 patches
n1 = 10;
dim1 = 9;
sz1 = [30, 30];
badIDX1 = [1,2,3,28,29,30];

for i=1:200
    [r1, c1] = randPatchCenters(n1, dim1, sz1);
    badRows1 = numel(intersect(r1,badIDX1));
    badCols1 = numel(intersect(c1,badIDX1));
    assert(badRows1 == 0);
    assert(badCols1 == 0);
end

% test 200 iterations of for 9x9 patches
n2 = 50;
dim2 = 81;
sz2 = [1000, 1000];
badIDX2 = [1,2,3,4,5,6,995,996,997,998,999,1000];

for j=1:200
    [r2, c2] = randPatchCenters(n2, dim2, sz2);
    badRows2 = numel(intersect(r2,badIDX2));
    badCols2 = numel(intersect(c2,badIDX2));
    assert(badRows2 == 0);
    assert(badCols2 == 0);
end
