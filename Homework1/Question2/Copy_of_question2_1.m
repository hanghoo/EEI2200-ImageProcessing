close all
clear all

I = imread('lenna_grey.jpg');
figure, imshow(I)

% linear quantizer
I16 = histeq(I,16); % 4-bits gray level

figure, imshow(I16)

% write the 4-bits gray-level image
imwrite(I16,'lenna_16graylevel.jpg')