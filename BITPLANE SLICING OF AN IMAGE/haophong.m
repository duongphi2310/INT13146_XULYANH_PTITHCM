% ??c ?nh ??u vào
input_image = imread('C:\Users\N20DCCN125\Desktop\XLA\Lena.jpg');

% S? bit trong ?nh (8-bit)
num_bits = 8;

% T?o m?t cell array ?? l?u tr? ?nh c?a t?ng m?t ph?ng bit
bit_plane_images = cell(1, num_bits);

% T?o m?t th? m?c ?? l?u các ?nh
output_folder = '/MATLAB Drive/List_image/';
if ~exist(output_folder, 'dir')
    mkdir(output_folder);
end

for bit = 0:7
    % Ch?n m?t ph?ng bit
    bit_plane = 2^(bit);

    % T?o m?t ph?ng bit
    bit_plane_images{bit+1} = bitand(input_image, bit_plane);

    % L?u ?nh vào th? m?c
    output_filename = fullfile(output_folder, ['Bit_Plane_', num2str(bit+1), '.png']);
    imwrite(bit_plane_images{bit+1}, output_filename);
end

% T?o m?t m?ng tr?ng cho ?nh k?t qu?
result_image = zeros(size(input_image), 'uint8'); % S? d?ng 'uint8' ?? ??m b?o ki?u d? li?u

% L?p qua t?ng m?t ph?ng bit và thêm chúng vào ?nh k?t qu?
for bit = 1:8
    result_image = imadd(result_image, bit_plane_images{bit});
end

% L?u ?nh k?t qu?
output_filename = fullfile(output_folder, 'Combined_Bit_Planes.png');
imwrite(result_image, output_filename);