clear;
clc;

w_img = imread('w.pgm');
subplot(2, 3, 1)
imshow(w_img); imwrite(w_img, 'w_1.jpg');

% 1st de-sampling
dec1 = w_img(1:2:end, 1:2:end);
subplot(2, 3, 2);
imshow(dec1); imwrite(dec1, 'w_2.jpg');

% 2nd de-sampling
dec2 = dec1(1:2:end, 1:2:end);
subplot(2, 3, 3);
imshow(dec2); imwrite(dec2, 'w_3.jpg');

% 3rd de-sampling
dec3 = dec2(1:2:end, 1:2:end);
subplot(2, 3, 4);
imshow(dec3); imwrite(dec3, 'w_4.jpg');

% 4th de-sampling
dec4 = dec3(1:2:end, 1:2:end);
subplot(2, 3, 5);
imshow(dec4); imwrite(dec4, 'w_5.jpg');

% 5th de-sampling
dec5 = dec4(1:2:end, 1:2:end);
subplot(2, 3, 6);
imshow(dec5); imwrite(dec5, 'w_6.jpg');

%6th de-sampling
dec6 = dec5(1:2:end, 1:2:end);
subplot(2, 3, 6);
imshow(dec6); imwrite(dec6, 'w_6.jpg');
