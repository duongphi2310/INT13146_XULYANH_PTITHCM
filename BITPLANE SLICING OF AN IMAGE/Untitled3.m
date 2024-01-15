% ??c ?nh ??u v�o
img = imread('C:\Users\N20DCCN125\Desktop\XLA\img.png');

% Chuy?n ?nh th�nh ki?u d? li?u s? nguy�n 16 bit ?? gi? l?i t?t c? c�c bit
img = uint16(img);

% T�ch c�c bit b?c cao
bit_depth = 16; % ??i v?i ?nh RGB 8 bit, b?n c� th? thay ??i gi� tr? n�y th�nh 8
high_bits = bitshift(img, bit_depth - 8); % ? ?�y, ta gi? s? bit 8 l� bit b?c cao

% T�ch c�c bit b?c th?p
low_bits = bitand(img, 2^8 - 1); % ? ?�y, ta gi? s? bit 8 l� bit b?c cao

% Hi?n th? c�c m?t ph?ng bit
subplot(1, 2, 1);
imshow(high_bits, []);
title('High Bits (MSB)');

subplot(1, 2, 2);
imshow(low_bits, []);
title('Low Bits (LSB)');
