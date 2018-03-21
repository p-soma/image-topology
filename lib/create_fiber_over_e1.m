 M9 = csvread('/mnt/home/somapaul/cmse/van_hateren_study/data/patches/M_9/M_9_patches.csv');
 
 M3 = csvread('/mnt/home/somapaul/cmse/van_hateren_study/data/patches/M_9/M_9_as_3by3.csv');
 
 e1 =  [1 1 1 0 0 0 -1 -1 -1];
 
 [IDX, D] = knnsearch(M3,e1,'K',10000);
 
 fiber = M9(IDX,:);
 
 csvwrite('/mnt/home/somapaul/cmse/van_hateren_study/data/patches/M_9/fiber_over_e1_10knn.csv',fiber);