close all
clear all

I = imread('lenna_64.jpg');
figure, imshow(I)

% magnification
w = 4;
l = 4;

% bilinear zoom
I_256 = bilinearzoom(I,w,l);

I_256 = uint8(I_256);% for display 

figure, imshow(I_256)

% write the 256*256 image
imwrite(I_256,'lenna_bilinear.jpg')

% function bilinearzoom
function Output = bilinearzoom(A,w,l)

[m,n] = size(A);    % get A size    
% A become (m+1)x(n+1) matrix, Solving the Problem of Boundary Overflow in Index A Matrix
A = [A;zeros(1,n)]; % add 1 row
A = [A zeros(m+1,1)];   % add 1 column


ratio_u = (m - 1) / (w * m - 1); % ratio of the map length
ratio_v = (n - 1) / (l * n - 1); 
         

Output = zeros(w*m,l*n);            % initial image
for j = 1:l*n                    
    z_v = floor((j-1) * ratio_v + 1);     % Integral part 
      v = (j-1) * ratio_v + 1 - z_v;      % Fractional part 
    for i = 1:w*m      
        z_u = floor((i-1) * ratio_u + 1); % Integral part
          u = (i-1) * ratio_u + 1 - z_u;  % Fractional part
          % bilinear interpolation
          Output(i,j) = (1 - u) * (1 - v) * A(z_u,z_v) + ...
                        (1 - u) * v * A(z_u,z_v + 1) + ...
                         u * (1 - v)* A(z_u + 1,z_v) + ...
                         u * v * A(z_u + 1,z_v + 1);
    end
end

end
