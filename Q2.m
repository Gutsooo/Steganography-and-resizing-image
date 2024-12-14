clc
clear

I=im2double(imread("Q4\Peppers.tif"));

BW = Grayscale2BW(I);
[MY_PSNR(I,I) MY_PSNR(I,BW)];
imtool([I BW]);


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