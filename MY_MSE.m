function [Result] = MY_MSE(Orginal_Image,Reconstructed_Image)
Error = (im2double(Orginal_Image(:)) - im2double(Reconstructed_Image(:))).^2;
Result = sum(Error)/numel(Error);
end