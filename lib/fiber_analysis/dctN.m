% DCT basis in RN

x = linspace(0,pi,9);
y = linspace(0,pi,9);

freq_x = 0:8;
freq_y = 0:8;


[X,Y] = meshgrid(x,y);

patch = cos(X*freq_x(1)/2)*cos(Y*freq_y(1)/2)

