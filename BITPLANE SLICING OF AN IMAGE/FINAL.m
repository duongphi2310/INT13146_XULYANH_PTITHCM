% DOC ANH GOC
image = imread('C:\Users\N20DCCN125\Desktop\XLA\Lena.jpg');

% KIEM TRA XEM ANH CO PHAI ANH MAU HAY KHONG (3 KENH MAU R G B)
% NEU LA ANH MAU, CHUYEN ANH THANH ANH GRAYSCALE (1 KENH MAU - ANH XAM)
if size(image, 3) == 3
    image = rgb2gray(image);
end

% CHUYEN ANH THANH MA TRAN SO NGUYEN 8 BITS.
% (CAC GIA TRI PIXEL NAM TRONG KHOANG 0 - 255)
image = uint8(image);

% KHOI TAO MOT MANG 3D DE LUU TRU 8 MAT PHANG BIT.
bit_planes = zeros(size(image, 1), size(image, 2), 8, 'uint8');

% TACH ANH THANH MAT PHANG 8 BIT
for i = 1:8
    bit_mask = bitshift(1, 8 - i); % TAO MOT MAT PHANG BITMASK
    % AP DUNG BITMASK VAO TUNG PIXEL TRONG ANH GOC
    bit_plane = bitand(image, bit_mask); 
    % DUA MAT PHANG BIT VE DANG ANH NHI PHAN
    bit_plane = bit_plane * 255;
    %  GAN MAT PHANG BIT SAU KHI DA BIEN DOI VAO VI TRI i
    bit_planes(:,:,i) = bit_plane;
end

% HIEN THI TUNG MAT PHANG BIT
for i = 1:8
    subplot(2, 4, i);
    imshow(bit_planes(:,:,i));
    if i == 1
        title('MAT PHANG 0 (MSB)');
    elseif i == 8
        title('MAT PHANG 7 (LSB)');
    else
        title(['MAT PHANG ', num2str(i)]);
    end
end
