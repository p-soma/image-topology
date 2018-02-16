% testing for getPatchVectors

% test matrix 10x10 with each value matching its linear index
mat = reshape(1:100,[10 10]);
n = 1;
dim = 9;
sz = size(mat);

[rowidx, colidx] = randPatchCenters(n, dim, sz);

for i=1:100
    patch = getPatchVectors(mat, rowidx, colidx, n, dim);

    assert(patch(1) + 1 == patch(2));
    assert(patch(2) + 1 == patch(3));

    assert(patch(4) == patch(1) + 10);
    assert(patch(4) + 1 == patch(5));
    assert(patch(5) + 1 == patch(6));

    assert(patch(7) == patch(4) + 10);
    assert(patch(7) + 1 == patch(8));
    assert(patch(8) + 1 == patch(9));
    
end