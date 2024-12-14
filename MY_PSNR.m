function [Result] = MY_PSNR(Orginal_Image,Reconstructed_Image)
Result = 10*log10((1^2)/MY_MSE(Orginal_Image,Reconstructed_Image));
end