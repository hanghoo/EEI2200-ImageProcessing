close all
clear all

I = imread('lenna_64.jpg');
figure, imshow(I)

% Nearest-Neighbor interpolation to 128x128
for i = 1:128
    for j = 1:128
        I_128(i,j) = I(round(i/2),round(j/2));
    end
end

figure, imshow(I_128)

% Nearest-Neighbor interpolation to 256x256
for i = 1:256
    for j = 1:256
        I_256(i,j) = I_128(round(i/2),round(j/2));
    end
end

figure, imshow(I_256)

% write the 256*256 image
imwrite(I_256,'lenna_NNI.jpg')