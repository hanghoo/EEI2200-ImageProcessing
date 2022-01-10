close all
clear all

I = imread('lenna_grey.jpg');
figure, imshow(I)

% down-sample image
for i = 1:64
    for j = 1:64
        I_64(i,j) = I(4*i, 4*j);
    end
end

figure, imshow(I_64)

% write the 64*64 image
imwrite(I_64,'lenna_64.jpg')