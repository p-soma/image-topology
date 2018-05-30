function buf = readIML(filename)
% function to read an iml image file into a matrix of pixel intensities
%   param filename string the name of the file to be read
%   returns buf, the matrix of greyscale pixel intensities from the image
    f1 = fopen(filename,'rb','ieee-be');
    w=1536;h=1024;
    buf=fread(f1,[w,h],'uint16');
    colormap(gray);
    imagesc(buf');
end

% 
% original:
% f1 = fopen('imk00001.iml','rb','ieee-be');
% w=1536;h=1024;
% buf=fread(f1,[w,h],'uint16');
% colormap(gray);
% imagesc(buf');