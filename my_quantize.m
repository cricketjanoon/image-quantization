function [quantized_image] = my_quantize(image, thresholds)

[r, c] = size(image);
quantized_image = image;
thresholds = [0 thresholds 255];
[~, threshold_levels] = size(thresholds);

for i=1:r
    for j=1:c
        pixel_value = image(i, j);
        %prev_value = thresholds(1);
        for k=2:threshold_levels
            prev_value = thresholds(k-1);
            cur_value = thresholds(k);
            if pixel_value >= prev_value & pixel_value < cur_value
                quantized_image(i, j) =  cur_value; %(prev_value+cur_value) / 2;
            end
            prev_value = cur_value;
        end
    end
end

end