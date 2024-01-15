% ??c ?nh ??u vào
img = imread('C:\Users\N20DCCN125\Desktop\XLA\img.png');

% Chuy?n ?nh thành ki?u d? li?u s? nguyên 16 bit ?? gi? l?i t?t c? các bit
img = uint16(img);

% Tách các bit b?c cao
bit_depth = 16; % ??i v?i ?nh RGB 8 bit, b?n có th? thay ??i giá tr? này thành 8
high_bits = bitshift(img, bit_depth - 8); % ? ?ây, ta gi? s? bit 8 là bit b?c cao

% Tách các bit b?c th?p
low_bits = bitand(img, 2^8 - 1); % ? ?ây, ta gi? s? bit 8 là bit b?c cao

% Hi?n th? các m?t ph?ng bit
subplot(1, 2, 1);
imshow(high_bits, []);
title('High Bits (MSB)');

subplot(1, 2, 2);
imshow(low_bits, []);
title('Low Bits (LSB)');
