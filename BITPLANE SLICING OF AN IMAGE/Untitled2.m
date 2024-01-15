clc; clear;

A=imread('C:\Users\N20DCCN125\Desktop\XLA\img.png');
[row,col]=size(A);
subplot(3,3,1), imshow(A), title('Original Image');
C=zeros(row,col,8);
for k=1:8
    for i=1:row
        for j=1:col
            C(i,j,k)=bitget(A(i,j),k);        %Bit slicing
        end
    end
    subplot(3,3,k+1), imshow(C(:,:,k)), title(['Bit Plane ',num2str(k-1)]);
end