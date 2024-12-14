y = [4.5,4,3.5,3,2.5];
x = [2.5,3,3.5,4,4.5];
plot(x, y, '.', 'markersize',20)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%q1
clc
clear
I=im2double(imread("Q2\Image_1.tif"));
imtool(I,[]);
gs = rgb2gray(I);
gs(gs>0.5)=1;
gs = (gs)==1;
Z = RGB2BW(I);
imtool(Z,[]);
imtool(gs,[]);

% Read the dimensions of the image.
[rows, columns, ~] = size(I);

% Calculate mean square error of R, G, B.   
mseRImage = (I(:,:,1) - Z(:,:)) .^ 2;
 mseGImage = (I(:,:,2) - Z(:,:)) .^ 2;
mseBImage = (I(:,:,3) - Z(:,:)) .^ 2;

mseR = sum(sum(mseRImage)) / (rows * columns);
mseG = sum(sum(mseGImage)) / (rows * columns);
mseB = sum(sum(mseBImage)) / (rows * columns);

% Average mean square error of R, G, B.
mse = (mseR + mseG + mseB)/3;

% Calculate PSNR (Peak Signal to noise ratio).
PSNR_Value_Z = 10 * log10( 1^2 / mse);

%//////////////////////////////////////////////////////////////

% Read the dimensions of the image.
[rows, columns, ~] = size(I);

% Calculate mean square error of R, G, B.   
mseRImage = (I(:,:,1) - gs(:,:)) .^ 2;
mseGImage = (I(:,:,2) - gs(:,:)) .^ 2;
mseBImage = (I(:,:,3) - gs(:,:)) .^ 2;

mseR = sum(sum(mseRImage)) / (rows * columns);
mseG = sum(sum(mseGImage)) / (rows * columns);
mseB = sum(sum(mseBImage)) / (rows * columns);

% Average mean square error of R, G, B.
mse = (mseR + mseG + mseB)/3;

% Calculate PSNR (Peak Signal to noise ratio).
PSNR_Value_gs = 10 * log10( 1^2 / mse);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% q2 and q3 and q4
clc; clear; close all;
Orginal_Image = (imread("Q4\Peppers.tif"));
LR_Image = (imread("Q4\LR_Peppers.tif"));


Resized_Image1 = My_Imresize_1(LR_Image,2);
Resized_Image2 = My_Imresize_2(LR_Image,2);
Resized_Image3 = My_Imresize_3(LR_Image,2);
Resized_Image5 = imresize(LR_Image,2,"bicubic");
%My_Imresize_4
tic
Resized_Image4 = My_Imresize_4(LR_Image,2);
toc


imtool(LR_Image);
imtool([Resized_Image1 Resized_Image2 Resized_Image3 Resized_Image4 Resized_Image5 Orginal_Image],[]);

Matlab_PSNR1 = psnr(Resized_Image1,Orginal_Image);
My_PSNR1 = MY_PSNR(Orginal_Image,Resized_Image1)
Matlab_PSNR2 = psnr(Resized_Image2,Orginal_Image);
My_PSNR2 = MY_PSNR(Orginal_Image,Resized_Image2)
Matlab_PSNR3 = psnr(Resized_Image3,Orginal_Image);
My_PSNR3 = MY_PSNR(Orginal_Image,Resized_Image3)
Matlab_PSNR4 = psnr(Resized_Image4,Orginal_Image);
My_PSNR4 = MY_PSNR(Orginal_Image,Resized_Image4)
Matlab_PSNR5 = psnr(Resized_Image5,Orginal_Image);
My_PSNR5 = MY_PSNR(Orginal_Image,Resized_Image5)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%q5
Secret_Message = (imread("Q5\Image_1.tif"));
Cover_Image = (imread("Q5\Image_2.tif"));
Stego_Image = Image_Encoder(Cover_Image,Secret_Message);
imtool(Stego_Image,[]);
imwrite(Stego_Image,"Q5\Stego_Image.tif");
s = (imread("Q5\Stego_Image.tif"));
LSB = (bitget(s,1)==1);
imtool(LSB);
Exteracted_Secret_Message = Image_Decoder(s);
imtool(Exteracted_Secret_Message);