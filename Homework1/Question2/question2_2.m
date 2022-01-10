close all
clear all

I = imread('lenna_grey.jpg');
figure, imshow(I)
I_d = zeros(256,256); % new image

% call random dither function
I_d_1 = RandomDithering(I, 0);
I_d_2 = RandomDithering(I, 50);
I_d_3 = RandomDithering(I, 100);
I_d_4 = RandomDithering(I, 150);
I_d_5 = RandomDithering(I, 200);
I_d_6 = RandomDithering(I, 250);

% display images
figure, imshow(I_d_1)
figure, imshow(I_d_2)
figure, imshow(I_d_3)
figure, imshow(I_d_4)
figure, imshow(I_d_5)
figure, imshow(I_d_6)

% save images
imwrite(I_d_1, "lenna_dither0.jpg")
imwrite(I_d_2, "lenna_dither50.jpg")
imwrite(I_d_3, "lenna_dither100.jpg")
imwrite(I_d_4, "lenna_dither150.jpg")
imwrite(I_d_5, "lenna_dither200.jpg")
imwrite(I_d_6, "lenna_dither250.jpg")

% Random dither function

function output = RandomDithering(I, dither)
for i = 1:256
    for j = 1:256
        x = mod( rand(), (2 * dither) - dither);
        if (I(i,j) >= 128)
            output(i,j) = 255;
        else
            output(i,j) = 0;
        end
    end
end
end

            
