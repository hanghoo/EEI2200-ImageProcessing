close all
clear all

I = imread('lenna_grey.jpg');
figure, imshow(I)

% linear quantizer
for i = 1:256
    for j = 1:256
        I16(i,j) = I(i,j)/16; % get integer
    end
end
I16 = I16 * 16; % restore intensity

figure, imshow(I16)

% write the 4-bits gray-level image
imwrite(I16,'lenna_16graylevel.jpg')