% tests for pixelate function

% test 9x9 -> 3x3
n1 = 20;
dim_init = 81;
dim_final = 9;

% create test matrix where each coordinate has its row index as a value
rowints = zeros(n1,dim_init);
for i=1:n1
    rowints(i,:) = i * ones(1,dim_init);
end

p1 = pixelate(rowints, n1, dim_init, dim_final);
expected1 = repmat((1:n1)',[1 dim_final]);
assert(isequal(p1,expected1));


% create test matrix where each coordinate has its column index as a value
n2 = 10;
colints = zeros(n2,81);
for j=1:81;
    colints(:,j) = j * ones(1,n2);
end

p2 = pixelate(colints, n2, dim_init, dim_final);
expected2 =repmat([11 14 17 38 41 44 65 68 71]', [1 n2])'
assert(isequal(p2,expected2));


