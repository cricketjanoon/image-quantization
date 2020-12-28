clear;
clc;

lums_img = imread('lums_g.pgm');
yahya_img = imread('yahya_g.pgm');

quantization_levels = 4;
J = 10;
noise = uint8((J-(-J))*rand(size(lums_img)));

%% Lums Image

subplot(2, 4, 1)
imshow(lums_img); imwrite(lums_img, 'lums_original.jpg');
title('LUSM original')

subplot(2, 4, 2)
threshold1 = multithresh(lums_img, quantization_levels);
quantized_lums = my_quantize(lums_img, threshold1);
[r1, c1] = size(lums_img);
mse_lums = sum(sum((double(lums_img) - double(quantized_lums)).^2)) / (r1*c1);
imshow(quantized_lums, []); imwrite(mat2gray(quantized_lums), sprintf("lums_quantized_%d.jpg", quantization_levels));
title(sprintf('Quantized with %d levels', quantization_levels))
xlabel(sprintf("MSE with original image: %.2f", mse_lums))

subplot(2, 4, 3)
noisy_lums = lums_img + noise;
imshow(noisy_lums, []); imwrite(noisy_lums, 'lums_noisy.jpg');
title(sprintf('Added uniform noise with J=%d', J))

subplot(2, 4, 4)
threshold1 = multithresh(noisy_lums, quantization_levels);
noisy_quantized_lums = my_quantize(noisy_lums, threshold1);
mse_noisy_lums = sum(sum((double(lums_img) - double(noisy_quantized_lums)).^2)) / (r1*c1);
imshow(noisy_quantized_lums, []); imwrite(mat2gray(noisy_quantized_lums), sprintf('lums_noisy_quantized_%d.jpg', quantization_levels));
title(sprintf('Quantized noisy image with %d levels', quantization_levels))
xlabel(sprintf("MSE with original image: %.2f", mse_noisy_lums))


%% Yahya Image

subplot(2, 4, 5)
imshow(yahya_img); imwrite(yahya_img, 'yahya_original.jpg');
title('Yahya Original')

subplot(2, 4, 6)
threshold2 = multithresh(yahya_img, quantization_levels);
quantized_yahya = my_quantize(yahya_img, threshold2);
[r2, c2] = size(yahya_img);
mse_yahya = sum(sum((double(yahya_img)-double(quantized_yahya)).^2)) / (r2*c2);
imshow(quantized_yahya, []); imwrite(mat2gray(quantized_yahya), sprintf('yahya_quantized_%d.jpg', quantization_levels));
title(sprintf('Quantized with %d levels', quantization_levels))
xlabel(sprintf("MSE with original image: %.2f", mse_yahya))

subplot(2, 4, 7)
noisy_yahya = yahya_img + noise;
imshow(noisy_yahya, []); imwrite(noisy_yahya, 'yahya_noisy.jpg');
title(sprintf('Added uniform noise with J=%d', J))

subplot(2, 4, 8)
threshold2 = multithresh(noisy_yahya, quantization_levels);
noisy_quantized_yahya = my_quantize(noisy_yahya, threshold2);
mse_noisy_yahya = sum(sum((double(yahya_img)-double(noisy_quantized_yahya)).^2)) / (r2*c2);
imshow(noisy_quantized_yahya, []); imwrite(mat2gray(noisy_quantized_yahya), sprintf('yahya_noisy_quantized_%d.jpg', quantization_levels))
title(sprintf('Quantized noisy image with %d levels', quantization_levels))
xlabel(sprintf("MSE with original image: %.2f", mse_noisy_yahya))