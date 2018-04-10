function [lam, A] = DCTBasis()

    e1_ =  [1 1 1 0 0 0 -1 -1 -1];
    e2_ =  [1 0 -1 1 0 -1 1 0 -1];
    e3_ =  [1 1 1 -2 -2 -2 1 1 1];
    e4_ =  [1 -2 1 1 -2 1 1 -2 1];
    e5_ =  [1 0 -1 0 0 0 -1 0 1];
    e6_ =  [1 -2 1 0 0 0 -1 2 -1];
    e7_ =  [1 0 -1 -2 0 2 1 0 -1];
    e8_ =  [1 -2 1 -2 4 -2 1 -2 1];

    c1 = 1 / sqrt(6);
    c2 = 1 / sqrt(6);
    c3 = 1 / sqrt(54);
    c4 = 1 / sqrt(54);
    c5 = 1 / sqrt(8);
    c6 = 1 / sqrt(48);
    c7 = 1 / sqrt(48);
    c8 = 1 / sqrt(216);

    e1 = c1*e1_;
    e2 = c2*e2_;
    e3 = c3*e3_;
    e4 = c4*e4_;
    e5 = c5*e5_;
    e6 = c6*e6_;
    e7 = c7*e7_;
    e8 = c8*e8_;

    E = [e1;e2;e3;e4;e5;e6;e7;e8];

    A = E';

    figure, 
    for i=1:8
        e = E(i,:);
        e = reshape(e, [3 3]);
        subplot(2,4,i);
        imshow(e, [])
        box on
    end

    lam = [norm(e1)^2,norm(e2)^2,norm(e3),norm(e4),norm(e5),norm(e6),norm(e7),norm(e8)];
    lam = lam .^ 2;
    lam = 1 ./ lam;
    lam = diag(lam);
    
end