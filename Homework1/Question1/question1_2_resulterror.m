close all
clear all

I = imread('lenna_grey.jpg');
figure, imshow(I)

% Nearest-Neighbor interpolation figure
I_NNI = imread('lenna_NNI.jpg');
figure, imshow(I_NNI)

% Bilinear interpolation figure
I_bilinear = imread('lenna_bilinear.jpg');
figure, imshow(I_bilinear)

% calculate error of whole picture
Error_1 = double(I_NNI) - double(I);
Error_2 = double(I_bilinear) - double(I);

errorValue_1 = 0;
errorValue_2 = 0;

% calculate accumulated error
for i = 1:256
    for j = 1:256
        errorValue_1 = errorValue_1 + abs(double(Error_1(i,j)));
        errorValue_2 = errorValue_2 + abs(double(Error_2(i,j)));
    end
end

% calculate the average error
averageError_1 = errorValue_1 / (256 * 256);
averageError_2 = errorValue_2 / (256 * 256);