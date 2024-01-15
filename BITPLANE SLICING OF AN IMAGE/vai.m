% ??c ?nh ??u vào
inputImage = imread('C:\Users\N20DCCN125\Desktop\XLA\img.png');

% Chuy?n ?nh ??u vào sang ?nh grayscale (n?u không ph?i)
if size(inputImage, 3) == 3
    inputImage = rgb2gray(inputImage);
end

% L?y kích th??c c?a ?nh
[rows, cols] = size(inputImage);

% Kh?i t?o ma tr?n l?u tr? các m?t ph?ng bit
bitPlanes = zeros(rows, cols, 8);

% Tách các m?t ph?ng bit t? MSB ??n LSB
for i = 1:8
    % T?o m?t ph?ng bit th? i b?ng cách chia l?y ph?n nguyên cho 2^i
    bitPlanes(:, :, i) = bitget(inputImage, i);
end

% Hi?n th? các m?t ph?ng bit
figure;
for i = 1:8
    subplot(2, 4, i);
    imshow(logical(bitPlanes(:, :, i))); % Hi?n th? d??i d?ng ?nh nh? phân
    title(['Bit Plane ', num2str(i)]);
end

% L?u các m?t ph?ng bit thành các t?p tin ?nh
for i = 1:8
    imwrite(logical(bitPlanes(:, :, i)), ['bit_plane_', num2str(i), '.png']);
end
