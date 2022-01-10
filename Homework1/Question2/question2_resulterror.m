close all
clear all

I = imread('lenna_grey.jpg');
figure, imshow(I)

% Linear quantizer figure
I_lq = imread('lenna_16graylevel.jpg');
figure, imshow(I_lq)

% Random dither figure
I_rd = imread('lenna_dither100.jpg');
figure, imshow(I_rd)

% calculate error of whole picture
Error_1 = double(I_lq) - double(I);
Error_2 = double(I_rd) - double(I);

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